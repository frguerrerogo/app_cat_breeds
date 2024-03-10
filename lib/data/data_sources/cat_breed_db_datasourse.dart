import 'dart:convert';

import 'package:app_cat_breeds/config/constans/environment.dart';
import 'package:app_cat_breeds/data/dtos/cat_breeds_dto.dart';
import 'package:app_cat_breeds/domain/data_sources/cat_breeds_datasource.dart';
import 'package:http/http.dart' as http;

class CatBreeddbDatasourse extends CatBreedsDatasource {
  final String apiUrlBreeds = 'https://api.thecatapi.com/v1/breeds';

  @override
  Future<List<CatBreedDto>> getCatBreeds() async {
    final response = await http.get(
      Uri.parse(apiUrlBreeds),
      headers: {
        "Content-Type": "application/json",
        'x-api-key': Environment.THE_CATS_API_KEY,
      },
    );

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      List<CatBreedDto> listCatBreedDto = result.map((e) => CatBreedDto.fromJson(e)).toList();
      return listCatBreedDto;
    } else {
      print('Error ${response.statusCode}: ${response.body}');
      return [];
    }
  }
}
