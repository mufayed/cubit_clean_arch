import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../data/repositories/entries_repo.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerLazySingleton<Dio>(() => getDioClient());
  locator.registerLazySingleton<EntriesRepository>(() => EntriesRepository());
}

Dio getDioClient() {
  Dio _client = Dio();
  _client.options.sendTimeout = 10000;
  _client.options.receiveTimeout = 10000;
  _client.options.headers['content-Type'] = 'application/json';
  return _client;
}
