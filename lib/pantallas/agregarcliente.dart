import 'package:flutter/material.dart';
import 'package:parcial4/services/firebase.dart';

class AgregarCliente extends StatefulWidget {
  const AgregarCliente({Key? key}) : super(key: key);

  @override
  State<AgregarCliente> createState() => _AgregarClienteState();
}

class _AgregarClienteState extends State<AgregarCliente> {
  TextEditingController nombreController = TextEditingController();
  TextEditingController apellidoController = TextEditingController();
  TextEditingController direccionController = TextEditingController();
  TextEditingController ciudadController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Cliente'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const Center(
              child: Text(
                'Pagina agregar cliente',
                style: TextStyle(fontSize: 14),
              ),
            ),
            TextField(
              controller: nombreController,
              decoration: const InputDecoration(
                hintText: 'Billy, Vicente...',
              ),
            ),
            TextField(
              controller: apellidoController,
              decoration: const InputDecoration(
                hintText: 'Aguilar, Sanchez...',
              ),
            ),
            TextField(
              controller: direccionController,
              decoration: const InputDecoration(
                hintText: 'San Salvador, La Libertad...',
              ),
            ),
            TextField(
              controller: ciudadController,
              decoration: const InputDecoration(
                hintText: 'Apopa, Ciudad Delgado...',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await agregarCliente(
                  nombreController.text,
                  apellidoController.text,
                  direccionController.text,
                  ciudadController.text,
                ).then((_) {
                  Navigator.pop(context);
                });
              },
              child: const Text('Guardar'),
            )
          ],
        ),
      ),
    );
  }
}
