import 'package:flutter/material.dart';

class customGradient extends StatelessWidget {
  final Widget child;
  const customGradient({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: AlignmentDirectional.topStart,
                        end: AlignmentDirectional.bottomEnd,
                        colors: [
                      Color.fromRGBO(47, 61, 74, 0),
                      Color.fromRGBO(12, 181, 149, 47)
                    ])),
      child: child,
    );
  }
}
