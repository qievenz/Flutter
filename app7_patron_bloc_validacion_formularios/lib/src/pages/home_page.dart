import 'package:app7_patron_bloc_validacion_formularios/bloc/provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
        actions: [],),
    );
  }
}