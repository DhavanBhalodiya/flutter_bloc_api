import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_api/bloc/home/home_event.dart';
import 'package:flutter_bloc_api/bloc/home/home_state.dart';
import 'package:flutter_bloc_api/data/api/api_response.dart';
import 'package:flutter_bloc_api/di/servicelocator.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeInitialEvent>(_appListing);
  }

//call API
  Future<FutureOr<void>> _appListing(HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());

    var response = await getAppRepository.getTopFreeApps();

    switch (response?.responseEnum) {
      case ApiResponseEnum.apiSuccess:
        emit(HomeSuccessState(response?.data?.feed?.results));
        break;
      default:
      emit(HomeErrorState(responseEnum:response?.responseEnum,errorMessage: response?.errorMessage));
      break;
    }
  }
  
}
