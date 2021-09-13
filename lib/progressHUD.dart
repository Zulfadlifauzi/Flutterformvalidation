import 'package:flutter/material.dart';

class ProgressHUD extends StatelessWidget {

  final Widget? child;
  final bool inAsyncCall;
  final double opacity;
  final Color color;

  ProgressHUD({
    Key? key,
    @required this.child,
    required this.inAsyncCall,
    this.opacity = 0.3,
    this.color = Colors.grey,
    // this.valueColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    List<Widget> widgetList = <Widget>[];
    widgetList.add(child!);
    if (inAsyncCall) {
      final modal = new Stack(
        children: <Widget>[
          new Opacity(
            opacity: opacity,
            child: ModalBarrier(dismissible: false, color: color),
          ),
          new Center(
            child: new CircularProgressIndicator()
          ),
        ],
      );
      widgetList.add(modal);
    }
    return Stack(
      children: widgetList,
    );
  }
}