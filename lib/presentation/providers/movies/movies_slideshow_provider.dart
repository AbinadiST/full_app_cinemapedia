
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'movies_providers.dart';



//Provider de sólo lectura
final moviesSlideshowProvider = Provider<List<Movie>>((ref) {

  final nowPlayingMovies = ref.watch( nowPlayingMoviesProvider );

  if (nowPlayingMovies.isEmpty ) return []; //IF = indica si está vació regresa una lista vacía 

  return nowPlayingMovies.sublist(0,6);  // aquí sería como el ELSE, que indica: si no está vacía regresa una lista de películas de 0 a 6
  
});