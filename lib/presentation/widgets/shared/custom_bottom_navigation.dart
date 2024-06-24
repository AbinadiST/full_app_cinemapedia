import 'package:flutter/material.dart';

class CustomBottonNavigation extends StatelessWidget {
  const CustomBottonNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,  // traza una elevación el iniciar el bottonNavigationBar
      items: const [
        //debe existar al menos 2 hijos
        BottomNavigationBarItem(
          icon: Icon( Icons.home_max ),
          label: 'Inicio'
          ),
        BottomNavigationBarItem(
        icon: Icon( Icons.label_outline ),
        label: 'Categorias'
          ),
        BottomNavigationBarItem(
        icon: Icon( Icons.favorite_outline ),
        label: 'Favoritos'
        ),
      ]
    );
  }
}