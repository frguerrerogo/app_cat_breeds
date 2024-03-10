import 'package:app_cat_breeds/domain/entities/cat_breed.dart';

abstract class CatBreedsRepository {
  Future<List<CatBreed>> getCatBreeds();
}
