
import 'package:flutter/material.dart';
import 'package:flutter_bloc_api/data/model/response/apps_list_response.dart';

@immutable
abstract class HomeState{}

class HomeInitialState extends HomeState{}
class HomeLoadingState extends HomeState{}
class HomeSuccessState extends HomeState{
  final List<Results>? results;
  HomeSuccessState(this.results);
}
class HomeErrorState extends HomeState{}