import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:cinemapedia/domain/entities/movie.dart';

// CTRL + SHIFT + P 
// PUBSPEC ASSISTE => ingresar: card_swiper | Para mostrar imágenes en carrusel

class MoviesSlideshow extends StatelessWidget {

  final List<Movie> movies;

  const MoviesSlideshow({
    super.key, required this.movies
    });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      width: double.infinity, //toma todo el espacio restante
      child: Swiper(
        viewportFraction: 0.8, // con esto podemos ver el Slide anterior y un pedacito del que sigue
        scale: 0.9, //tiene un efecto donde los slide de alado se ve un poco chico al slide principal
        autoplay: true, // se mueve en automático los slides
        itemCount: movies.length,
        itemBuilder: (context, index) => _Slide(movie: movies[index]),

        //* ó también puede funcionar como lo de abajo, es lo mismo que lo de arriba

        // itemBuilder: (context, index) {
        //   final movie = movies[index];
        //   return _Slide(movie: movie);
        //},
        ),
    );
  }
}


class _Slide extends StatelessWidget {

   final Movie movie;

  const _Slide({ required this.movie });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}