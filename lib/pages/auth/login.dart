
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_item/config/app_config.dart';
import 'package:stock_item/models/auth/user.dart';
import 'package:stock_item/models/auth/userResponse.dart';
import 'package:stock_item/pages/auth/register.dart';
import 'package:stock_item/pages/dashboard.dart';
import 'package:stock_item/viewmodel/auth_view_model.dart';
import 'package:toast/toast.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {

   // Declare Form Value
  final _formKey = GlobalKey<FormState>();

  // Email Form Controller
  final _emailController = TextEditingController();

  // Password Form Controller
  final _passwordController = TextEditingController();

  // Return Value
  String _emailVal;
  String _passVal;


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
                            child: Text("Login Page",style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w600
                            ),),
                        ),
                        Container(
                          margin: EdgeInsets.only(top : 8),
                          child: Text("Please Login to Access App",style: TextStyle(
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
                                        _user.email = _emailVal;
                                        _user.password = _passVal;

                                        UserResponse userResponse = await model.login(_user);

                                        if(userResponse.code != 200) {
                                          Toast.show(userResponse.message, context);
                                        } else {

                                          // Set API Key Static

                                          SharedPreferences sp = await SharedPreferences.getInstance();
                                          sp.setString(AppConfig.API_KEY, userResponse.data.token);

                                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                                            builder: (_) => DashboardPage()
                                          ), (Route<dynamic> route) => false);

                                        }

                                      }


                                    },
                                    child: Text("Login",style: TextStyle(
                                      color: Colors.white
                                    ),),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (_) => RegisterPage()));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(top : 24),
                                    child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                          text: "Don't have account ? ",
                                          style: TextStyle(color: Colors.black54),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text : "Register",
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