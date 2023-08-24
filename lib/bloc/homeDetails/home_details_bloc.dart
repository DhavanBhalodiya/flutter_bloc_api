
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_api/bloc/homeDetails/home_details_event.dart';
import 'package:flutter_bloc_api/bloc/homeDetails/home_details_state.dart';
import 'package:flutter_bloc_api/di/servicelocator.dart';


class HomeDetailBloc extends Bloc<HomeDetailsEvent,HomeDetailsState>{
  HomeDetailBloc(): super(HomeDetailInitialState()){
    on<HomeDetailInitialEvent>(appDetailInitialEvent);
  }


  Future<FutureOr<void>> appDetailInitialEvent(HomeDetailInitialEvent event, Emitter<HomeDetailsState> emit) async {
    emit(HomeDetaiLoadingState());
    final response = await getAppRepository.getAppDetails("?id=${event.id}");
    if(response!=null) {
      emit(HomeDetaiSuccessState(response));
    } else {
      emit(HomeDetaiErrorState());
    }
  }
}