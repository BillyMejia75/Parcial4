import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore baseD = FirebaseFirestore.instance;

Future<List> getClientes() async {
  List clientes = [];

  CollectionReference collectionReferenceClientes =
      baseD.collection('MD_Clientes');
  QuerySnapshot queryClientes = await collectionReferenceClientes.get();

  queryClientes.docs.forEach((documento) {
    clientes.add(documento.data());
  });

  return clientes;
}

Future<void> agregarCliente(
    String nombre, String apellido, String direccion, String ciudad) async {
  await baseD.collection('MD_Clientes').add({
    'nombreCliente': nombre,
    'apellidoCliente': apellido,
    'direccionCliente': direccion,
    'ciudadCliente': ciudad,
  });
}

CollectionReference clientes =
    FirebaseFirestore.instance.collection('MD_Clientes');

Future<void> eliminarCliente(id) async {
  await clientes
      .doc(id)
      .delete()
      .then((value) => print('Cliente eliminado'))
      .catchError((error) => print('Error al eliminar el cliente: $error'));
}
