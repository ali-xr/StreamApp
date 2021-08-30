import 'package:exam/ui/code2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

FirebaseAuth _authUser = FirebaseAuth.instance;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String phone = "";
  String dropdownText = '+998';
  var _formkey = GlobalKey<FormState>();
  String? verificationId;
  var a = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              alignment: Alignment.topCenter,
              image: AssetImage("assets/images/pubg.png"),
            ),
            color: Colors.black87,
          ),
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: height / 2.5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0)),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 80.0, left: 30.0, right: 30.0),
                      child: Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          height: height / 16,
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 30, right: 30),
                            child: Form(
                              autovalidateMode: AutovalidateMode.always,
                              key: _formkey,
                              child: TextFormField(
                                validator: (e) {
                                  if (dropdownText == "+998") {
                                    if (phone.toString().length != 13) {
                                      return "Telefon raqamingizni to'liq kiriting!";
                                    }
                                  }
                                },
                                onChanged: (value) {
                                  phone = value;
                                  print(phone);
                                },
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  // border: InputBorder.none,
                                  hintText: 'Your phone number',
                                  hintStyle: TextStyle(fontSize: 20.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, top: 80, bottom: 80),
                      child: Center(
                        child: Text(
                          "Sizga bir martalik sms xabar yuboramiz. Sms kelishini kuting!",
                          style: TextStyle(
                              fontSize: 22.0, fontFamily: "GowunDodum"),
                        ),
                      ),
                    ),
                    MaterialButton(
                      color: Color(0xFFFDCC33),
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(18),
                      child: Icon(
                        CupertinoIcons.arrow_right,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        if (_formkey.currentState!.validate()) {
                          _formkey.currentState!.save();

                          await _authUser.verifyPhoneNumber(
                            phoneNumber: phone,
                            verificationCompleted: (phoneAuthCredential) {},
                            verificationFailed: (firebaseAuthException) {},
                            codeSent: (verificationId, resendToken) async {
                              setState(() {
                                this.verificationId = verificationId;
                              });
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Code2(verificationId, phoneNumber: phone),
                                ),
                              );
                            },
                            codeAutoRetrievalTimeout: (verificationId) {},
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
