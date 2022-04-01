import 'package:apis/api/peticiones_api.dart';
import 'package:apis/controllers/amiibo_controller.dart';
import 'package:apis/pages/datos_amiibos.dart';
import 'package:apis/pages/home_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.lazyPut(() => PeticionesApi());
  Get.lazyPut(() => AmiiboController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amiibos',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/detalles/amiibo': (context) => DatosAmiiboPages(),
      },
    );
  }
}
