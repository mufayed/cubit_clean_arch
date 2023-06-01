import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:project_name/domain/home/repo/entries_repository.dart';

import '../data/repositories/entries_repo_impl.dart';
import '../domain/home/usecase/home_usecase.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerLazySingleton<Dio>(() => getDioClient());

  // Repositories
  locator
      .registerLazySingleton<EntriesRepository>(() => EntriesRepositoryImpl());

  // UseCases
  locator.registerLazySingleton<HomeUseCase>(() => HomeUseCase(locator()));
}

Dio getDioClient() {
  Dio _client = Dio();
  _client.options.sendTimeout = 10000;
  _client.options.receiveTimeout = 10000;
  _client.options.headers['content-Type'] = 'application/json';
  return _client;
}
