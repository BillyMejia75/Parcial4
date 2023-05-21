import 'package:flutter/material.dart';

class DetallesCliente extends StatelessWidget {
  final Map<String, dynamic>? cliente;

  const DetallesCliente({Key? key, required this.cliente}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Usa el objeto cliente para mostrar los detalles del cliente en esta pantalla
    // ...

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles del cliente'),
      ),
      body: Column(
        children: [
          Text('Nombre: ${cliente?['nombreCliente']}'),
          Text('Apellido: ${cliente?['apellidoCliente']}'),
          Text('Direccion: ${cliente?['direccionCliente']}'),
          Text('Ciudad: ${cliente?['ciudadCliente']}'),
          // ...
        ],
      ),
    );
  }
}
