import 'package:flutter/material.dart';
import 'package:preferencias/src/share_prefs/preferencias_usuario.dart';
import 'package:preferencias/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
    final prefs = new PreferenciasUsuario();
  static final String routeName = 'home';
  @override
  Widget build(BuildContext context) {
prefs.ultimaPagina = HomePage.routeName;

    return Scaffold(
      appBar: AppBar(title: Text('Preferencias'),
      
      backgroundColor:  (prefs.colorSecundario)?Colors.indigo:Colors.green ,
      ),


      drawer:MenuWidget(),
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color segundario   ${prefs.colorSecundario}'),
          Divider(),
          Text('Genero ${prefs.genero}'),
          Divider(),
          Text('Nombre Usuario ${prefs.nombreUsuario}'),
          Divider(),
        ],
      ),
    );
  }


}
