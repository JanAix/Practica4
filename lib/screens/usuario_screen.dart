import 'package:flutter/material.dart';

class UsuarioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Información del Usuario')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(radius: 50, backgroundImage: AssetImage('assets/avatar.png')),
            SizedBox(height: 10),
            Text('Nombre: Juan Pérez', style: TextStyle(fontSize: 18)),
            Text('Email: juan.perez@email.com', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
