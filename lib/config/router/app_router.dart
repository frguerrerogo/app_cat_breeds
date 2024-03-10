import 'package:app_cat_breeds/ui/screens/cat_breeds/cat_breed_screen.dart';
import 'package:app_cat_breeds/ui/screens/cat_breeds/cat_breeds_home_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: CatBreedsHomeScreen.name,
      builder: (context, state) => CatBreedsHomeScreen(),
    ),
    GoRoute(
      path: '/catBreed',
      name: CatBreedScreen.name,
      builder: (context, state) => CatBreedScreen(),
    ),
  ],
);
