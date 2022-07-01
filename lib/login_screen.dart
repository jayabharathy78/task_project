import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:task_project/main_list_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.green.shade300,
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: MediaQuery.of(context).size.height*0.5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Welcome",style: TextStyle(color: Colors.white70,fontSize: 20,fontWeight: FontWeight.bold),),
                Text("Sign in to continue",style: TextStyle(color: Colors.white70,fontSize: 16,),),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "Username@gmail.com",
                      prefixIcon: Icon(Icons.account_circle,color: Colors.blueAccent,),
                      suffixIcon: Icon(Icons.done,color: Colors.blueAccent,),
                      fillColor: Colors.white),
                ),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "*******",
                      prefixIcon: Icon(Icons.account_circle,color: Colors.blueAccent,),
                      suffixIcon: Icon(Icons.done,color: Colors.blueAccent,),
                      fillColor: Colors.white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        FlutterSwitch(
                          width: 65.0,
                          height: 30.0,
                          valueFontSize: 15.0,
                          toggleSize: 25.0,
                          value: true,
                          activeColor: Colors.green.shade700,
                          borderRadius: 20.0,
                          padding: 8.0,
                          showOnOff: false,
                          onToggle: (val) {
                            // setState(() {
                            //   status = val;
                            // });
                          },
                        ),
                        SizedBox(width: 20,),
                        Text("Save Me",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500),),
                      ],
                    ),
                    Text("Forgot Password?",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500),),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> MainListScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green.shade700,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      elevation: 15.0,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "SIGN IN",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
