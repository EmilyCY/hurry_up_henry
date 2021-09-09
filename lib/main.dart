import 'package:flutter/material.dart';
import 'package:hurry_up_henry/app.dart';
import 'package:hurry_up_henry/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hurry_up_henry/simple_bloc_observer.dart';

//some change
void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(App(repository: Repository()));
} 