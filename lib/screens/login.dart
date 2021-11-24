import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:formvalid/models/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:formvalid/progressHUD.dart';
import 'package:formvalid/screens/signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class APIService {
  Future<LoginRequestModel> login(String email, String password) async {
    String url = 'http://api.staging.tarsoft.co/api/login';

    final response = await http
        .post(Uri.parse('$url'), body: {'email': email, 'password': password});
    if (response.statusCode == 200 || response.statusCode == 401) {
      print(response.statusCode);
      return LoginRequestModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}

class _SignupScreenState extends State<LoginScreen> {
  TextEditingController passController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();

  late LoginRequestModel loginRequestModel;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<FormState>();
  bool isApiCallprocess = false;
  bool hidePassword = true;

  @override
  void initState() {
    super.initState();
    loginRequestModel = new LoginRequestModel();
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
      ),
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
                  'Here to Get',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF363f93)),
                ),
                Text(
                  'Welcome !',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF363f93)),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                SizedBox(height: height * 0.05),
                TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(labelText: 'Enter your email'),
                    onSaved: (input) => loginRequestModel.email = input,
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Enter your email'),
                      EmailValidator(errorText: 'Not A Valid Email')
                    ])),
                SizedBox(height: height * 0.05),
                TextFormField(
                  controller: passController,
                  decoration: InputDecoration(labelText: 'Enter your password'),
                  onSaved: (input) => loginRequestModel.password = input,
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
                        style: TextButton.styleFrom(
                            textStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF363f93))),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignupScreen()));
                        },
                        child: Text('Sign up',
                            style: TextStyle(color: Color(0xFF363f93)))),
                    TextButton(
                      onPressed: () {
                        //  Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => HomePageScreen()));
                        final String email = emailController.text;
                        final String password = passController.text;
                        final text = 'Login Succesfully';
                        final usernf = 'Invalid Credentials';
                        final snackBar = SnackBar(content: Text(text));
                        final snackBar1 = SnackBar(content: Text(usernf));
                        if (validateAndSave()) {
                          setState(() {
                            isApiCallprocess = true;
                          });
                          APIService apiService = new APIService();
                          apiService.login(email, password).then((value) => {
                                setState(() {
                                  isApiCallprocess = false;
                                }),
                                if (value.token?.isNotEmpty ?? false)
                                  {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar1)
                                  }
                                else
                                  {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar)
                                  }
                              });
                          print(loginRequestModel.toJson());
                        }
                      },
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF363f93),
                        ),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: height * 0.12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        style: TextButton.styleFrom(
                            textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF363f93))),
                        onPressed: () {},
                        child: Text('Sign in',
                            style: TextStyle(color: Color(0xFF363f93)))),
                    Text(
                      'Forgot password',
                      style: TextStyle(color: Colors.grey[500]),
                    )
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
