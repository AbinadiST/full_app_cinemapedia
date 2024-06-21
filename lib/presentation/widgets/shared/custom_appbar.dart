
import 'package:flutter/material.dart';


class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    //* Para observar el tamaño que toma el SAFEAREA y APPBAR en clase CUSTOM APPBAR minuto 7:15 da unos tips

    return SafeArea( // ajusta el espacio donde está la cámara y sensor para no empalmarlo
      child: Padding(
        padding: const EdgeInsets.symmetric( horizontal: 10),
        child: SizedBox(
          width: double.infinity, //indicamos que dé todo el ancho que pueda 
          child: Row(
            children: [
              Icon( Icons.movie_outlined, color: colors.primary ),
              const SizedBox( width: 5),
              Text('Cinemapedia', style: titleStyle),

              const Spacer(), //Toma el espacio disponible (en este caso del ROW|fila)

              IconButton(
                onPressed: () {
                  
                  },
                icon: const Icon( Icons.search)
                )
            ],
          ),
        ),
        
        )
      );
  }
}