import 'package:app_cat_breeds/data/dtos/cat_breeds_dto.dart';
import 'package:app_cat_breeds/domain/entities/cat_breed.dart';
import 'package:app_cat_breeds/domain/entities/weight_cat_breeds.dart';

class CatBreedMapper {
  //toEntity
  static CatBreed toEntity(CatBreedDto external) => CatBreed(
        weight: WeightCatBreed(imperial: external.weight.imperial, metric: external.weight.metric),
        id: external.id,
        name: external.name,
        cfaUrl: external.cfaUrl,
        vetstreetUrl: external.vetstreetUrl,
        vcahospitalsUrl: external.vcahospitalsUrl,
        temperament: external.temperament,
        origin: external.origin,
        countryCodes: external.countryCodes,
        countryCode: external.countryCode,
        description: external.description,
        lifeSpan: external.lifeSpan,
        indoor: external.indoor,
        lap: external.lap,
        altNames: external.altNames,
        adaptability: external.adaptability,
        affectionLevel: external.affectionLevel,
        childFriendly: external.childFriendly,
        dogFriendly: external.dogFriendly,
        energyLevel: external.energyLevel,
        grooming: external.grooming,
        healthIssues: external.healthIssues,
        intelligence: external.intelligence,
        sheddingLevel: external.sheddingLevel,
        socialNeeds: external.socialNeeds,
        strangerFriendly: external.strangerFriendly,
        vocalisation: external.vocalisation,
        experimental: external.experimental,
        hairless: external.hairless,
        natural: external.natural,
        rare: external.rare,
        rex: external.rex,
        suppressedTail: external.suppressedTail,
        shortLegs: external.shortLegs,
        wikipediaUrl: external.wikipediaUrl,
        hypoallergenic: external.hypoallergenic,
        referenceImageId: external.referenceImageId,
      );

  //fromEntity
}
