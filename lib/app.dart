import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hurry_up_henry/board/view/board_page.dart';
import 'package:hurry_up_henry/repository.dart';

class App extends MaterialApp {
  App({required Repository repository})
      : super(
          home: RepositoryProvider.value(
            value: repository,
            child: const BoardPage(),
          ),
        );
}

