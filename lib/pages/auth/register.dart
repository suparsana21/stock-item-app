
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_item/config/app_config.dart';
import 'package:stock_item/models/auth/user.dart';
import 'package:stock_item/models/auth/userResponse.dart';
import 'package:stock_item/pages/dashboard.dart';
import 'package:stock_item/viewmodel/auth_view_model.dart';
import 'package:toast/toast.dart';

class RegisterPage extends StatefulWidget {

  @override
  _RegisterPageState createState() => _RegisterPageState();

}

class _RegisterPageState extends State<RegisterPage> {

   // Declare Form Value
  final _formKey = GlobalKey<FormState>();

  // Return Value
  String _emailVal;
  String _passVal;
  String _nameVal;


  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<AuthViewModel>(
        builder: (_) => AuthViewModel(),
        child: Consumer(
            builder: (context,AuthViewModel model,_) => Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(top : MediaQuery.of(context).size.height * .25),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(width : 60,child: Image.asset("assets/box.png")),
                        Container(
                            margin: EdgeInsets.only(top : 16),
                            child: Text("Register Page",style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w600
                            ),),
                        ),
                        Container(
                          margin: EdgeInsets.only(top : 8),
                          child: Text("Please Register to Create App Account",style: TextStyle(
                              fontSize: 14,
                          ),),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 24,right: 24),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Name cannot be null';
                                      }


                                      _nameVal = value;


                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: "Name",
                                    )
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Email cannot be null';
                                    }

                                    if (!value.contains("@")) {
                                      return 'Wrong email format';
                                    }

                                    _emailVal = value;


                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: "Email",
                                  )
                                ),
                                TextFormField(
                                    obscureText: true,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Password cannot be null';
                                      }


                                      _passVal = value;


                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: "Password",
                                    )
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 24),
                                  width: MediaQuery.of(context).size.width,
                                  child: RaisedButton(
                                    color: Colors.blue,
                                    onPressed: () async {

                                      if (_formKey.currentState.validate()) {

                                        User _user = new User();
                                        _user.name = _nameVal;
                                        _user.email = _emailVal;
                                        _user.password = _passVal;

                                        UserResponse userResponse = await model.register(_user);

                                        if(userResponse.code != 200) {
                                          Toast.show(userResponse.message, context);
                                        } else {

                                          // Set API Key Static

                                          Toast.show("Register Success! Please Login", context);
                                          Navigator.pop(context);



                                        }

                                      }


                                    },
                                    child: Text("Register",style: TextStyle(
                                      color: Colors.white
                                    ),),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(top : 24),
                                    child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                          text: "Already have account ? ",
                                          style: TextStyle(color: Colors.black54),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text : "Login",
                                                style: TextStyle(
                                                    color: Colors.blue
                                                )
                                            )
                                          ]
                                      ),


                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
        ));

  }

}