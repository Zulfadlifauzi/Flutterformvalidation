import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:formvalid/models/register.model.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController passController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  late RegisterRequestModel requestModel;

  @override
  void initState() {
    super.initState();
    requestModel = new RegisterRequestModel();
  }

  // final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
    final scaffoldKey = GlobalKey<ScaffoldState>();
    bool hidePassword = true;
    final double height = MediaQuery.of(context).size.height;
    // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      appBar: AppBar(
        key: scaffoldKey,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Color(0xFFffffff),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 40, right: 40),
              key: globalFormKey,
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
                  new TextFormField(
                      decoration: new InputDecoration(
                        hintText: 'Name',
                      ),
                      keyboardType: TextInputType.name,
                      onSaved: (input) => requestModel.name = input,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      }),
                  SizedBox(height: height * 0.05),
                  new TextFormField(
                    decoration: new InputDecoration(
                      hintText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (input) => requestModel.email = input,
                    validator: (input) => input!.contains('@')
                        ? 'Email Id should be valid'
                        : null,
                  ),
                  SizedBox(height: height * 0.05),
                  new TextFormField(
                    decoration: new InputDecoration(
                      hintText: 'Password',
                    ),
                    keyboardType: TextInputType.text,
                    onSaved: (input) => requestModel.password = input,
                    validator: (input) => input!.length < 6
                        ? 'Password should be more than 6 characters'
                        : null,
                    obscureText: hidePassword,
                  ),
                  SizedBox(height: height * 0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sign up',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF363f93)),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (validateAndSave()) {
                            print(requestModel.toJson());
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
                  SizedBox(
                    height: height * 0.08,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Sign in',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF363f93))),
                      Text(
                        'Forget Password',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF363f93)),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

bool validateAndSave() {
  var globalFormKey;
  final form = globalFormKey.currentState;
  if (form.validate()) {
    form.save();
    return true;
  }
  return false;
}



// ignore: must_be_immutable
// class TextInput extends StatelessWidget {
//   final String textString;
//   TextEditingController textController;
//   final bool obscureText;
//   TextInput(
//       {Key? key,
//       required this.textString,
//       required this.textController,
//       required this.obscureText})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       style: TextStyle(color: Color(0xFF000000)),
//       cursorColor: Color(0xFF9b9b9b),
//       controller: textController,
//       keyboardType: TextInputType.text,
//       obscureText: obscureText,
//       decoration: InputDecoration(
//         hintText: this.textString,
//         hintStyle: TextStyle(
//             color: Color(0xFF9b9b9b),
//             fontSize: 15,
//             fontWeight: FontWeight.normal),
//       ),
//     );
//   }
// }


