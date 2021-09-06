// import 'package:flutter/cupertino.dart';
// class TextWidget extends StatefulWidget {
//   final String text;
//   int fontSize;
//   bool isUnderLine;
//   final Color color;
// TextWidget({Key? key,required this.text,required this.fontSize, required this.color, required this.isUnderLine}) : super(key: key);

//   @override
//   _TextWidgetState createState() => _TextWidgetState();
// }

// class _TextWidgetState extends State<TextWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(
//         bottom: 3,
//       ),
//       decoration: BoxDecoration(
//         border: Border(bottom: BorderSide(
//           color: widget.isUnderLine?Color(0xFF363f93):Color(0xFFffffff),
//           width: 1.0,
//         ))
//       ),
//       child: Text(this.widget.text, style: TextStyle(
//         fontSize: this.widget.fontSize.toDouble(),fontFamily: 'Avenir',
//         fontWeight: FontWeight.w900,
//         color: this.widget.color,
//       ),),
//     );
//   }
// }
