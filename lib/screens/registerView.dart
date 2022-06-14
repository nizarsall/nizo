import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:untitled/palette.dart';
import '../widgets/registerFormWidget.dart';
class registerViewFrom extends StatefulWidget {
  const registerViewFrom() : super();

  @override
  State<registerViewFrom> createState() => _registerViewFromState();
}

class _registerViewFromState extends State<registerViewFrom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: Center(child: SingleChildScrollView(child: registerForm(),),)
    );
  }
}