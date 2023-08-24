
import 'package:flutter/material.dart';

@immutable
abstract class HomeDetailsEvent{}

class HomeDetailInitialEvent extends HomeDetailsEvent{
  final String? id;
  HomeDetailInitialEvent(this.id);
}