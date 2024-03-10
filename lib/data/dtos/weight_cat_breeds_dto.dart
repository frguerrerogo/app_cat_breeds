class WeightCatBreedDto {
  final String imperial;
  final String metric;

  WeightCatBreedDto({
    required this.imperial,
    required this.metric,
  });

  factory WeightCatBreedDto.fromJson(Map<String, dynamic> json) => WeightCatBreedDto(
        imperial: json["imperial"],
        metric: json["metric"],
      );

  Map<String, dynamic> toJson() => {
        "imperial": imperial,
        "metric": metric,
      };
}
