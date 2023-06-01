import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/models/entries/entries_response.dart';
import '../../../../data/sources/network/result/network_error.dart';
import '../../../../domain/home/usecase/home_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeUseCase _useCase;

  HomeCubit(this._useCase) : super(HomeInitial());

  Future<void> getEntries() async {
    emit(HomeLoading());
    final result = await _useCase.getEntries();
    result.when(success: (EntriesResponse data) {
      emit(HomeLoaded(entriesResponse: data));
    }, failure: (NetworkError error) {
      emit(HomeError(networkError: error));
    });
  }
}
