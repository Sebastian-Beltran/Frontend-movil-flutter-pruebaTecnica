//llamado de dependencias
import 'dart:convert';
import 'dart:io';
import 'package:frontendapp/src/models/User.dart';
import 'package:http/http.dart' as http;


class UserProvider{

final String _url = 'http://192.168.0.2:3000';

  Future<List<UserModel>> cargarUsers() async{
    
    final url = '$_url/users?';
    final resp = await http.get(url);
    // print(resp);
    final  decodedData = json.decode(resp.body);
    List datos = decodedData;
     print(datos);
    final List<UserModel> users = new List ();
    if( datos == null ) return null;
    datos.forEach(( user ){
      final eventsTemp = UserModel.fromJson(user);
      // cursosTemp.id = cursos ['id'];
      users.add(eventsTemp);
      
    });
     print(datos);
    return users;
  }

  
  Future<bool> crearUser( UserModel user) async{
    final url = '$_url/users';    
    final resp = await http.post(url, body:userModelToJson(user), headers: {HttpHeaders.contentTypeHeader: 'application/json'});
    final decodeData = json.decode(resp.body);
      print(decodeData);
    return true;
  }
  Future<bool> eliminarUser(String id) async{
    
    final url = '$_url/users/$id';
    final resp = await http.delete(url);
      // print(json.decode(resp.body));
    return true;

  }

  Future<bool> editarUser( UserModel user) async{
    
    final url = '$_url/users/${user.id}';    
    final resp = await http.put(url, body:userModelToJson(user), headers: {HttpHeaders.contentTypeHeader: 'application/json'});
    final decodeData = json.decode(resp.body);
      // print(decodeData);
    return true;

  }

  

}