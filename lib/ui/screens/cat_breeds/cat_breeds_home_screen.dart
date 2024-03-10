import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_cat_breeds/ui/blocs/cat_breeds_bloc/cat_breeds_bloc.dart';
import 'package:app_cat_breeds/config/theme/colors.dart';
import 'package:app_cat_breeds/config/theme/text_style.dart';
import 'package:app_cat_breeds/domain/entities/cat_breed.dart';
import 'package:app_cat_breeds/injection_container.dart';
import 'package:app_cat_breeds/ui/widgets/cat_breed_card.dart';

class CatBreedsHomeScreen extends StatelessWidget {
  static const name = 'cat-Breeds-home-screen';
  CatBreedsHomeScreen({super.key});
  final CatBreedsBloc _catBreedsBloc = injector<CatBreedsBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CatBreedsBloc, CatBreedsState>(
        bloc: _catBreedsBloc,
        builder: (context, state) {
          if (!state.isLoading) {
            _catBreedsBloc.add(const GetCatBreeds());
            return const Center(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 150),
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColorApp,
                      strokeWidth: 10,
                    ),
                  ),
                ],
              ),
            );
          }

          if (state.error) {
            return Center(
              child: Text(
                'No results found',
                style: AppTextStyle.textTheme.headlineMedium,
              ),
            );
          }
          List<CatBreed> displayListCatBreed = state.displayListCatBreed;

          return Column(
            children: [
              const _AppBarCustom(),
              Expanded(
                child: ListView.builder(
                  itemCount: displayListCatBreed.length,
                  itemBuilder: (_, index) {
                    return CatBreedCard(
                      catBreed: displayListCatBreed[index],
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _AppBarCustom extends StatefulWidget {
  const _AppBarCustom();

  @override
  State<_AppBarCustom> createState() => _AppBarCustomState();
}

class _AppBarCustomState extends State<_AppBarCustom> {
  final _textController = TextEditingController();
  late CatBreedsBloc _catBreedsBloc;

  @override
  void initState() {
    super.initState();
    _catBreedsBloc = context.read<CatBreedsBloc>();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      decoration: const BoxDecoration(
        color: AppColors.primaryColorApp,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Text(
            'Catbreeds',
            style: AppTextStyle.headlineLarge,
          ),
          Container(
            decoration: const BoxDecoration(
              color: AppColors.primaryColorWhite,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: TextField(
              cursorColor: AppColors.primaryColorApp,
              style: AppTextStyle.titleLarge.copyWith(
                color: AppColors.primaryColorApp,
              ),
              controller: _textController,
              autocorrect: false,
              onChanged: (text) {
                _catBreedsBloc.add(
                  TextChanged(text: text),
                );
              },
              decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    color: AppColors.primaryColorApp,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: _onClearTapped,
                    child: const Icon(
                      Icons.clear,
                      color: AppColors.primaryColorApp,
                    ),
                  ),
                  border: InputBorder.none,
                  hintText: 'Ingrese un nombre de raza',
                  hintStyle: AppTextStyle.textTheme.headlineSmall!.copyWith(
                    color: AppColors.primaryColorApp,
                  )),
            ),
          ),
        ],
      ),
    );
  }

  void _onClearTapped() {
    _textController.text = '';
    _catBreedsBloc.add(const TextChanged(text: ''));
  }
}
