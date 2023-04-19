import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickmortydex/bloc/rickmorty_bloc.dart';
import 'package:rickmortydex/bloc/rickmorty_state.dart';

class RickMortView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rick & Morty Dex1"),
      ),
      body: BlocBuilder<CharacterBloc, CharacterState>(
        builder: (context, state){
          if (state is CharacterLoadProgress){
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CharacterPageLoadSuccess){
            return GridView.builder(gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), itemBuilder: (context, index){
              return Card(
                child: Column(
                  children: [
                    Image.network(state.characterListings[index].imageUrl),
                    Text(state.characterListings[index].name)
                  ],
                ),
              );
            });
          } else if ( state is CharacterPageLoadFailed){

            return Center(
              child: Text(state.error.toString()),

            );
          } else {
            return Container();
          }

        },
      )
    );
  }
}
