part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final EntriesResponse entriesResponse;
  final bool isRefreshed;

  const HomeLoaded({required this.entriesResponse, this.isRefreshed = false});

  @override
  List<Object> get props => [entriesResponse];
}

class HomeError extends HomeState {
  final NetworkError networkError;

  const HomeError({required this.networkError});

  @override
  List<Object> get props => [networkError];
}
