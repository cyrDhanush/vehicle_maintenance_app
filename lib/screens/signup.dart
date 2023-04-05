import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_maintenance_app/global.dart';
import 'package:vehicle_maintenance_app/screens/loginpage.dart';
import 'package:vehicle_maintenance_app/services/user_auth.dart';

class signUp extends StatefulWidget {
  const signUp({Key? key}) : super(key: key);

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String errortext = '';
  bool obscurepassword = true;
  Authentication _authentication = Authentication();
  bool loading = false;

  bool validate() {
    if (email.text != '' && name.text != '' && password.text != '') {
      //signup
      return true;
    } else {
      setState(() {
        errortext = '';
        if (email.text == '') {
          errortext += 'Enter Email Id\n';
        }
        if (name.text == '') {
          errortext += 'Enter Name\n';
        }
        if (password.text == '') {
          errortext += 'Enter Password Id\n';
        }
      });
      return false;
    }
  }

  showSuccess() async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text('Sign Up Successfull'),
        content: Text('You can Login Now'),
        contentPadding: EdgeInsets.all(30),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Go to Login Page'),
          ),
        ],
      ),
    );
  }

  signup() async {
    setState(() {
      loading = true;
    });
    var result =
        await _authentication.createUser(name.text, email.text, password.text);
    if (result.runtimeType == bool && result == true) {
      //success
      await showSuccess();

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    } else if (result.toString().contains('email-already-in-use')) {
      setState(() {
        errortext = 'Email Already in Use\nTry Logging in';
      });
    } else {
      setState(() {
        errortext = 'Sign up successfully Failed';
      });
    }
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () async {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Row(),
                      Container(
                        child: Icon(
                          Icons.car_crash_sharp,
                          color: Colors.redAccent,
                          size: 100,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "VehiCare",
                        style: TextStyle(
                          color: maintheme,
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 60,
                        child: TextField(
                          controller: name,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Name',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: maintheme,
                                width: 1,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: maintheme,
                                width: 0.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 60,
                        child: TextField(
                          controller: email,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Email',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: maintheme,
                                width: 1,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: maintheme,
                                width: 0.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 60,
                              child: TextField(
                                controller: password,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                                obscureText: obscurepassword,
                                obscuringCharacter: '*',
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                      color: maintheme,
                                      width: 1,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                      color: maintheme,
                                      width: 0.5,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                obscurepassword = !obscurepassword;
                              });
                            },
                            icon: (obscurepassword)
                                ? (Icon(Icons.visibility_outlined))
                                : (Icon(Icons.visibility_off_outlined)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextButton(
                        onPressed: (loading == true)
                            ? (null)
                            : (() {
                                if (validate() == true) {
                                  signup();
                                }
                              }),
                        style: TextButton.styleFrom(
                          backgroundColor: maintheme,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            (loading == true)
                                ? Container(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: (CircularProgressIndicator(
                                      color: Colors.white,
                                    )),
                                  )
                                : (Container(
                                    height: 60,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        errortext,
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
