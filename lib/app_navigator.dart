import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickmortydex/bloc/nav_cubit.dart';
import 'package:rickmortydex/screen/character_details_view.dart';
import 'package:rickmortydex/screen/rickmortydex_view.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, int?>(builder: (context, characterID) {
      return Navigator(
        pages: [
          MaterialPage(child: RickMortView()),
          if (characterID != null) MaterialPage(child: CharacterDetailsView())
        ],
        onPopPage: (route, result) {
          BlocProvider.of<NavCubit>(context).popToCharacter();
          return route.didPop(result);
        },
      );
    });
  }
}
