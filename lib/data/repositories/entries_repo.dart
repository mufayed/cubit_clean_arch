
import '../../utils/environment.dart';
import '../models/entries/entries_response.dart';
import '../sources/network/api_service.dart';
import '../sources/network/layers/network_executor.dart';
import '../sources/network/result/network_error.dart';
import '../sources/network/result/result.dart';

class EntriesRepository {
  Future<Result<EntriesResponse, NetworkError>> getEntries() async {
    return NetworkExecutor.execute<EntriesResponse, EntriesResponse>(
      responseType: EntriesResponse(),
      params: {},
      id: '',
      urlPath: Environment.apiUrl + APIService.entries,
      method: METHOD_TYPE.GET,
    );
  }
}
