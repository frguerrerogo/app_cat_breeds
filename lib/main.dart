// 1) Importaciones de dart

// 2) Importaciones de flutter
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// 3) Importaciones paquetes de terceros

// 4) Importaciones de dependencias de flutter
import 'package:app_cat_breeds/config/router/app_router.dart';
import 'package:app_cat_breeds/ui/blocs/cat_breeds_bloc/cat_breeds_bloc.dart';
import 'package:app_cat_breeds/config/theme/app_theme.dart';
import 'package:app_cat_breeds/injection_container.dart';

void main() {
  setupInjection();
  runApp(const BlocsProviders());
}

class BlocsProviders extends StatelessWidget {
  const BlocsProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => injector<CatBreedsBloc>()),
      ],
      child: const MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      theme: AppTheme().getTheme(),
      debugShowCheckedModeBanner: false,
    );
  }
}
