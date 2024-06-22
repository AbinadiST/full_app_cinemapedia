import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:cinemapedia/domain/entities/movie.dart';

// CTRL + SHIFT + P 
// PUBSPEC ASSISTE => ingresar: card_swiper | Para mostrar imágenes en carrusel

// CTRL + SHIFT + P 
// PUBSPEC ASSISTE => ingresar: animate_do | para animaciones

class MoviesSlideshow extends StatelessWidget {

  final List<Movie> movies;

  const MoviesSlideshow({
    super.key, required this.movies
    });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      height: 210,
      width: double.infinity, //toma todo el espacio restante
      child: Swiper(
        viewportFraction: 0.8, // con esto podemos ver el Slide anterior y un pedacito del que sigue
        scale: 0.9, //tiene un efecto donde los slide de alado se ve un poco chico al slide principal
        autoplay: true, // se mueve en automático los slides
        pagination: SwiperPagination(  //SwiperPagination.fraction = muestra el # de imagen que se muestra ej, 5/20
          //* Personalizaremos el SWIPERPAGINATION
          margin: const EdgeInsets.only( top: 0 ), // para poner los cirulitos hasta abajo del área del SWIPER
          builder: DotSwiperPaginationBuilder( 
            activeColor: colors.primary,
            color: colors.secondary
          )
        ), 
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

    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(
          color: Colors.black45,
          blurRadius: 10, //esto es un difuminado|desvanecido en el marco
          offset: Offset(0, 10) //sombra donde los valores son X y Y 

        )
      ]
    );


    return Padding(
      padding: const EdgeInsets.only( bottom: 30), //queda un poco estrecho en la parte inferior
      child: DecoratedBox(
        decoration: decoration,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),  // para colocar borders redondos
          child: Image.network(
            movie.backdropPath,
            fit: BoxFit.cover, //para que la imagen se aprecie mejor dentro del SLIDE que hicimos
            loadingBuilder: (context, child, loadingProgress) {
              if ( loadingProgress != null ) {

                //* se indica que el progress está cargando

                return const DecoratedBox(
                  decoration: BoxDecoration( color: Colors.black12 )
                );
              }

              return FadeIn(child: child); // si ya terminó la carga, la imagen entra con suavidad | instalar paquete ANIMATE_DO
            },
            )
          ),
        ),
      );
  }
}