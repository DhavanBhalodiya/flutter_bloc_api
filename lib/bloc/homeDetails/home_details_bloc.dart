
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_api/bloc/homeDetails/home_details_event.dart';
import 'package:flutter_bloc_api/bloc/homeDetails/home_details_state.dart';
import 'package:flutter_bloc_api/data/api/api_response.dart';
import 'package:flutter_bloc_api/di/servicelocator.dart';


class HomeDetailBloc extends Bloc<HomeDetailsEvent,HomeDetailsState>{
  HomeDetailBloc(): super(HomeDetailInitialState()){
    on<HomeDetailInitialEvent>(appDetailInitialEvent);
  }


  Future<FutureOr<void>> appDetailInitialEvent(HomeDetailInitialEvent event, Emitter<HomeDetailsState> emit) async {
    emit(HomeDetaiLoadingState());

    final response = await getAppRepository.getAppDetails("?id=${event.id}");

 switch (response?.responseEnum) {
      case ApiResponseEnum.apiSuccess:
        emit(HomeDetaiSuccessState(response?.data));
        break;
      default:
      emit(HomeDetaiErrorState(apiResponseEnum: response?.responseEnum,errorMessage: response?.errorMessage));
      break;
    }
  }
}