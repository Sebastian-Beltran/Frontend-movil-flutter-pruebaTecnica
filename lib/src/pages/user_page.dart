import 'package:flutter/material.dart';
import 'package:frontendapp/src/providers/userProvider.dart';
import 'package:frontendapp/src/models/User.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';




Color color1 = Colors.indigo;
Color color2 = Colors.deepPurple;


class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final userProvider = new UserProvider();

  UserModel user = new UserModel();
 @override
 Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

   final UserModel userData = ModalRoute.of(context).settings.arguments;

   if(userData != null){
     user = userData;
   }
  return Scaffold(
    // appBar: AppBar(
    //   title: Center(child: Text("EVENTO ")),
    // ),
    body: Container(
      width: width,
      height: height,
      child: Stack(
        children: <Widget>[
          Container(
            width: width,
            height: height * .30,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  color1,
                  color2,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            )
          ),
          _buildHeader(width,height,context),
          _buildHeaderInfoCard(width,height),
          buildNotificationPanel(width,height),
        ],
      ),
    ),
  );
  
 }

 Widget _buildHeader(double width, double height, context){
    return Positioned(
      top: 25,
      child: Container(
        width: width,
        height: height * .20,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(290.0,1.0,1.0,1.0),
            //   child: IconButton(
            //     onPressed: () => Navigator.pushNamed(context,'edit_event', arguments: user),
            //     icon: Icon(Icons.edit),
            //     iconSize: 25.0,
            //     color: Colors.white,
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0,18.0,10.0,2.0),
              child: Text("${user.firstName} ${user.lastName}", textAlign: TextAlign.center,style: TextStyle( fontSize: 30.0,color: Colors.white, fontWeight: FontWeight.bold),),
            ),
          ]
        )
      ),
    );
 }

 Widget _buildHeaderInfoCard(double width,double height){
   return Positioned(
     top: height * .30 - 25,
     width: width,
     child: Container(
       alignment: Alignment.center,
       child: Container(
         height: 50,
         width: width * .65,
         child: Material(
           elevation: 5.0,
           borderRadius: BorderRadius.circular(16.0),
           color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("T.D"),
                    Text(
                      "${user.typeDocument}",
                      style: TextStyle(
                        color: Color(0xff053150),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.people,
                  size: 35,
                  color: Colors.grey,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Documento"),
                    Text(
                      "${user.document}",
                      style: TextStyle(
                        color: Color(0xff053150),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
         
 }

 Widget buildNotificationPanel(double width, double height) {

    return Positioned(
      width: width,
      height: height * .70 - 40,
      top: height * 0.30 + 34,
      child: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16, top: 10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Material(
                elevation: 1,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    buildBodyCardTitle(title: "Datos del usuario"),
                    Divider(
                      height: 3,
                      color: Colors.black87,
                    ),
                    buildNotificationPlace(icon: Icons.email),
                    Divider(
                      height: 3,
                      color: Colors.black87,
                    ),
                    buildNotificationDate(icon: Icons.event),
                    Divider(
                      height: 3,
                      color: Colors.black87,
                    ),
                    buildNotificationType(icon: Icons.attach_money),
                    Divider(
                      height: 3,
                      color: Colors.black87,
                    ),
                    buildNotificationCategory(icon: Icons.local_phone),
                  ],
                ),
              ),
              SizedBox(height: 15),
             
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNotificationPlace({IconData icon}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 10),
        leading: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [color1, color2],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Icon(
            icon,
            size: 30,
            color: Colors.white70,
          ),
        ),
        // title: Text(
        //   "Lugar",
        //   style: TextStyle(color: Colors.grey, fontSize: 13),
        // ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Email",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "${user.email}",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
        // trailing: Container(
        //   height: 40,
        //   width: 70,
        //   decoration: BoxDecoration(
        //     border: Border(
        //       left: BorderSide(
        //         width: 1,
        //         color: Colors.black26,
        //       ),
        //     ),
        //   ),
        // ),
        onTap: () {},
      ),
    );
  }

  Widget buildNotificationDate({IconData icon}){

   
    
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 10),
        leading: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [color1, color2],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Icon(
            icon,
            size: 30,
            color: Colors.white70,
          ),
        ),
        // title: Text(
        //   "Lugar",
        //   style: TextStyle(color: Colors.grey, fontSize: 13),
        // ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Fecha de admision",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "${user.admissionDate.substring(0,10)}",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
        // trailing: Container(
        //   height: 40,
        //   width: 70,
        //   decoration: BoxDecoration(
        //     border: Border(
        //       left: BorderSide(
        //         width: 1,
        //         color: Colors.black26,
        //       ),
        //     ),
        //   ),
        // ),
        onTap: () {},
      ),
    );
  }

  Widget buildNotificationCategory({IconData icon}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 10),
        leading: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [color1, color2],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Icon(
            icon,
            size: 30,
            color: Colors.white70,
          ),
        ),
        // title: Text(
        //   "Lugar",
        //   style: TextStyle(color: Colors.grey, fontSize: 13),
        // ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Telefono",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "${user.phone}",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
        // trailing: Container(
        //   height: 40,
        //   width: 70,
        //   decoration: BoxDecoration(
        //     border: Border(
        //       left: BorderSide(
        //         width: 1,
        //         color: Colors.black26,
        //       ),
        //     ),
        //   ),
        // ),
        onTap: () {},
      ),
    );
  }

  Widget buildNotificationType({IconData icon}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 10),
        leading: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [color1, color2],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Icon(
            icon,
            size: 30,
            color: Colors.white70,
          ),
        ),
        // title: Text(
        //   "Lugar",
        //   style: TextStyle(color: Colors.grey, fontSize: 13),
        // ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Salario",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "${user.salary}",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
        // trailing: Container(
        //   height: 40,
        //   width: 70,
        //   decoration: BoxDecoration(
        //     border: Border(
        //       left: BorderSide(
        //         width: 1,
        //         color: Colors.black26,
        //       ),
        //     ),
        //   ),
        // ),
        onTap: () {},
      ),
    );
  }

  Widget buildBodyCardTitle({String title}) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              color: Colors.indigo,
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }


  
}



