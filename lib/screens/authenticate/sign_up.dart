import 'package:flutter/material.dart';
import 'package:quiz_app_v1/services/auth.dart';

import '../../variables.dart';
class SignUp extends StatefulWidget {
  final Function toggleView;
  SignUp({this.toggleView});
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  //text field store
  String name = "";
  String email = "";
  String password = "";
  String error ="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.purple[400],
        title: Text('Register in Quiz App'),
        actions: [
          FlatButton.icon(
              onPressed: (){
                widget.toggleView();
              },
              icon: Icon(Icons.person),
              label: Text('Sign in'))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16,horizontal: 16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 16,),
              TextFormField(
                validator: (val) => val.length < 3 ? 'Enter a name 3+ chars long' : null ,
                keyboardType:TextInputType.name,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'User Name',
                    labelStyle: myStyle(15),
                    border: OutlineInputBorder(
                        borderRadius:BorderRadius.circular(20)
                    ),
                    prefixIcon: Icon(Icons.person)),
                onChanged: (value){
                  setState(() {
                    name = value;
                  });
                },
              ),
              SizedBox(height: 16,),
              TextFormField(
                validator: (val) => val.isEmpty ? ' enter an email' : null,
                keyboardType:TextInputType.emailAddress,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Email',
                    labelStyle: myStyle(15),
                    border: OutlineInputBorder(
                        borderRadius:BorderRadius.circular(20)
                    ),
                    prefixIcon: Icon(Icons.email)
                ),
                onChanged: (value){
                  setState(() {
                    email = value;
                  });
                },
              ),
              SizedBox(height: 16,),
              TextFormField(
                validator: (val)=> val.length < 6 ? 'Enter a password 6+ chars long' : null,
                obscureText: true,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Password',
                    labelStyle: myStyle(15),
                    border: OutlineInputBorder(
                        borderRadius:BorderRadius.circular(20)
                    ),
                    prefixIcon: Icon(Icons.lock)
                ),
                onChanged: (value){
                  setState(() {
                    password = value;
                  });
                },),
              SizedBox(height: 24,),
              RaisedButton(
                color: Colors.purple,
                child: Text('Register',
                  style: TextStyle(
                    color: Colors.white,
                  ),),
                onPressed: () async{
                  if(_formKey.currentState.validate())
                    {
                       dynamic result = await _auth.registerWithEail(email, password);
                       if(result == null)
                         {
                           setState(() {
                             error =" please supply  a vaild email";
                           });
                         }
                    }
                },
              ),
              SizedBox(height: 20,),
              Text(error,
              style: TextStyle(color: Colors.red, fontSize: 14.0),),
            ],
          ),
        ),
      ),
    );
  }
}
