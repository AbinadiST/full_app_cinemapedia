
import 'package:cinemapedia/infrastructure/datasources/moviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Este archivo creara una instancia de MOVIE REPOSITORY IMPLEMENTATION

// Este PROVIDER ya no será cambiado nunca más | lo cual puede ser un PROVIDER sólo de lectura 
// Se instala el paquete: flutter_riverpod | CTRL + SHIFT + P => PUSPEC ASSIST => flutter_riverpod


// Este REPOSITORIO es inmutable
//* Su objeto es proporcionar a todos los demás PROVIDERS la info. necesaria para que puedan...
//*consultar la info de MOVIEREPOSITORYIMPL (en este caso sólo es el GETNOWPLAYING lo que está en esa clase)

final movieRepositoryProvider = Provider((ref) { // PROVIDER = Es de sólo lectura

return MovieRepositoryImpl( MoviedbDatasource() ); // entre paréntesis pide el ORIGEN DE DATOS para que funcione 
                              //el MOVIEREPOSITORYPROVIDER, es el corazón de todo lo que hemos estado haciendo
                                        
});