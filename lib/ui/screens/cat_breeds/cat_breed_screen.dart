import 'package:app_cat_breeds/config/theme/colors.dart';
import 'package:app_cat_breeds/config/theme/text_style.dart';
import 'package:app_cat_breeds/domain/entities/cat_breed.dart';
import 'package:app_cat_breeds/injection_container.dart';
import 'package:app_cat_breeds/ui/blocs/cat_breeds_bloc/cat_breeds_bloc.dart';
import 'package:app_cat_breeds/ui/widgets/cat_breed_card.dart';
import 'package:app_cat_breeds/ui/widgets/icon_text.dart';
import 'package:flutter/material.dart';

class CatBreedScreen extends StatelessWidget {
  static const name = 'cat-Breed-screen';

  const CatBreedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CatBreedsBloc catBreedsBloc = injector<CatBreedsBloc>();
    final CatBreed catBreedSelect = catBreedsBloc.state.catBreedSelect!;
    double widthOfScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.primaryColorApp,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Center(
                        child: Text(
                          catBreedSelect.name,
                          style: AppTextStyle.headlineLarge,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Positioned(
                        top: 5,
                        left: 10,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          color: AppColors.primaryColorWhite,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ImagenCat(
                    referenceImageId: catBreedSelect.referenceImageId,
                    size: widthOfScreen * 0.95,
                  ),
                ],
              ),
            ),
          ),
          InfoCatBreed(catBreedSelect: catBreedSelect, widthOfScreen: widthOfScreen),
        ],
      ),
    );
  }
}

class InfoCatBreed extends StatelessWidget {
  const InfoCatBreed({
    super.key,
    required this.catBreedSelect,
    required this.widthOfScreen,
  });

  final CatBreed catBreedSelect;
  final double widthOfScreen;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.42,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                catBreedSelect.description,
                style: AppTextStyle.bodyMedium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            IconText(
              textTitle: 'País:',
              text: catBreedSelect.origin,
              icon: Icons.location_on_outlined,
              width: widthOfScreen * 0.8,
            ),
            IconText(
              textTitle: 'Inteligencia:',
              text: catBreedSelect.intelligence.toString(),
              icon: Icons.auto_awesome,
              width: widthOfScreen * 0.8,
            ),
            IconText(
              textTitle: 'Adaptabilidad:',
              text: catBreedSelect.adaptability.toString(),
              icon: Icons.add_moderator_sharp,
              width: widthOfScreen * 0.8,
            ),
            IconText(
              textTitle: 'Tiempo de vida:',
              text: catBreedSelect.intelligence.toString(),
              icon: Icons.favorite,
              width: widthOfScreen * 0.8,
            ),
            IconText(
              textTitle: 'Energía:',
              text: catBreedSelect.energyLevel.toString(),
              icon: Icons.battery_5_bar,
              width: widthOfScreen * 0.8,
            ),
            IconText(
              textTitle: 'Temperamento:',
              text: catBreedSelect.temperament,
              icon: Icons.timelapse_sharp,
              width: widthOfScreen * 0.8,
            ),
          ],
        ),
      ),
    );
  }
}
