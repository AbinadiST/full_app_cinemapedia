import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MovieHorizontalListview extends StatelessWidget {

  final List<Movie> movies;
  final String? title;
  final String? subTitle;
  final VoidCallback? loadNextPage;

  const MovieHorizontalListview({
    super.key, 
    required this.movies, 
    this.title, 
    this.subTitle,
    this.loadNextPage
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
           
           if ( title != null || subTitle != null )
           _Title( title: title, subTtile: subTitle ),

        ],
      ),
    );
  }
}


class _Title extends StatelessWidget {
  
  final String? title;
  final String? subTtile;

  const _Title({ this.title, this.subTtile });

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return Container(
      padding: const EdgeInsets.only( top: 10 ),
      margin: const EdgeInsets.symmetric( horizontal: 10 ),
      child: Row(
        children: [

          if ( title != null ) // es decir, si hay un TITLE
            Text( title!, style: titleStyle ), 

            const Spacer(), // toma el espacio restante para agregar algo al final

          if ( subTtile != null)
          FilledButton(
            style: const ButtonStyle( visualDensity: VisualDensity.compact),
            onPressed: () {}, 
            child: Text( subTtile! )
            )

        ],
      ),
    );
  }
}