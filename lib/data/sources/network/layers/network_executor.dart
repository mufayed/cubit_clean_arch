import 'dart:convert';
import '../../../../di/locator.dart';
import '../result/network_error.dart';
import '../result/result.dart';
import 'network_decoder.dart';
import 'package:dio/dio.dart';
import 'network_connectivity.dart';
import '../interfaces/base_network_model.dart';

enum METHOD_TYPE { POST, GET, DELETE, PUT }

class NetworkExecutor {
  static bool debugMode = true;

  static Future<Result<K, NetworkError>>
      execute<T extends BaseNetworkModel, K>({
    required String urlPath,
    required METHOD_TYPE method,
    required Map<String, dynamic> params,
    String? id, // If u gonna delete or put u will use the id
    required T responseType,
  }) async {
    if (debugMode) print('$method URL: $urlPath params: $params');
    // Check Network Connectivity
    if (await NetworkConnectivity.status) {
      try {
        var _client = locator.get<Dio>();
        // _client.options.headers["authorization"] = "Bearer ${Preferences.access_token}";

        late Response response;
        switch (method) {
          case METHOD_TYPE.POST:
            response = await _client.post(urlPath, data: jsonEncode(params));
            break;
          case METHOD_TYPE.DELETE:
            response = await _client.delete(urlPath + '/$id');
            break;
          case METHOD_TYPE.PUT:
            _client.options.queryParameters = params;
            response = await _client.put(urlPath + '/$id');
            break;
          case METHOD_TYPE.GET:
            _client.options.queryParameters = params;
            response = await _client.get(urlPath);
            break;
        }
        if (debugMode) print('API Response: $response');

        var data = NetworkDecoder.shared
            .decode<T, K>(response: response, responseType: responseType);

        return Result.success(data);

        // NETWORK ERROR
      } on DioError catch (diorError) {
        if (debugMode) {
          print("$urlPath => ${NetworkError.request(error: diorError)}");
        }
        return Result.failure(NetworkError.request(error: diorError));

        // TYPE ERROR
      } on TypeError catch (e) {
        if (debugMode) {
          print("$urlPath => ${NetworkError.type(error: e.toString())}");
        }
        return Result.failure(NetworkError.type(error: e.toString()));
      }

      // No Internet Connection
    } else {
      if (debugMode) {
        print(
            const NetworkError.connectivity(message: 'No Internet Connection'));
      }
      return const Result.failure(
          NetworkError.connectivity(message: 'No Internet Connection'));
    }
  }
}
