import 'package:frontendapp/src/utils/numeric.dart' as utils;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:frontendapp/src/providers/userProvider.dart';
import 'package:frontendapp/src/models/User.dart';



class CreateUser extends StatefulWidget {
  @override
  _CreateUserState createState() => _CreateUserState();
}

Color color1 = Colors.indigo;
Color color2 = Colors.deepPurple;


UserModel user = new UserModel();

final userProvider = new UserProvider();



class _CreateUserState extends State<CreateUser> {

  // final List<User> usuarios;
  final formKey = GlobalKey<FormState>();
  


  // _CreateUserState({@required this.usuarios})
  @override 
  void initState(){
  
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crear usuario"),
        // backgroundColor: Colors.white,
      ),
      body: _crearUser(),
    );
  }

  Widget _crearUser(){
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 1.0,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            padding: EdgeInsets.symmetric(vertical: 15.0),
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 30.0,
                  offset: Offset(0.0, 4.0),
                  spreadRadius: 3.0,
                )
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Container(
              padding: EdgeInsets.fromLTRB(15.0,1,10.0,10.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    SizedBox(height: 15.0),
                    Text("Nombre del usuario", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
                    SizedBox(height: 7.0),
                    _crearNombre(),

                    SizedBox(height: 15.0),
                    Text("Apellido del usuario", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
                    SizedBox(height: 7.0),
                    _crearApellido(),

                    SizedBox(height: 15.0),
                    Text("Tipo de documento", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
                    SizedBox(height: 7.0),
                    _crearTipoDoc(),

                    SizedBox(height: 15.0),
                    Text("Numero de documento", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
                    SizedBox(height: 7.0),
                    _crearDocumento(),
                    
                    

                    SizedBox(height: 15.0),
                    Text("Email", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
                    SizedBox(height: 7.0),
                    _crearEmail(),

                    
                    SizedBox(height: 15.0),
                    Text("Telefono", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
                    SizedBox(height: 7.0),
                    _crearTelefono(),

                    

                    SizedBox(height: 15.0),
                    Text("Fecha de admision",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
                    SizedBox(height: 7.0),
                    CrearFecha(),

                    SizedBox(height: 15.0),
                    Text("Salario", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
                    SizedBox(height: 7.0),
                    _crearSalario(),

                    

                    SizedBox(height: 15.0,),
                     Padding(
                       padding: const EdgeInsets.fromLTRB(110,8,1,8),
                       child: _botonCrearEvento(),
                     ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  
  


  Widget _crearNombre(){
    return Container(
      child: TextFormField(
        onSaved: (value) => user.firstName = value,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(14.0),
          // hintText: 'Nombre user',
          prefixIcon: Icon(Icons.account_circle,color: Colors.indigo,),
          labelText: 'Nombre del usuario',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          )
        ),
      ),
    );
  }

  Widget _crearTipoDoc(){
    return Container(
      child: TextFormField(
        onSaved: (value) => user.typeDocument = value,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(14.0),
          // hintText: 'Nombre user',
          prefixIcon: Icon(Icons.call_to_action,color: Colors.indigo,),
          labelText: 'Tipo de Documento',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          )
        ),
      ),
    );
  } 

  Widget _crearEmail(){
    return Container(
      child: TextFormField(
        onSaved: (value) => user.email = value,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(14.0),
          // hintText: 'Nombre user',
          prefixIcon: Icon(Icons.contact_mail,color: Colors.indigo,),
          labelText: 'Correo personal',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          )
        ),
      ),
    );
  }

  Widget _crearApellido(){
    return Container(
      child: TextFormField(
        onSaved: (value) => user.lastName = value,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(14.0),
          // hintText: 'Nombre user',
          prefixIcon: Icon(Icons.account_circle,color: Colors.indigo,),
          labelText: 'Apellido del usuario',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          )
        ),
      ),
    );
  }
  Widget _crearTelefono(){
    return Container(
      child: TextFormField(
        keyboardType: TextInputType.numberWithOptions(),
        onSaved: (value) => user.phone = int.parse(value),
        validator: (value){
          if (utils.isNumeric(value)) {
            return null;
          }else{
            return 'Solo números';
          }
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(14.0),
          // hintText: 'Nombre user',
          prefixIcon: Icon(Icons.contact_phone,color: Colors.indigo,),
          labelText: 'Numero de telefono',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          )
        ),
      ),
    );
  }

  Widget _crearDocumento(){
    return Container(
      child: TextFormField(
        keyboardType: TextInputType.numberWithOptions(),
        onSaved: (value) => user.document = int.parse(value),
        validator: (value){
          if (utils.isNumeric(value)) {
            return null;
          }else{
            return 'Solo números';
          }
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(14.0),
          // hintText: 'Nombre user',
          prefixIcon: Icon(Icons.call_to_action,color: Colors.indigo,),
          labelText: 'Numero de documento',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          )
        ),
      ),
    );
  }

  Widget _crearSalario(){
    return Container(
      child: TextFormField(
        keyboardType: TextInputType.numberWithOptions(),
        onSaved: (value) => user.salary = int.parse(value),
        validator: (value){
          if (utils.isNumeric(value)) {
            return null;
          }else{
            return 'Solo números';
          }
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(14.0),
          // hintText: 'Nombre user',
          prefixIcon: Icon(Icons.attach_money,color: Colors.indigo,),
          labelText: 'Salario del empleado',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          )
        ),
      ),
    );
  }

  Widget _botonCrearEvento(){
    return Container(
      width: 210.0,
      height: 55.0,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        gradient: LinearGradient(colors: [color1,color2]),
      ),
      child: MaterialButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: const StadiumBorder(),
        child: Row(
          children: <Widget>[
            Icon(Icons.send,color: Colors.white,),
            SizedBox(width: 8,),
            Text("CREAR USUARIO", style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold, color: Colors.white),),
          ],
        ),
        onPressed: _submit,
      ),
    );
  }
  void _submit(){

    formKey.currentState.save();
    // key.currentState;

    print(user.admissionDate);
    print(user.firstName);
    print(user.lastName);
    print(user.salary);
    print(user.email);
    print(user.admissionDate);
    print(user.phone);
    print(user.typeDocument);
    print(user.document);


    userProvider.crearUser(user);

    Navigator.pushNamed(context, 'users');
  }

}

class CrearFecha extends StatelessWidget {
  final format = DateFormat("dd/MM/yyyy");
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      // Text('Basic date field (${format.pattern})'),
      DateTimeField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(14.0),
          labelText: "Fecha de admision del usuario",
          prefixIcon: Icon(Icons.date_range,color: Colors.indigo,),
        ),
        format: format,
        onSaved: (DateTime value){
          user.admissionDate = value.toString();
        },
        onShowPicker: (context, currentValue) {
          return showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
        },
      ),
    ]);
  }
  
}

