

import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// STATENOTIFIERPROVIDER = Proveedor de info. que notifica cuando cambia el estado 


//* Playing movies ------------------------------


final nowPlayingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {

  final fetchMoreMovies = ref.watch( movieRepositoryProvider ).getNowPLaying;

  return MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies
  );

});

//* Popular movies --------------------------------


final popularMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {

  final fetchMoreMovies = ref.watch( movieRepositoryProvider ).getPopular;

  return MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies
  );

});

//TODO: nombres de providers de la tarea | upcomingMoviesProvider y topRatedMoviesProvider


//* ----------------------------------------------------

typedef MovieCallback = Future<List<Movie>> Function({ int page });

class MoviesNotifier extends StateNotifier<List<Movie>> {   //si marca error en MOVIE, falta importarlo

  int currentPage = 0;
  bool isLoading = false;
  MovieCallback fetchMoreMovies;

  MoviesNotifier({
    required this.fetchMoreMovies,
  }): super([]);

  Future<void> loadNextPage() async {

    // su objetico es hacer alguna modificacion en este STATE 
    // y el STATE es el LISTADO DE MOVIES <List<Movie>> 

    if ( isLoading ) return; //? ver video EVITAR PETICIONES SIMULTANEAS para más info
    isLoading = true;
    currentPage ++;
    final List<Movie> movies = await fetchMoreMovies( page: currentPage );
    state = [...state, ...movies];
    
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }
}

