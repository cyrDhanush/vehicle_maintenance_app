import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_maintenance_app/global.dart';
import 'package:vehicle_maintenance_app/screens/mainscreens/homeparent.dart';
import 'package:vehicle_maintenance_app/screens/signup.dart';
import 'package:vehicle_maintenance_app/services/constants.dart';
import 'package:vehicle_maintenance_app/services/user_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  Authentication _authentication = Authentication();

  String errortext = '';
  bool obscurepassword = true;
  bool loading = false;
  bool remember = true;

  login() async {
    String email, password;
    setState(() {
      loading = true;
    });

    email = emailcontroller.text;
    password = passwordcontroller.text;
    if (email != '' && password != '') {
      var result = await _authentication.loginUser(email, password);
      if (result.runtimeType == UserCredential) {
        Navigator.pushReplacementNamed(context, '/home');
      } else if (result.toString().contains('invalid-email')) {
        setState(() {
          errortext = 'Invalid email Format';
        });
      } else if (result.toString().contains('user-not-found')) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            contentPadding: EdgeInsets.all(50),
            title: Text(
              'User not Found',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            content: Text(
              "Do you Want to SIGNUP ??",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(),
                child: Text(
                  "Cancel",
                  style: TextStyle(),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/signup');
                },
                style: TextButton.styleFrom(
                  backgroundColor: maintheme,
                  foregroundColor: Colors.white,
                ),
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      } else if (result.toString().contains('wrong-password')) {
        setState(() {
          errortext = 'Oops, Wrong Password!!';
        });
      } else {
        setState(() {
          errortext = 'Login Successfully Failed';
        });
      }
    }
    setState(() {
      loading = false;
    });
  }

  bool rem = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/signup');
                    },
                    child: Text(
                      "Sign Up",
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
                    // height: MediaQuery.of(context).size.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Row(),
                        // Container(
                        //   child: Icon(
                        //     Icons.car_crash_sharp,
                        //     color: Colors.redAccent,
                        //     size: 100,
                        //   ),
                        // ),
                        Container(
                          height: 150,
                          width: 150,
                          child: Image.asset(
                            'assets/images/logo_color.png',
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
                            controller: emailcontroller,
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
                                  controller: passwordcontroller,
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
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  remember =
                                      (remember == true) ? (false) : (true);
                                });
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.only(right: 15),
                              ),
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: remember,
                                    shape: CircleBorder(),
                                    activeColor: maintheme,
                                    checkColor: Colors.white,
                                    onChanged: (res) {},
                                  ),
                                  Text(
                                    'Remember Me',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  color: maintheme,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextButton(
                          onPressed: (loading == true)
                              ? (null)
                              : (() {
                                  login();
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
                                  ? (CircularProgressIndicator(
                                      color: Colors.white,
                                    ))
                                  : (Container(
                                      height: 60,
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Log in",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    )),
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
            ],
          ),
        ),
      ),
    );
  }
}
