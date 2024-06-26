
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
  }


  @override
  Widget build(BuildContext context) {

    final nowPlayingMovies = ref.watch( nowPlayingMoviesProvider );
    final slideShowMovies = ref.watch( moviesSlideshowProvider );

    return Column(
      children: [

        const CustomAppbar(),
        
        MoviesSlideshow(movies: slideShowMovies),

        MovieHorizontalListview(
          movies: nowPlayingMovies, // aparecerá las 20 películas en el centro de la pantalla
          title: 'En cines',
          subTitle: 'Lunes 20',
        ) 
        
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

      ],
    );
  }
}