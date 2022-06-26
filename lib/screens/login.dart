import 'package:flutter/material.dart';
import 'package:shared_pref/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Column(
          children: [
            SizedBox(height: 100,),
            Container(
              width:150,
              height: 150,
              
              child: DecoratedBox(decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(80))
              )),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(left: 50,right: 50 ),
              child: TextField(
                controller: EmailController,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: "Email ID",
                  prefixIcon: Icon(Icons.email)
                ),
              ),
            ),
             SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.only(left: 50,right: 50),
              child: TextField(
                controller: PasswordController,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: "Password",
                  prefixIcon: Icon(Icons.lock)
                ),
                
              ),
            ),
            SizedBox(height: 50,),
            RaisedButton(onPressed: () async{
              
               SharedPreferences preferences = await SharedPreferences.getInstance();
     preferences.setString('password',PasswordController.text.toString());
     preferences.setString('email', EmailController.text.toString());
     Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (BuildContext ctx) => Home()));
            ;},
            child: Text("Login"),
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(80)),
            padding: EdgeInsets.symmetric(horizontal: 50),)
          ],
        )
      ),
    );
  }
}