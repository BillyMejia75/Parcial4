import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:parcial4/pantallas/agregarcliente.dart';
import 'package:parcial4/pantallas/clientesdetalles.dart';
import 'package:parcial4/pantallas/firebaseapp.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const FireBaseMain());
}

class FireBaseMain extends StatelessWidget {
  const FireBaseMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase CRUD',
      initialRoute: '/',
      routes: {
        '/': (context) => const FireBaseApp(),
        '/agregar': (context) => const AgregarCliente(),
      },
    );
  }
}
