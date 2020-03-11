import 'package:flutter/material.dart';
import 'package:preferencias/src/share_prefs/preferencias_usuario.dart';
import 'package:preferencias/src/widgets/menu_widget.dart';

class SettingPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _colorSecundario = false;
  int _genero;
  String _nombre = 'Pedro';

  final prefs = new PreferenciasUsuario();
  TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _genero = prefs.genero;

    prefs.ultimaPagina = SettingPage.routeName;
    _textEditingController =
        new TextEditingController(text: prefs.nombreUsuario);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ajustes'),
          backgroundColor:
              (prefs.colorSecundario) ? Colors.indigo : Colors.green,
        ),
        drawer: MenuWidget(),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'setting',
                style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            SwitchListTile(
                value: prefs.colorSecundario,
                title: Text('color Segundario'),
                onChanged: (value) {
                  setState(() {
                    _colorSecundario = value;

                    prefs.colorSecundario = value;
                  });
                }),
            RadioListTile(
              title: Text('Masculino'),
              value: 1,
              groupValue: _genero,
              onChanged: _setSelectedRadio,
            ),
            RadioListTile(
                title: Text('Femenino'),
                value: 2,
                groupValue: _genero,
                onChanged: _setSelectedRadio),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  labelText: 'nombre',
                  helperText: 'Nombre de la Persona',
                ),
                onChanged: (value) {
                  prefs.nombreUsuario = value;
                },
              ),
            )
          ],
        ));
  }

  _setSelectedRadio(int valor) {
    prefs.genero = valor;
    _genero = valor;

    setState(() {});
  }
}
