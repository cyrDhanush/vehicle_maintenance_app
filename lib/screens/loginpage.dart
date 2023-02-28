import 'package:flutter/material.dart';
import 'package:vehicle_maintenance_app/global.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool rem = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Icon(
                Icons.car_crash_rounded,
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
            Container(
              height: 60,
              child: TextField(
                style: TextStyle(
                  fontSize: 18,
                ),
                obscureText: true,
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
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      rem = !rem;
                    });
                  },
                  child: Row(
                    children: [
                      Checkbox(
                        value: rem,
                        shape: CircleBorder(),
                        activeColor: maintheme,
                        checkColor: Colors.white,
                        onChanged: (res) {
                          setState(() {
                            rem = res!;
                          });
                        },
                      ),
                      Text(
                        'Remember me',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: maintheme,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {},
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
                  Container(
                    height: 60,
                    alignment: Alignment.center,
                    child: Text(
                      "Log in",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
