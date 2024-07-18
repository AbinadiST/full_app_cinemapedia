import 'package:flutter/material.dart';


//! Mostrará una película en particular



class MovieScreen extends StatelessWidget {

  static const name = 'movie-screen';

  final String movieId;

  const MovieScreen({
    super.key, 
    required this.movieId
    });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}