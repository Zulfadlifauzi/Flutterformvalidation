import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:formvalid/models/register_model.dart';
import 'package:http/http.dart' as http;
import 'package:formvalid/progressHUD.dart';
import 'package:formvalid/screens/login.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class RegisterAPI {
  Future<RegisterResponse> register(
      String name, String email, String password) async {
    String url = 'http://api.staging.tarsoft.co/api/register';

    final response = await http.post(Uri.parse('$url'),
        body: {'name': name, 'email': email, 'password': password});
    if (response.statusCode == 200 || response.statusCode == 401) {
      print(response.body);
      // print(response.statusCode);
      return RegisterResponse.fromJson(json.decode(response.body));
    } else {
      print(response.body);
      throw Exception('Failed to load data');
    }
  }
}

class _SignupScreenState extends State<SignupScreen> {

  TextEditingController passController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<FormState>();

  late RegisterResponse _user;
  bool hidePassword = true;
  bool isApiCallprocess = false;

  @override
  void initState() {
    super.initState();
    _user = new RegisterResponse();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uibuild(context),
      inAsyncCall: isApiCallprocess,
      opacity: 0.3,
    );
  }

  Widget _uibuild(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
          key: scaffoldKey,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          )),
      backgroundColor: Color(0xFFffffff),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Container(
            padding: EdgeInsets.only(left: 40, right: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.04),
                Text(
                  'Prizes and Suprises',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF363f93)),
                ),
                Text(
                  'Await you !',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF363f93)),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                TextFormField(
                    controller: nameController,
                    onSaved: (input) => _user.name = input,
                    decoration: InputDecoration(labelText: 'Enter your name'),
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                        return 'Enter correct name';
                      } else {
                        return null;
                      }
                    }),
                SizedBox(height: height * 0.05),
                TextFormField(
                    controller: emailController,
                    onSaved: (input) => _user.email = input,
                    decoration: InputDecoration(labelText: 'Enter your email'),
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Enter your email'),
                      EmailValidator(errorText: 'Not A Valid Email')
                    ])),
                SizedBox(height: height * 0.05),
                TextFormField(
                  controller: passController,
                  onSaved: (input) => _user.password = input,
                  decoration: InputDecoration(labelText: 'Enter your password'),
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Enter your password'),
                    MinLengthValidator(6,
                        errorText: 'Should be at least 6 characters')
                  ]),
                  obscureText: hidePassword,
                ),
                SizedBox(height: height * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          final String name = nameController.text;
                          final String email = emailController.text;
                          final String password = passController.text;

                          if (validateAndSave()) {
                            setState(() {
                              isApiCallprocess = true;
                            });
                            RegisterAPI registerAPI = new RegisterAPI();
                            registerAPI
                                .register(name, email, password)
                                .then((value) => {
                                      setState(() {
                                        isApiCallprocess = false;
                                      }),
                                      if (value.token?.isNotEmpty ?? false)
                                        {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(
                                                      '${_user.message}')))
                                        }
                                      else
                                        {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content:
                                                      Text('Register Successfully')))
                                        }
                                    });
                            print(_user.toJson());
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 100.0),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 35, top: 10),
                            child: Text(
                              'Register',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          height: 40,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Color(0xFF363f93),
                          ),
                        )),
                    SizedBox(
                      height: height * 0.09,
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

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}

//ignore: must_be_immutable
class TextInput extends StatelessWidget {
  final String textString;
  TextEditingController textController;
  final bool obscureText;
  TextInput(
      {Key? key,
      required this.textString,
      required this.textController,
      required this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Color(0xFF000000)),
      cursorColor: Color(0xFF9b9b9b),
      controller: textController,
      keyboardType: TextInputType.text,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: this.textString,
        hintStyle: TextStyle(
            color: Color(0xFF9b9b9b),
            fontSize: 15,
            fontWeight: FontWeight.normal),
      ),
    );
  }
}
