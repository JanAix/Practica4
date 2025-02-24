import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/notas_provider.dart';
import '../models/nota.dart';

class CrearNotaScreen extends StatefulWidget {
  @override
  _CrearNotaScreenState createState() => _CrearNotaScreenState();
}

class _CrearNotaScreenState extends State<CrearNotaScreen> {
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _contenidoController = TextEditingController();

  void _guardarNota(BuildContext context) {
    if (_tituloController.text.isNotEmpty && _contenidoController.text.isNotEmpty) {
      final nuevaNota = Nota(
        titulo: _tituloController.text,
        contenido: _contenidoController.text,
      );
      Provider.of<NotasProvider>(context, listen: false).agregarNota(nuevaNota);
      
      _tituloController.clear();
      _contenidoController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Nota guardada')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Crear Nota')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _tituloController,
              decoration: InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: _contenidoController,
              decoration: InputDecoration(labelText: 'Contenido'),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _guardarNota(context),
              child: Text('Guardar Nota'),
            ),
          ],
        ),
      ),
    );
  }
}
