// import 'package:flutter/material.dart';
// import 'package:formvalid/models/apis.dart';
// import 'package:formvalid/models/user_model.dart';

// class PostApi extends StatefulWidget {
//   const PostApi({Key? key}) : super(key: key);

//   @override
//   _PostApiState createState() => _PostApiState();
// }


// class _PostApiState extends State<PostApi> {
//     final passController =  TextEditingController();
//     final emailController =  TextEditingController();
//     final nameController =  TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('hello'),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(32),
//         child: Column(
//           children: <Widget>[
//              TextFormField(
//               controller: nameController,
//               decoration: InputDecoration(labelText: "Enter your name"),
//             ),
//             TextFormField(
//               controller: emailController,
//               decoration: InputDecoration(labelText: "Enter your email"),
//             ),
//             TextFormField(
//               controller: passController,
//               decoration: InputDecoration(labelText: "Enter your password"),
//             ),
//             SizedBox(
//               height: 32,
//             ),
//             // ignore: unnecessary_null_comparison
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           final String email = emailController.text;
//           final String password = passController.text;
//           final String name = nameController.text;
//           final UserModel user = await createUser(name,email, password);
//         },
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
