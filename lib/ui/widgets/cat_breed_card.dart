import 'package:app_cat_breeds/config/constans/assets.dart';
import 'package:app_cat_breeds/config/theme/colors.dart';
import 'package:app_cat_breeds/config/theme/text_style.dart';
import 'package:app_cat_breeds/domain/entities/cat_breed.dart';
import 'package:app_cat_breeds/injection_container.dart';
import 'package:app_cat_breeds/ui/blocs/cat_breeds_bloc/cat_breeds_bloc.dart';
import 'package:app_cat_breeds/ui/widgets/icon_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class CatBreedCard extends StatelessWidget {
  final CatBreed catBreed;

  const CatBreedCard({
    super.key,
    required this.catBreed,
  });

  @override
  Widget build(BuildContext context) {
    final CatBreedsBloc catBreedsBloc = injector<CatBreedsBloc>();
    double widthOfScreen = MediaQuery.of(context).size.width;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.all(10),
      elevation: 10,
      color: AppColors.primaryColorApp,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    catBreed.name,
                    style: AppTextStyle.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  TextButton(
                    onPressed: () {
                      catBreedsBloc.add(SelectBreed(catBreed: catBreed));
                      context.push('/catBreed');
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColorWhite,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Mas...',
                        style: AppTextStyle.labelMedium.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            ),
            ImagenCat(
              referenceImageId: catBreed.referenceImageId,
              size: widthOfScreen * 0.8,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconText(
                    textTitle: 'Pais:',
                    text: catBreed.origin,
                    icon: Icons.location_on_outlined,
                    width: 200,
                  ),
                  IconText(
                    textTitle: 'Inteligencia:',
                    text: catBreed.intelligence.toString(),
                    icon: Icons.auto_awesome,
                    width: 200,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImagenCat extends StatelessWidget {
  const ImagenCat({
    super.key,
    required this.referenceImageId,
    required this.size,
  });

  final String referenceImageId;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Image.network(
        'https://cdn2.thecatapi.com/images/referenceImageId.jpg'.replaceFirst('referenceImageId', referenceImageId),
        width: size,
        height: size,
        fit: BoxFit.fill,
        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(50.0),
                child: CircularProgressIndicator(
                  color: AppColors.primaryColorWhite,
                  strokeWidth: 10,
                ),
              ),
            );
          }
        },
        errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
          return Image.asset(
            Assets.catsImagen,
            width: size,
            height: size,
          );
        },
      ),
    );
  }
}
