import 'package:flutter/material.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({ Key? key }) : super(key: key);

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: (){},
        ),
        elevation: 0,
        title: Text('Hood'),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.shopping_bag))
        ],
      ),
    );
  }
}