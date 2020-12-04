import 'package:flutter/material.dart';
import 'package:quiz_app_v1/services/auth.dart';

import '../../variables.dart';
class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  //text field store
  String email = "";
  String password = "";
  //
  String error = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.purple[400],
        title: Text('Sign in to Quiz App'),
        actions: [
          FlatButton.icon(
              onPressed: (){
                widget.toggleView();
              },
              icon: Icon(Icons.person),
              label: Text('Register'))
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
                },
              ),
              SizedBox(height: 24,),
              RaisedButton(

                color: Colors.purple,
                child: Text('Sign In',
                style: TextStyle(
                  color: Colors.white,
                ),),
                onPressed: ()async{
                  if(_formKey.currentState.validate())
                    {
                      dynamic result = await _auth.signInWithEail(email, password);
                      if(result == null)
                        {
                           setState(() {
                             error = "could not sign in with those credentials";
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
