import 'package:flutter/material.dart';

void mostrarAlerta(BuildContext context, String titulo, Function onPressed, String contenido, String actions, [Function onPressed2, String actions2]){
  showDialog(
    context: context,
    builder: (context){
      return AlertDialog(
        title: Text(titulo),
        content: Text(contenido),
        actions: <Widget>[
          FlatButton(
            onPressed: onPressed2,
            child: Text(actions2),
          ),
          FlatButton(
            onPressed: onPressed,
            child: Text(actions),
          )
        ],
      );
    }
  );
}
