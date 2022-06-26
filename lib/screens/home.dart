import 'package:flutter/material.dart';
import 'package:shared_pref/main.dart';
import 'package:shared_pref/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  
  Future logout() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var email = preferences.getString('email');
      var password = preferences.getString('password');
      print(email);
      print(password);
    setState(() {
    preferences.remove('password');
    preferences.remove('email');
      
     Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (BuildContext ctx) => Login()));
    });
 }

  Widget build(BuildContext context) {
 TextEditingController TodoListController = TextEditingController();
 List <String> Todo = [];
  add() async{
  // Todo.add(TodoListController.text);
//  print(Todo);
//  print(Todo);
final prefs = await SharedPreferences.getInstance();
 await prefs.setStringList('values',  <String>  [TodoListController.text]);
  setState(() {
    
  // Todo.add(prefs.getStringList('values'))  ;
  print(prefs.getStringList('values'));
  // print(Todo);
  });
 }
 Future showAll()async{
  SharedPreferences create= await SharedPreferences.getInstance();
    create.getStringList('values');
    // print(create.getStringList('values'));`
 }
      return Scaffold(
        body:Column(
          children: [
            Container(
              color: Colors.lightBlue,
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SizedBox(height: 50,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:40.0),
                      child: TextField(
                        controller: TodoListController,
                        decoration: InputDecoration(hintText: "Create Todo List"),),
                    ),
                     SizedBox(height: 20,),
                    RaisedButton(onPressed: (){add();},child: Text("Create"),),
                  ],
                ),
              ),
            ),
            // Expanded(child: 
            // ListView.builder(itemBuilder: )
            // )
            SizedBox(height: 20,),
            RaisedButton(onPressed: (){logout();},child: Text("Logout"),)
          ],
        )
      );
  }
}