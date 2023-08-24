
import 'package:flutter/material.dart';
import 'package:flutter_bloc_api/data/model/model.dart';


@immutable
abstract class HomeDetailsState{}

class HomeDetailInitialState extends HomeDetailsState{}
class HomeDetaiLoadingState extends HomeDetailsState{}
class HomeDetaiSuccessState extends HomeDetailsState{
final AppDetailsResponse appDetailsResponse;
  HomeDetaiSuccessState(this.appDetailsResponse);
}
class HomeDetaiErrorState extends HomeDetailsState{}