//! Por si un día cambia el paquete 'intl' (internacionalización) tendríamos que cambiarlo 
//! en toda la app, y SÓLO en este archivo lo podemos configurar para toda la app | clase: HUMANFORMATS - NUMEROS CORTOS

//* Para cambiar formato de conteo más ligible 


import 'package:intl/intl.dart';

class HumanFormats {

  // STATIC = no crea INSTANCIA, se usaría de forma directa
  static String number ( double number ){

    final formatterNumber = NumberFormat.compactCurrency( // importamos el paquete que instalamos 'intl' en NUMBERFORMAT()
      //Realizamos la configuracion
      decimalDigits: 0,
      symbol: '',
      locale: 'en' // es idioma inglés, para que muestre el K de miles ó M de millones 
    ).format(number); 

    return formatterNumber;

  }

}