import 'package:flutter/material.dart';

class IndefiniteProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(child: CircularProgressIndicator(),),
    );
  }
}
