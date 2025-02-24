import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/notas_provider.dart';

class NotasListaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final notasProvider = Provider.of<NotasProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Lista de Notas')),
      body: notasProvider.notas.isEmpty
          ? Center(child: Text('No hay notas aún'))
          : ListView.builder(
              itemCount: notasProvider.notas.length,
              itemBuilder: (context, index) {
                final nota = notasProvider.notas[index];
                return Card(
                  child: ListTile(
                    title: Text(nota.titulo),
                    subtitle: Text(nota.contenido),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => notasProvider.eliminarNota(index),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
