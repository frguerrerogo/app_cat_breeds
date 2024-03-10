part of 'cat_breeds_bloc.dart';

sealed class CatBreedsEvent extends Equatable {
  const CatBreedsEvent();
}

class GetCatBreeds extends CatBreedsEvent {
  const GetCatBreeds();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class GetCatImagen extends CatBreedsEvent {
  final List<CatBreed> listCatBreed;
  const GetCatImagen(
    this.listCatBreed,
  );

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class TextChanged extends CatBreedsEvent {
  const TextChanged({required this.text});

  final String text;

  @override
  List<Object> get props => [text];

  @override
  String toString() => 'TextChanged { text: $text }';
}

class SelectBreed extends CatBreedsEvent {
  const SelectBreed({required this.catBreed});

  final CatBreed catBreed;

  @override
  List<Object> get props => [catBreed];

  @override
  String toString() => 'SelectBreed { catBreed: $catBreed }';
}
