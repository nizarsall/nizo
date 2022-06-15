// @dart=2.10
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../palette.dart';

class CreatProfile extends StatefulWidget {
  CreatProfile() : super();

  @override
  _CreatProfileState createState() => _CreatProfileState();
}

enum gender { male, female }

class _CreatProfileState extends State<CreatProfile> {
  gender _character = gender.male;
  bool circular = false;
  PickedFile _imageFile;
  PickedFile _cardImageFile;
  final _globalkey = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _secondname = TextEditingController();
  TextEditingController _fathername = TextEditingController();
  TextEditingController _dob = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _globalkey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          children: <Widget>[
            imageProfile(),
            SizedBox(
              height: 20,
            ),
            nameTextField(),
            SizedBox(
              height: 20,
            ),
            secondnameTextField(),
            SizedBox(
              height: 20,
            ),
            fathernameTextField(),
            SizedBox(
              height: 20,
            ),
            dobField(),
            SizedBox(
              height: 20,
            ),
            Column(
              children: <Widget>[
                ListTile(
                  title: const Text(
                    'ذكر',
                    style: Gparagraph,
                  ),
                  leading: Radio<gender>(
                    activeColor: secondary,
                    fillColor: MaterialStateColor.resolveWith(
                      (states) => secondary,
                    ),
                    value: gender.male,
                    groupValue: _character,
                    onChanged: (gender value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text(
                    'انثى',
                    style: Gparagraph,
                  ),
                  leading: Radio<gender>(
                    activeColor: secondary,
                    fillColor: MaterialStateColor.resolveWith(
                      (states) => secondary,
                    ),
                    value: gender.female,
                    groupValue: _character,
                    onChanged: (gender value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("يرجى رفع صورة بطاقة رسمية او بطاقة عمل تحتوي صورة شخصية",
                    style: Gparagraph),
                cardimage(),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
            InkWell(
              onTap: () async {
                setState(() {
                  circular = true;
                  
                });
                if (_globalkey.currentState.validate()) {
                  Map<String, String> data = {
                    "name": _name.text,
                    "second Name": _secondname.text,
                    "father name": _fathername.text,
                    "DOB": _dob.text,
                  };
                }
              },
              child: Center(
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: secondary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: circular
                        ? CircularProgressIndicator(color: Colors.white,)
                        : Text(
                            "Submit",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(children: <Widget>[
        CircleAvatar(
          backgroundColor : Colors.white,
          radius: 70.0,
          backgroundImage: _imageFile == null
              ? AssetImage("assets/images/profileicon.png")
              : FileImage(File(_imageFile.path)),
        ),
        Positioned(
          bottom: 20.0,
          right: 20.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet()),
              );
            },
            child: Icon(
              Icons.camera_alt,
              color: Colors.white,
              size: 28.0,
            ),
          ),
        ),
      ]),
    );
  }

  Widget cardimage() {
    return Center(
      child: Stack(children: <Widget>[
        Container(
          height: 100,
          width: 300,
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Image.asset(
            _cardImageFile == null
                ? "assets/images/Bcardicon.jpg"
                : _imageFile.path,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          bottom: 20.0,
          right: 20.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet()),
              );
            },
            child: Icon(
              Icons.camera_alt,
              color: Colors.teal,
              size: 28.0,
            ),
          ),
        ),
      ]),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "اختر صورة شخصية",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }

  Widget nameTextField() {
    return TextFormField(
      controller: _name,
      validator: (value) {
        if (value.isEmpty) return "الاسم لا يمكن ان يكون فارغاً";

        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: primary,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: primary,
          width: 2,
        )),
        prefixIcon: Icon(
          Icons.person,
          color: secondary,
        ),
        labelText: "الاسم الاول",
        helperText: "الاسم لايمكن ان يكون فارغاّ",
        hintText: "الاسم الاول",
      ),
    );
  }

  Widget secondnameTextField() {
    return TextFormField(
      controller: _secondname,
      validator: (value) {
        if (value.isEmpty) return "الكنية لا يمكن ان يكون فارغاً";

        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.teal,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: primary,
          width: 2,
        )),
        prefixIcon: Icon(
          Icons.person,
          color: secondary,
        ),
        labelText: "الكنية",
        helperText: "الكنية لا يمكن ان يكون فارغاً",
        hintText: "الكنية ",
      ),
    );
  }

  Widget fathernameTextField() {
    return TextFormField(
      controller: _fathername,
      validator: (value) {
        if (value.isEmpty) return "اسم الاب لا يمكن ان يكون فارغاً";

        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.teal,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: primary,
          width: 2,
        )),
        prefixIcon: Icon(
          Icons.person,
          color: secondary,
        ),
        labelText: "اسم الاب",
        helperText: "اسم الاب لا يمكن ان يكون فارغاً",
        hintText: "اسم الاب ",
      ),
    );
  }

  Widget dobField() {
    return TextFormField(
      controller: _dob,
      validator: (value) {
        if (value.isEmpty) return "تاريخ الميلاد لايمكن ان يكون فارغاّ";

        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.teal,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: primary,
          width: 2,
        )),
        prefixIcon: Icon(
          Icons.person,
          color: secondary,
        ),
        labelText: "تاريخ الميلاد",
        helperText: "يرجى ادخال تاريخ الميلاد بشكل يوم/شهر/سنة",
        hintText: "01/01/2020",
      ),
    );
  }
}
