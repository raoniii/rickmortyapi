import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickmortydex/bloc/nav_cubit.dart';
import 'package:rickmortydex/bloc/rickmorty_bloc.dart';
import 'package:rickmortydex/bloc/rickmorty_state.dart';

class RickMortView extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    void _onScroll() {
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        BlocProvider.of<CharacterBloc>(context).loadNextPage();
      }
    }

    _scrollController.addListener(_onScroll);

    return Scaffold(
      appBar: AppBar(
        title: Text("Rick & Morty Dex", style: TextStyle(
          color: Colors.black,
        ),),
        backgroundColor: Colors.lightGreenAccent,
      ),
      body: BlocBuilder<CharacterBloc, CharacterState>(
        builder: (context, state) {
          if (state is CharacterLoadProgress) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CharacterPageLoadSuccess) {
            return GridView.builder(
              itemCount: state.characterListings.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                final character = state.characterListings[index];

                return GestureDetector(
                  onTap: () => BlocProvider.of<NavCubit>(context)
                      .showCharacterDetails(index + 1),
                  child: Card(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0)),
                          ),
                          child: Image.network(
                            character.imageUrl,
                            height: 155,
                            fit: BoxFit.cover,
                          ),
                        ),
                        FittedBox(
                          child: Text(character.name),
                        ),
                      ],
                    ),
                  ),
                );
              },
              controller: _scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              shrinkWrap: true,
            );
          } else if (state is CharacterPageLoadFailed) {
            return Center(
              child: Text(state.error.toString()),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
