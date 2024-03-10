import 'package:app_cat_breeds/data/dtos/cat_breeds_dto.dart';

abstract class CatBreedsDatasource {
  Future<List<CatBreedDto>> getCatBreeds();
}
