import 'package:app_cat_breeds/domain/entities/cat_breed.dart';
import 'package:app_cat_breeds/domain/repositories/cat_breeds_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cat_breeds_event.dart';
part 'cat_breeds_state.dart';

class CatBreedsBloc extends Bloc<CatBreedsEvent, CatBreedsState> {
  final CatBreedsRepository _catBreedsRepository;
  CatBreedsBloc(this._catBreedsRepository) : super(const CatBreedsState()) {
    on<GetCatBreeds>(
      (event, emit) async {
        try {
          List<CatBreed> listCatBreed = await _catBreedsRepository.getCatBreeds();

          emit(state.copyWith(
            listCatBreed: listCatBreed,
            displayListCatBreed: listCatBreed,
            isLoading: true,
          ));
        } catch (e) {
          emit(state.copyWith(error: true));
        }
      },
    );

    on<TextChanged>(
      (event, emit) async {
        String searchTerm = event.text;

        if (searchTerm != '') {
          List<CatBreed> filteredList =
              state.listCatBreed.where((obj) => obj.name.toLowerCase().contains(searchTerm.toLowerCase())).toList();
          emit(state.copyWith(displayListCatBreed: filteredList));
        } else {
          emit(state.copyWith(displayListCatBreed: state.listCatBreed));
        }
      },
    );

    on<SelectBreed>(
      (event, emit) async {
        emit(state.copyWith(catBreedSelect: event.catBreed));
      },
    );
  }
}
