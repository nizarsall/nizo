import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../palette.dart';

class registerForm extends StatefulWidget {
  const registerForm() : super();

  @override
  State<registerForm> createState() => _registerFormState();
}

class _registerFormState extends State<registerForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: <Widget>[
          Container(
              height: 50,
              width: 200,
              margin: EdgeInsets.fromLTRB(2, 4, 2, 4),
              child: FormBuilderTextField(
                name: 'first name',
                decoration: InputDecoration(
                  hintText: 'الاسم',
                  prefixStyle: Gparagraph,
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: primary, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: primary, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0)),
                ),
              )),
          Container(
              height: 50,
              width: 200,
              margin: EdgeInsets.fromLTRB(2, 4, 2, 4),
              child: FormBuilderTextField(
                name: 'last name',
                decoration: InputDecoration(
                  hintText: 'الكنية',
                  prefixStyle: Gparagraph,
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: primary, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: primary, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0)),
                ),
              )),
          Container(
              height: 50,
              width: 200,
              margin: EdgeInsets.fromLTRB(2, 4, 2, 4),
              child: FormBuilderTextField(
                name: 'father name',
                decoration: InputDecoration(
                  hintText: 'الاسم الثلاثي',
                  prefixStyle: Gparagraph,
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: primary, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: primary, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0)),
                ),
              )),
          FormBuilderDropdown(
            name: 'gender',
            decoration: InputDecoration(
              hintText: 'الجنس ',
              prefixStyle: Gparagraph,
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: primary, width: 2.0),
                  borderRadius: BorderRadius.circular(25.0)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: primary, width: 2.0),
                  borderRadius: BorderRadius.circular(25.0)),
            ),
            // initialValue: 'Male',
            allowClear: true,
            hint: Text('Select Gender'), items: [],
          ),
          FormBuilderCheckbox(
            name: 'car',
            initialValue: false,
            title: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '؟هل تملك سيارة',
                    style: Wparagraph,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
