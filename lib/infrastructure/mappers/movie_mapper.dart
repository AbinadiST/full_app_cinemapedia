import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_details.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_moviedb.dart';

//El MAPPER lo que hará es leer los MODELOS y crear MI ENTIDAD
//El objetivo de MOVIEMAPPER es crear una pelicula basado en algun tipo de objeto que vamos a recibir
//! Esta es una capa de protección del API que viene de afuera con nuestra aplicación | en caso que cambie un valor, sustituimos fácilmente


class MovieMapper {
  //STATIC = para usar éste método sin la necesidad de INSTANCIAR LA CLASE
  static Movie movieDBToEntity(MovieMovieDB moviedb) => Movie(

    //! para ordenarlo así sería: CTRL + SHIFT + P, escribir: format, clic en DAR FORMATO AL DOCUMENTO

      adult: moviedb.adult,
      backdropPath: ( moviedb.backdropPath != '' )
        ? 'https://image.tmdb.org/t/p/w500${ moviedb.backdropPath }'
        : 'https://static.displate.com/857x1200/displate/2022-04-15/7422bfe15b3ea7b5933dffd896e9c7f9_46003a1b7353dc7b5a02949bd074432a.jpg',
      genreIds: moviedb.genreIds.map((e) => e.toString()).toList(), //se hizo con .MAP porque una cadena de INT no se asinga a una lista de STRINGS
      id: moviedb.id,
      originalLanguage: moviedb.originalLanguage,
      originalTitle: moviedb.originalTitle,
      overview: moviedb.overview,
      popularity: moviedb.popularity,
      posterPath: ( moviedb.posterPath != '' )
        ? 'https://image.tmdb.org/t/p/w500${ moviedb.posterPath }'
        : 'no-poster',
      releaseDate: moviedb.releaseDate,
      title: moviedb.title,
      video: moviedb.video,
      voteAverage: moviedb.voteAverage,
      voteCount: moviedb.voteCount
      );


      //* Otro MAPPER para crear la ENTITY---------------------------------------------------------

      static Movie movieDetailsToEntity( MovieDetails moviedb ) => Movie(

        adult: moviedb.adult,
      backdropPath: ( moviedb.backdropPath != '' )
        ? 'https://image.tmdb.org/t/p/w500${ moviedb.backdropPath }'
        : 'https://static.displate.com/857x1200/displate/2022-04-15/7422bfe15b3ea7b5933dffd896e9c7f9_46003a1b7353dc7b5a02949bd074432a.jpg',
      genreIds: moviedb.genres.map((e) => e.name ).toList(), 
      id: moviedb.id,
      originalLanguage: moviedb.originalLanguage,
      originalTitle: moviedb.originalTitle,
      overview: moviedb.overview,
      popularity: moviedb.popularity,
      posterPath: ( moviedb.posterPath != '' )
        ? 'https://image.tmdb.org/t/p/w500${ moviedb.posterPath }'
        : 'https://static.displate.com/857x1200/displate/2022-04-15/7422bfe15b3ea7b5933dffd896e9c7f9_46003a1b7353dc7b5a02949bd074432a.jpg',
      releaseDate: moviedb.releaseDate,
      title: moviedb.title,
      video: moviedb.video,
      voteAverage: moviedb.voteAverage,
      voteCount: moviedb.voteCount

      );
}
