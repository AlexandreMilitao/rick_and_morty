import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/core/constants/app_assets.dart';
import 'package:rick_and_morty/core/style/my_colors.dart';
import 'package:rick_and_morty/core/widgets/my_app_bar.dart';
import 'package:rick_and_morty/core/widgets/my_scaffold.dart';
import 'package:rick_and_morty/features/characters_list/domain/entity/character_entity.dart';
import 'package:rick_and_morty/features/characters_list/presentation/cubit/character_cubit.dart';
import 'package:rick_and_morty/features/characters_list/presentation/cubit/character_states.dart';
import 'package:rick_and_morty/features/characters_list/presentation/widget/card_character.dart';
import 'package:rick_and_morty/features/characters_list/presentation/widget/page_selector.dart';

class CharacterListPage extends StatelessWidget {
  const CharacterListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CharacterCubit(getCharacters: GetIt.I()),
      child: CharacterListView(),
    );
  }
}

class CharacterListView extends StatefulWidget {
  const CharacterListView({super.key});

  @override
  State<CharacterListView> createState() => _CharacterListViewState();
}

class _CharacterListViewState extends State<CharacterListView> {
  late int currentPage;

  @override
  void initState() {
    currentPage = 1;
    super.initState();
    context.read<CharacterCubit>().fetchCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: MyAppBar(
        title: SvgPicture.asset(
          AppAssets.logo,
          height: 50,
        ),
        actions: [
          BlocBuilder<CharacterCubit, CharacterState>(
            builder: (context, state) {
              if (state is CharacterSuccess) {
                return PageSelector(
                  totalPages: state.apiResult.infoEntity.pages,
                  currentPage: currentPage,
                  onPageSelected: (page) {
                    currentPage = page;
                    context.read<CharacterCubit>().fetchCharacters(page: page);
                  },
                );
              } else {
                return SizedBox.shrink();
              }
            },
          ),
        ],
      ),
      body: BlocBuilder<CharacterCubit, CharacterState>(
        builder: (context, state) {
          if (state is CharacterLoading) {
            return Center(
              child: CircularProgressIndicator(color: MyColors.color5),
            );
          } else if (state is CharacterError) {
            return Center(child: Text('Error: ${state.message}'));
          } else if (state is CharacterSuccess) {
            return CharacterListWidget(characters: state.apiResult.results);
          }
          return const Center(child: Text("Oh Oh, Something went wrong"));
        },
      ),
    );
  }
}

class CharacterListWidget extends StatelessWidget {
  final List<CharacterEntity> characters;
  const CharacterListWidget({super.key, required this.characters});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        itemCount: characters.length,
        itemBuilder: (context, index) {
          final character = characters[index];
          return GestureDetector(
            onTap: () {
              GoRouter.of(context).go('/characters', extra: character);
              debugPrint("${character.name} | ${character.id}");
            },
            child: CardCharacter(character: character),
          );
        },
      ),
    );
  }
}
