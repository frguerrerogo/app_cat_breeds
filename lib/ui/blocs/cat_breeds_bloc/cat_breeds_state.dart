part of 'cat_breeds_bloc.dart';

class CatBreedsState extends Equatable {
  final List<CatBreed> listCatBreed;
  final List<CatBreed> displayListCatBreed;
  final CatBreed? catBreedSelect;
  final bool isLoading;
  final bool error;

  const CatBreedsState({
    this.listCatBreed = const [],
    this.displayListCatBreed = const [],
    this.catBreedSelect,
    this.isLoading = false,
    this.error = false,
  });

  CatBreedsState copyWith({
    List<CatBreed>? listCatBreed,
    List<CatBreed>? displayListCatBreed,
    CatBreed? catBreedSelect,
    bool? isLoading,
    bool? error,
  }) =>
      CatBreedsState(
        listCatBreed: listCatBreed ?? this.listCatBreed,
        displayListCatBreed: displayListCatBreed ?? this.displayListCatBreed,
        catBreedSelect: catBreedSelect ?? this.catBreedSelect,
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
      );

  List<Object?> get props => [
        listCatBreed,
        displayListCatBreed,
        catBreedSelect,
        isLoading,
        error,
      ];
}
