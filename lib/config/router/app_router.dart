
//Ir a paleta de comandos ( CTRL + SHIFT + P ) ingresar PUBSPEC ASSIST
//Ingrear go_router
//Podemos confirmar el archivo PUBSPEC.YAML


import 'package:go_router/go_router.dart';
import 'package:cinemapedia/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [

    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
      routes: [

        //* Para abrir una pantalla pero con un ID
        GoRoute(
          path: 'movie/:id',
          name: MovieScreen.name,
          builder: (context, state) {

            final movieId = state.pathParameters[ 'id' ] ?? 'no-id';

            return MovieScreen( movieId: movieId );

          },
        ),

        ]
      ),

    ]
  );