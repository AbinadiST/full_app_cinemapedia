import 'package:flutter/material.dart';

import 'package:cinemapedia/config/router/app_router.dart';
import 'package:cinemapedia/config/theme/app_theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; 
//Se instaló el paquete flutter_dotenv junto con el ASSETS en archivo YAML | clase 12.- ENVOIRMENT VARIABLES Y GIT
//Ya que GIT no reconece archiv .ENV y se hizo este proceso


Future <void> main() async {

  await dotenv.load(fileName: '.env'); //Se ejecutan las variables de entorno y ya las podemos utilizar
                                      //si cambiamos las variables de entorno EN TIEMPO DE EJECUCIÓN NO SE VERÁ CAMBIOS
  runApp(
    const ProviderScope( child: MainApp() ) //!Al instalar RIVERPOD se debe configurar esto
                                            //! PROVIDERSCOPE contendrá todos los providers de RIVERPOD
    );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter, // se configura el GO_ROUTER
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
    );
  }
}
