import 'package:flutter/material.dart';
import 'package:exammobile/global/global.parameter.dart';


class SignIn extends StatefulWidget {

  final Function toggleView;

  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {


  final _formKey = GlobalKey<FormState>();

  bool loading = false;

  //text field state
  String email = "";
  String password = "";

  String error = "";

  @override
  Widget build(BuildContext context) {


    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red[800],
        elevation: 0.0,
        title: Text('Cinema'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 30.0),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                      ),
                      validator: (val) => val.isEmpty ? 'Enter an email' : null,
                      onChanged: (val) {
                        setState(() {
                          email = val;
                        });
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Password',
                      ),
                      obscureText: true,
                      validator: (val) => val.length < 6 ? 'Enter a password at least 6 charcters long' : null,
                      onChanged: (val) {
                        setState(() {
                          password = val;
                        });
                      },
                    ),
                    SizedBox(height: 20.0),

                    SizedBox(height: 20.0),
                    RaisedButton(
                      onPressed: () async => {
                       GlobalParameter.email== email && GlobalParameter.password== password ?
                       {
                         setState(() {
                           error = "";
                         }),
                         Navigator.pop(context),
                         Navigator.pushNamed(context, "/Home")
                       }
                           :
                      setState(() {
                      error = "email or  password   incorrect";
                      })
                      },
                      color: Colors.red[800],
                      child: Text(
                        'Sign In',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 12.0),

                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),
                    ),
                    SizedBox(height: 20.0),

                  ],
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}