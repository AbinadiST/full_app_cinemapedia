
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class HomeScreen extends StatelessWidget {

  static const name = 'home-screen';

  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottonNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {

  @override
  void initState() { // INITSTATE es parte del STATEFULWIDGET
    super.initState();
    
    ref.read( nowPlayingMoviesProvider.notifier ).loadNextPage();
    ref.read( popularMoviesProvider.notifier ).loadNextPage();
  }


  @override
  Widget build(BuildContext context) {

    final nowPlayingMovies = ref.watch( nowPlayingMoviesProvider );
    final popularMovies = ref.watch( popularMoviesProvider );
    final slideShowMovies = ref.watch( moviesSlideshowProvider );

    return CustomScrollView( //! CUSTOMSCROLLVIEW siempre va con SLIVERS
      slivers: [  //SLIVER trabaja directamente con el SCROLLVIEW

        const SliverAppBar(  // APPBAR funciona directamente con el SCROLL
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppbar(),
          ),

        ),

        SliverList(delegate: SliverChildBuilderDelegate(
          (context, index) {

            return Column(
                children: [
              
                  //const CustomAppbar(),
                  
                  MoviesSlideshow(movies: slideShowMovies),


                  //* EN CINES  -----------------------------------------

              
                  MovieHorizontalListview(
                    movies: nowPlayingMovies, // aparecerá las 20 películas en el centro de la pantalla
                    title: 'En cines',
                    subTitle: 'Lunes 20',
                    loadNextPage: () => ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(), //READ Lo usamos al estar dentro de funciones o CALLBACKS
              
                  ),
                  
                  //* Se comenta porque ya nos dio resultado y no lo necesitamos pero se deja como un ejemplo
                  // Expanded( //Envolvemos el widget con EXPANDED, lo cual, dado el padre, EXPANDE todo lo posible y tiene un ancho y alto fijo
                  //   child: ListView.builder(
                  //    itemCount: nowPlayingMovies.length,
                  //    itemBuilder: (context, index){
                  //     final movie = nowPlayingMovies[index];
                  //       return ListTile(
                  //        title: Text(movie.title),
                  //       );
                  //    }
                  //   ),
                  // ),

                  //* PRÓXIMAMENTE -----------------------------------------------------

                  MovieHorizontalListview(
                    movies: nowPlayingMovies, // aparecerá las 20 películas en el centro de la pantalla
                    title: 'Próximamente',
                    subTitle: 'Este mes',
                    loadNextPage: () => ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(), //READ Lo usamos al estar dentro de funciones o CALLBACKS
              
                  ),

                  //* POPULARES -----------------------------------------------------------

                  MovieHorizontalListview(
                    movies: popularMovies, // aparecerá las 20 películas en el centro de la pantalla
                    title: 'Populares',
                    //subTitle: '',
                    loadNextPage: () => ref.read(popularMoviesProvider.notifier).loadNextPage(), //READ Lo usamos al estar dentro de funciones o CALLBACKS
              
                  ),

                  //* MEJOR CALIFICADAS -----------------------------------------------------

                  MovieHorizontalListview(
                    movies: nowPlayingMovies, // aparecerá las 20 películas en el centro de la pantalla
                    title: 'Mejor calificadas',
                    subTitle: 'Desde siempre',
                    loadNextPage: () => ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(), //READ Lo usamos al estar dentro de funciones o CALLBACKS
              
                  ),

                  const SizedBox( height: 10),
              
                ],
              );
            },

            childCount: 1
          )
        )
      ] 
    );
  }
}