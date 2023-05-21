import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:parcial4/pantallas/clientesdetalles.dart';
import 'package:parcial4/services/firebase.dart';

class FireBaseApp extends StatefulWidget {
  const FireBaseApp({super.key});

  @override
  State<FireBaseApp> createState() => _FireBaseAppState();
}

class _FireBaseAppState extends State<FireBaseApp> {
  Future<void> deleteUser(id) {
    // print("User Deleted $id");
    CollectionReference clients =
        FirebaseFirestore.instance.collection('clients');
    return clients
        .doc(id)
        .delete()
        .then((value) => print('User Deleted'))
        .catchError((error) => print('Failed to Delete user: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parcial 4 Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Parcial 4'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: FutureBuilder(
            future: getClientes(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                List<dynamic> clientes = snapshot.data ?? [];

                return DataTable(
                  columns: const [
                    DataColumn(label: Text('Nombre')),
                    DataColumn(label: Text('Apellido')),
                    DataColumn(label: Text('Dirección')),
                    DataColumn(label: Text('Ciudad')),
                    DataColumn(label: Text('Accion')),
                  ],
                  rows: clientes.map((cliente) {
                    final idCliente = cliente['idCliente'];
                    return DataRow(
                      cells: [
                        DataCell(Text(cliente['nombreCliente'])),
                        DataCell(Text(cliente['apellidoCliente'])),
                        DataCell(Text(cliente['direccionCliente'])),
                        DataCell(Text(cliente['ciudadCliente'])),
                        DataCell(
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DetallesCliente(cliente: cliente),
                                    ),
                                  );
                                },
                                child: IconButton(
                                  onPressed:
                                      null, // No se necesita onPressed en este caso
                                  icon: const Icon(Icons.info),
                                ),
                              ),
                              const SizedBox(width: 5),
                              GestureDetector(
                                onTap: () {
                                  eliminarCliente(idCliente).then((_) {
                                    Navigator.pushNamed(context, '/');
                                  });
                                },
                                child: IconButton(
                                  onPressed:
                                      null, // No se necesita onPressed en este caso
                                  icon: const Icon(Icons.delete),
                                ),
                              ),
                              const SizedBox(width: 5),
                              GestureDetector(
                                onTap: () {
                                  // Acción del botón de edición
                                },
                                child: IconButton(
                                  onPressed:
                                      null, // No se necesita onPressed en este caso
                                  icon: const Icon(Icons.edit),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.pushNamed(context, '/agregar');
            setState(() {});
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
