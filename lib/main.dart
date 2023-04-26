import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickmortydex/app_navigator.dart';
import 'package:rickmortydex/bloc/character_details_cubit.dart';
import 'package:rickmortydex/bloc/nav_cubit.dart';
import 'package:rickmortydex/bloc/rickmorty_bloc.dart';
import 'package:rickmortydex/bloc/rickmorty_event.dart';
import 'package:rickmortydex/screen/rickmortydex_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final characterDetailsCubit = CharacterDetailsCubit();
    return MaterialApp(

        home: MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                CharacterBloc()..add(CharacterPageRequest(page: 0))),
        BlocProvider(
          create: (context) =>
              NavCubit(characterDetailsCubit: characterDetailsCubit)),
        BlocProvider(create: (context) => characterDetailsCubit)

      ],
      child: AppNavigator(),
    ));
  }
}
