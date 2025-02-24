import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/nota.dart';

class NotasProvider extends ChangeNotifier {
  List<Nota> _notas = [];

  List<Nota> get notas => _notas;

  NotasProvider() {
    _cargarNotas();
  }

  // Agregar nota y guardar en localStorage
  void agregarNota(Nota nota) {
    _notas.add(nota);
    _guardarNotas();
    notifyListeners();
  }

  // Eliminar nota y actualizar localStorage
  void eliminarNota(int index) {
    _notas.removeAt(index);
    _guardarNotas();
    notifyListeners();
  }

  // Guardar notas en SharedPreferences (localStorage)
  Future<void> _guardarNotas() async {
    final prefs = await SharedPreferences.getInstance();
    final String notasJson = jsonEncode(_notas.map((n) => n.toJson()).toList());
    await prefs.setString('notas', notasJson);
  }

  // Cargar notas desde SharedPreferences
  Future<void> _cargarNotas() async {
    final prefs = await SharedPreferences.getInstance();
    final String? notasJson = prefs.getString('notas');
    if (notasJson != null) {
      final List<dynamic> notasList = jsonDecode(notasJson);
      _notas = notasList.map((n) => Nota.fromJson(n)).toList();
      notifyListeners();
    }
  }
}
