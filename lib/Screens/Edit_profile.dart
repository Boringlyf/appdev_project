import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import './profile_page.dart';

import '../models/user_model.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final FName_controller = TextEditingController();
  final LName_controller = TextEditingController();
  final phone_controller = TextEditingController();
  final address_controller = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  @override
  void dispose() {
    FName_controller.dispose();
    LName_controller.dispose();
    phone_controller.dispose();
    address_controller.dispose();
    super.dispose();
  }

  User? user = FirebaseAuth.instance.currentUser!;
  UserModel loggedinuser = UserModel();
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedinuser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Account Details"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 115,
                    width: 115,
                    child: Stack(
                      fit: StackFit.expand,
                      clipBehavior: Clip.none,
                      children: [
                        Expanded(
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://pbs.twimg.com/media/Eu7e3mQVgAImK2o?format=png&name=large"),
                            backgroundColor: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Edit Your Profile",
                    textScaleFactor: 2,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                      initialValue: loggedinuser.firstname,
                      decoration: InputDecoration(
                        icon: const Icon(Icons.person),
                        labelText: "First Name",
                        hintText: "Edit Your First Name",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 42, vertical: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: const BorderSide(color: Colors.black12),
                          gapPadding: 10,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Your First Name";
                        }
                        return null;
                      },
                      onChanged: (text) {
                        FName_controller.text = text;
                      }),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                      initialValue: loggedinuser.lastname,
                      decoration: InputDecoration(
                        labelText: "Last Name",
                        hintText: "Enter Your Last Name",
                        icon: const Icon(Icons.person),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 42, vertical: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: const BorderSide(color: Colors.black12),
                          gapPadding: 10,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Yout Last Name";
                        }
                        return null;
                      },
                      onChanged: (text) {
                        LName_controller.text = text;
                      }),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                      initialValue: loggedinuser.phone,
                      decoration: InputDecoration(
                        labelText: "Phone Number",
                        hintText: "Enter Your Phone Number",
                        icon: const Icon(Icons.phone),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 42, vertical: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: const BorderSide(color: Colors.black12),
                          gapPadding: 10,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Your Phone No";
                        }
                        return null;
                      },
                      onChanged: (text) {
                        phone_controller.text = text;
                      }),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                      initialValue: loggedinuser.address,
                      decoration: InputDecoration(
                        labelText: "Address",
                        hintText: "Enter Your Address",
                        icon: const Icon(Icons.home),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 42, vertical: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: const BorderSide(color: Colors.black12),
                          gapPadding: 10,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter your Address";
                        }
                        return null;
                      },
                      onChanged: (text) {
                        address_controller.text = text;
                      }),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          postDetailsToFirestore();
                        }
                      },
                      child: const Text('Save'),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;
    UserModel userModel = UserModel();

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstname = FName_controller.text.trim();
    userModel.lastname = LName_controller.text.trim();
    userModel.phone = phone_controller.text.trim();
    userModel.address = address_controller.text.trim();

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());

    Fluttertoast.showToast(msg: "Account Edited Successfully");

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const ProfilePage()),
        (route) => false);
  }
}
