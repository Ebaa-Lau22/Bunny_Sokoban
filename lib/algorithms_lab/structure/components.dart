
import 'package:flutter/material.dart';

void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
      (route) => false,
);


Widget defaultButton({
  double width = double.infinity,
  double height = 45,
  double borderRadius = 15,
  required void Function()? onPressed,
  required String text,
  double fontSize = 16,
  required Color textColor,
  required Color buttonColor,
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(borderRadius)),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            color: textColor,
          ),
        ),
      ),
    );

class MyStack<E> {
  final _list = <E>[];

  void push(E value) => _list.add(value);

  E pop() => _list.removeLast();

  E get peek => _list.last;

  bool get isEmpty => _list.isEmpty;

  bool get isNotEmpty => _list.isNotEmpty;

  int get length => _list.length;

  void clear() {
    while(this.isNotEmpty){
      this.pop();
    }
  }

  @override
  String toString() => _list.toString();
}

