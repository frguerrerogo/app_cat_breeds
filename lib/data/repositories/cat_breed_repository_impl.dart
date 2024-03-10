import 'package:app_cat_breeds/data/dtos/cat_breeds_dto.dart';
import 'package:app_cat_breeds/data/mappers/cat_breed_mapper.dart';
import 'package:app_cat_breeds/domain/data_sources/cat_breeds_datasource.dart';
import 'package:app_cat_breeds/domain/entities/cat_breed.dart';
import 'package:app_cat_breeds/domain/repositories/cat_breeds_repository.dart';

class CatBreedRepositoryImpl extends CatBreedsRepository {
  final CatBreedsDatasource catBreedsDatasource;
  CatBreedRepositoryImpl(this.catBreedsDatasource);

  @override
  Future<List<CatBreed>> getCatBreeds() async {
    final List<CatBreedDto> listCatBreedDto = await catBreedsDatasource.getCatBreeds();
    final List<CatBreed> listCatBreed = listCatBreedDto.map((e) => CatBreedMapper.toEntity(e)).toList();
    return listCatBreed;
  }
}
