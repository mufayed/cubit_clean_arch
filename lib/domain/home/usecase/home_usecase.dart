import 'package:project_name/domain/home/repo/entries_repository.dart';

import '../../../data/models/entries/entries_response.dart';
import '../../../data/sources/network/result/network_error.dart';
import '../../../data/sources/network/result/result.dart';

class HomeUseCase {
  final EntriesRepository _repository;

  HomeUseCase(this._repository);

  Future<Result<EntriesResponse, NetworkError>> getEntries() async {
    return _repository.getEntries();
  }
}
