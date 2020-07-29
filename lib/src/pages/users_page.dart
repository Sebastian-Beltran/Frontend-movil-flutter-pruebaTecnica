import 'package:flutter/material.dart';
import 'package:frontendapp/src/providers/userProvider.dart';
import 'package:frontendapp/src/models/User.dart';
import 'package:frontendapp/src/utils/alerts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontendapp/styles/my_icons.dart';

class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {

  final userProvider = new UserProvider();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
   double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Usuarios", textAlign: TextAlign.left ,style: TextStyle(letterSpacing: 1.0,fontFamily: "Calibre-Semibold", fontWeight: FontWeight.bold, fontSize: 40.0),),
                  
                ],
              ),
            ),
            
            Container(
              child: SvgPicture.asset(iconP, height: 70,),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0,2.0,16.0,10.0),
              child: Container(
                width: width,
                height: height * .80,
                child: _crearListado()
               ),
              
            ),
                        
          ],
        ),
        ),
        floatingActionButton: _crearBoton(context),
    );
  }  

  Widget _crearListado() {
    return FutureBuilder(
      future: userProvider.cargarUsers(),
      builder:
          (BuildContext context, AsyncSnapshot<List<UserModel>> snapshot) {
        if (snapshot.hasData) {
          final users = snapshot.data;
          return Container(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, i) => _crearItem(context, users[i]),
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _crearItem(BuildContext context, UserModel user) {
      return Dismissible(
      key: UniqueKey(),
      secondaryBackground:  Container(
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(10.0),
          color: Colors.lightBlue,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.edit,
              color : Colors.white,
              size: 50.0
            )
          ],
        ),
      ),
      background: Container(
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(10.0),
          color: Colors.redAccent
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.delete_forever,
              color: Colors.white,
              size: 50.0
            )
          ],
        ),
      ),
      onDismissed: (direccion) {
        if (direccion == DismissDirection.startToEnd) {
          mostrarAlerta(
            context,
            "¿Desea eliminar el evento ${user.firstName}?",
            () {
              userProvider.eliminarUser("${user.id}");
              Navigator.of(context).pop();
              // setState(){};
            },
            "Tenga en cuenta que el evento sera eliminado permanentemente.",
            "Si",
            (){
              Navigator.of(context).pop();
              // setState(){};
            },
            "No"
          );
        }
        if (direccion == DismissDirection.endToStart) {
          Navigator.pushNamed(context,'edit_user', arguments: user);
        }

      },
      child: Card(
        elevation: 10,
        margin: EdgeInsets.fromLTRB(16.0,16.0,16.0,0),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text("${user.firstName} ${user.lastName}", style: TextStyle(fontWeight: FontWeight.bold),),
              // subtitle: Container( width: 2 , child: RaisedButton(onPressed: (){print("EVENTO");}, child: Text("${user.typeEvent}",style: TextStyle(color: Colors.white)) , color: Colors.lightBlueAccent, shape: StadiumBorder(),)),
              subtitle: Text("Correo: ${user.email}", textAlign: TextAlign.start,), 
              isThreeLine: true,
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () => Navigator.pushNamed(context, 'user', arguments: user),
            ),
          ],
        ),
      ),
    );
    
    
    
  }

  _crearBoton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Colors.indigo,
      onPressed: ()=> Navigator.pushNamed(context, 'create_user'),
      // onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CreateEvent())),
    );
  }
  
   
}


