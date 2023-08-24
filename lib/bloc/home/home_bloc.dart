import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_api/bloc/home/home_event.dart';
import 'package:flutter_bloc_api/bloc/home/home_state.dart';
import 'package:flutter_bloc_api/di/servicelocator.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeInitialEvent>(_appListing);
  }

  Future<FutureOr<void>> _appListing(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    var resposnse= await getAppRepository.getTopFreeApps();
    if(resposnse!=null){
      emit(HomeSuccessState(resposnse.feed?.results));
    }else {
emit(HomeErrorState());
    }
  }
}
