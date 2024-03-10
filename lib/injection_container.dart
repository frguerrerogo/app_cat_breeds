import 'package:app_cat_breeds/data/data_sources/cat_breed_db_datasourse.dart';
import 'package:app_cat_breeds/data/repositories/cat_breed_repository_impl.dart';
import 'package:app_cat_breeds/domain/repositories/cat_breeds_repository.dart';
import 'package:app_cat_breeds/ui/blocs/cat_breeds_bloc/cat_breeds_bloc.dart';
import 'package:get_it/get_it.dart';

final GetIt injector = GetIt.instance;

void setupInjection() {
  //Datasourse
  injector.registerLazySingleton<CatBreeddbDatasourse>(() => CatBreeddbDatasourse());

  //Repositories
  injector.registerLazySingleton<CatBreedsRepository>(() => CatBreedRepositoryImpl(injector<CatBreeddbDatasourse>()));

  //Bloc
  injector.registerSingleton(CatBreedsBloc(injector<CatBreedsRepository>()));
}
