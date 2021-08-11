import 'dart:async';
import 'package:exam/ui/courseShowPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

FirebaseAuth _authUser = FirebaseAuth.instance;

class Code extends StatefulWidget {
  final String? phoneNumber;
  final String verificationId;
  Code(this.verificationId, {this.phoneNumber});

  @override
  _CodeState createState() => _CodeState();
}

class _CodeState extends State<Code> {
  TextEditingController smsCode = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController textEditingController = TextEditingController();

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              alignment: Alignment.topCenter,
              image:
                  NetworkImage("https://pngimg.com/uploads/pubg/pubg_PNG8.png"),
              colorFilter:
                  ColorFilter.mode(Colors.transparent, BlendMode.colorDodge),
            ),
          ),
          child: Stack(
            children: [
              Container(
                color: Colors.black87,
                child: Center(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            CupertinoIcons.arrow_left,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        "Verification code",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 25.0),
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 8),
                        child: RichText(
                          text: TextSpan(
                              text:
                                  "Please type the verification code sent\n to  ",
                              children: [],
                              style: TextStyle(
                                  color: Colors.white54, fontSize: 15)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Form(
                        key: formKey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 30),
                          child: PinCodeTextField(
                            appContext: context,
                            pastedTextStyle: TextStyle(
                              color: Colors.amber.shade600,
                              fontWeight: FontWeight.bold,
                            ),
                            length: 6,
                            obscureText: false,
                            // obscuringCharacter: '*',
                            // obscuringWidget: FlutterLogo(
                            //   size: 24,
                            // ),
                            blinkWhenObscuring: true,
                            animationType: AnimationType.scale,
                            validator: (v) {
                              if (v!.length < 3) {
                                return "I'm from validator";
                              } else {
                                return null;
                              }
                            },
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(5),
                              fieldHeight: 50,
                              fieldWidth: 40,
                              activeFillColor: Colors.white,
                            ),
                            cursorColor: Colors.black,
                            animationDuration: Duration(milliseconds: 300),
                            enableActiveFill: true,
                            errorAnimationController: errorController,
                            controller: textEditingController,
                            keyboardType: TextInputType.number,
                            boxShadows: [
                              BoxShadow(
                                offset: Offset(0, 1),
                                color: Colors.black12,
                                blurRadius: 10,
                              )
                            ],
                            onCompleted: (v) {
                              currentText = v;
                            },
                            // onTap: () {
                            //   print("Pressed");
                            // },
                            onChanged: (value) {
                              print(value);
                              setState(() {
                                currentText = value;
                              });
                            },
                            beforeTextPaste: (text) {
                              print("Allowing to paste $text");
                              return true;
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Text(
                          hasError
                              ? "*Please fill up all the cells properly"
                              : "",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Didn't receive the code? ",
                            style:
                                TextStyle(color: Colors.white54, fontSize: 15),
                          ),
                          TextButton(
                            onPressed: () => snackBar("OTP qayta yuborildi!!"),
                            child: Text(
                              "RESEND",
                              style: TextStyle(
                                  color: Color(0xFFFDCC33),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 30),
                        child: ButtonTheme(
                          height: 50,
                          child: TextButton(
                            onPressed: () async {
                              await _phoneVerify(context);
                            },
                            child: Center(
                              child: Text(
                                "VERIFY".toUpperCase(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Color(0xFFFDCC33),
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xFFFDCC33),
                                  offset: Offset(1, -2),
                                  blurRadius: 5),
                              BoxShadow(
                                  color: Color(0xFFFDCC33),
                                  offset: Offset(-1, 2),
                                  blurRadius: 5)
                            ]),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            child: TextButton(
                              child: Text("Clear"),
                              onPressed: () {
                                textEditingController.clear();
                              },
                            ),
                          ),
                          Flexible(
                            child: TextButton(
                              child: Text("Next"),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CourseShowPage(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: height / 1.9),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0)),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: height / 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "1",
                            style: TextStyle(fontSize: height / 25),
                          ),
                          Text(
                            "2",
                            style: TextStyle(fontSize: height / 25),
                          ),
                          Text(
                            "3",
                            style: TextStyle(fontSize: height / 25),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: height / 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "4",
                            style: TextStyle(fontSize: height / 25),
                          ),
                          Text(
                            "5",
                            style: TextStyle(fontSize: height / 25),
                          ),
                          Text(
                            "6",
                            style: TextStyle(fontSize: height / 25),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: height / 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "7",
                            style: TextStyle(fontSize: height / 25),
                          ),
                          Text(
                            "8",
                            style: TextStyle(fontSize: height / 25),
                          ),
                          Text(
                            "9",
                            style: TextStyle(fontSize: height / 25),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: height / 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "1",
                            style: TextStyle(
                                fontSize: height / 25, color: Colors.white),
                          ),
                          Text(
                            "0",
                            style: TextStyle(fontSize: height / 25),
                          ),
                          Icon(Icons.backspace_outlined, size: 25),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _phoneVerify(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
          verificationId: widget.verificationId, smsCode: smsCode.text);
      var _authCredential =
          await _authUser.signInWithCredential(phoneAuthCredential);
      if (_authCredential.user != null) {
        await Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => CourseShowPage()),
        );
      }
    }
  }
}
