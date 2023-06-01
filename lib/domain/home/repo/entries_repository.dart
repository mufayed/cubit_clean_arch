import '../../../data/models/entries/entries_response.dart';
import '../../../data/sources/network/result/network_error.dart';
import '../../../data/sources/network/result/result.dart';

abstract class EntriesRepository {
  Future<Result<EntriesResponse, NetworkError>> getEntries();
}
