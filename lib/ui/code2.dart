import 'package:exam/ui/courseShowPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

FirebaseAuth _authUser = FirebaseAuth.instance;

class Code2 extends StatefulWidget {
  final String? phoneNumber;
  final String? verificationId;
  Code2(this.verificationId, {this.phoneNumber});

  @override
  _Code2State createState() => _Code2State();
}

class _Code2State extends State<Code2> {
  var numbers;
  @override
  void initState() {
    super.initState();
    numbers = "******";
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    // var ranglar = List.generate(6, (index) => Colors.black);
    var raqamlar = List.generate(12, (index) {
      if (index < 9) {
        return (index + 1).toString();
      } else if (index == 9) {
        return " ";
      } else if (index == 10) {
        return "0";
      } else {
        return "x";
      }
    });
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  width: width,
                  height: height - 360,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          "assets/images/pubg.png"),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  width: width,
                  height: height - 360,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  width: width,
                  height: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Stack(
                    children: List.generate(
                          3,
                          (index) => Positioned(
                            left: 20 + (index % 3) * (20 + width / 3 - 80 / 3),
                            top: 20,
                            child: Container(
                              width: width / 3 - 80 / 3,
                              height: 75,
                              child: Center(
                                child: InkWell(
                                  onTap: () {
                                    var alamqilsin = numbers.split("");

                                    int k = 0;
                                    for (var i = 0; i < 6 && k == 0; i++) {
                                      if (alamqilsin[i] == "*") {
                                        alamqilsin[i] = (index + 1).toString();
                                        k = 1;
                                      }
                                    }
                                    var x = "";
                                    for (var i = 0; i < 6; i++) {
                                      x = x + alamqilsin[i];
                                    }

                                    setState(() {
                                      numbers = x;
                                      print("number " + numbers.toString());
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.white),
                                    child: Text(
                                      raqamlar[index],
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 30),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ) +
                        List.generate(
                          3,
                          (index) => Positioned(
                            left: 20 + (index % 3) * (20 + width / 3 - 80 / 3),
                            top: 115,
                            child: Container(
                              width: width / 3 - 80 / 3,
                              height: 75,
                              child: Center(
                                child: InkWell(
                                  onTap: () {
                                    var alamqilsin = numbers.split("");

                                    int k = 0;
                                    for (var i = 0; i < 6 && k == 0; i++) {
                                      if (alamqilsin[i] == "*") {
                                        alamqilsin[i] = (index + 4).toString();
                                        k = 1;
                                      }
                                    }
                                    var x = "";
                                    for (var i = 0; i < 6; i++) {
                                      x = x + alamqilsin[i];
                                    }

                                    setState(() {
                                      numbers = x;
                                      print("number " + numbers.toString());
                                    });
                                  },
                                  child: Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.white),
                                    child: Center(
                                        child: Text(
                                      raqamlar[index + 3],
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 30),
                                    )),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ) +
                        List.generate(
                          3,
                          (index) => Positioned(
                            left: 20 + (index % 3) * (20 + width / 3 - 80 / 3),
                            top: 210,
                            child: Container(
                              width: width / 3 - 80 / 3,
                              height: 75,
                              child: Center(
                                child: InkWell(
                                  onTap: () {
                                    var alamqilsin = numbers.split("");

                                    int k = 0;
                                    for (var i = 0; i < 6 && k == 0; i++) {
                                      if (alamqilsin[i] == "*") {
                                        alamqilsin[i] = (index + 7).toString();
                                        k = 1;
                                      }
                                    }
                                    var x = "";
                                    for (var i = 0; i < 6; i++) {
                                      x = x + alamqilsin[i];
                                    }

                                    setState(() {
                                      numbers = x;
                                      print("number " + numbers.toString());
                                    });
                                  },
                                  child: Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.white),
                                    child: Center(
                                        child: Text(
                                      raqamlar[index + 6],
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 30),
                                    )),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ) +
                        List.generate(
                          3,
                          (index) => Positioned(
                            left: 20 + (index % 3) * (20 + width / 3 - 80 / 3),
                            top: 305,
                            child: Container(
                              width: width / 3 - 80 / 3,
                              height: 75,
                              child: Center(
                                child: index == 0
                                    ? Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: Colors.white),
                                        child: Center(
                                          child: Text(
                                            raqamlar[index + 9],
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      )
                                    : index == 1
                                        ? InkWell(
                                            onTap: () {
                                              var alamqilsin =
                                                  numbers.split("");

                                              int k = 0;
                                              for (var i = 0;
                                                  i < 6 && k == 0;
                                                  i++) {
                                                if (alamqilsin[i] == "*") {
                                                  alamqilsin[i] =
                                                      (index - 1).toString();
                                                  k = 1;
                                                }
                                              }
                                              var x = "";
                                              for (var i = 0; i < 6; i++) {
                                                x = x + alamqilsin[i];
                                              }

                                              setState(() {
                                                numbers = x;
                                                print("number " +
                                                    numbers.toString());
                                              });
                                            },
                                            child: Container(
                                              height: 60,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  color: Colors.white),
                                              child: Center(
                                                child: Text(
                                                  raqamlar[index + 9],
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 30),
                                                ),
                                              ),
                                            ),
                                          )
                                        : InkWell(
                                            onTap: () {
                                              setState(() {
                                                var alamqilsin =
                                                    numbers.split("");

                                                int k = 0;
                                                for (var i = 0;
                                                    i < 6 && k == 0;
                                                    i++) {
                                                  if (alamqilsin[5 - i] !=
                                                      "*") {
                                                    alamqilsin[5 - i] = "*";
                                                    k = 1;
                                                  }
                                                }
                                                var x = "";
                                                for (var i = 0; i < 6; i++) {
                                                  x = x + alamqilsin[i];
                                                }

                                                numbers = x;
                                                print("number " +
                                                    numbers.toString());
                                              });
                                            },
                                            child: Container(
                                              height: 60,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  color: Colors.white),
                                              child: Center(
                                                child: index == 2
                                                    ? Icon(Icons.backspace_outlined,
                                                        size: 30)
                                                    : Text(
                                                        raqamlar[index + 9],
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 30),
                                                      ),
                                              ),
                                            ),
                                          ),
                              ),
                            ),
                          ),
                        ),
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 10,
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Positioned(
                top: 70,
                left: width / 2 - 115,
                child: Container(
                  width: 230,
                  child: Center(
                    child: Text(
                      "Verification code",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 25.0),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 120,
                left: width / 2 - 125,
                child: Container(
                  width: 250,
                  child: Center(
                    child: Text(
                      "Please type the verification code sent",
                      style: TextStyle(color: Colors.white54, fontSize: 15),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 140,
                left: width / 2 - 25,
                child: Container(
                  width: 50,
                  child: Center(
                    child: Text(
                      "to",
                      style: TextStyle(color: Colors.white54, fontSize: 15),
                    ),
                  ),
                ),
              ),
            ] +
            List.generate(
              6,
              (index) {
                return Positioned(
                  top: 180,
                  left: width / 2 - 170 + index.toDouble() * 60,
                  child: Container(
                    width: 40,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        numbers.split("")[index].toString(),
                        style: TextStyle(
                            color: numbers.split("")[index] == "*"
                                ? Colors.transparent
                                : Colors.black,
                            fontSize: 20),
                      ),
                    ),
                  ),
                );
              },
            ) +
            [
              Positioned(
                bottom: 450,
                left: MediaQuery.of(context).size.width / 2 - 30,
                child: Container(
                  alignment: Alignment.center,
                  width: 60,
                  height: 60,
                  child: InkWell(
                    child: Text(
                      "Clear",
                      style: TextStyle(color: Colors.blue, fontSize: 16.0),
                    ),
                    onTap: () {
                      setState(() {
                        numbers = "******";
                      });
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: 500,
                left: MediaQuery.of(context).size.width / 2 - 160,
                child: Container(
                  width: 320,
                  margin: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ButtonTheme(
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 100),
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
              ),
              Positioned(
                bottom: 590,
                left: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn't receive the code? ",
                      style: TextStyle(color: Colors.white54, fontSize: 15),
                    ),
                    TextButton(
                      onPressed: () async {
                        await _authUser.verifyPhoneNumber(
                          phoneNumber: widget.phoneNumber!,
                          verificationCompleted: (phoneAuthCredential) {},
                          verificationFailed: (firebaseAuthException) {},
                          codeSent: (verificationId, resendToken) async {
                            snackBar("OTP qayta yuborildi!!");
                          },
                          codeAutoRetrievalTimeout: (String verificationId) {},
                        );
                      },
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
              )
            ],
      ),
    );
  }

  _phoneVerify(BuildContext context) async {
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId!, smsCode: numbers);
    var _authCredential =
        await _authUser.signInWithCredential(phoneAuthCredential);
    if (_authCredential.user != null) {
      await Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CourseShowPage()),
      );
    }
  }

  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
