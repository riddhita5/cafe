import 'package:cafe/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget
{
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
{
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  late SharedPreferences sharedPreferences;
  var newuser;

  @override
  void initState() {
    checkvalue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Form", style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.pink.shade100),
      backgroundColor: Colors.pink.shade100,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                SizedBox(height: 10,),
                TextFormField(controller: emailController,
                  decoration: InputDecoration(hintText: "Enter Your Email",
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (emailController.text.isEmpty) {
                      return "Please Enter Your Email";
                    }
                  },),
                SizedBox(height: 10,),
                TextFormField(controller: passController,
                    decoration: InputDecoration(hintText: "Enter Your Password",
                        border: OutlineInputBorder()),
                    obscureText: true,
                    validator: (value) {
                      if (passController.text.isEmpty) {
                        return "Please Enter Your Password";
                      }
                    }),
                SizedBox(height: 10,),
                ElevatedButton(onPressed: () {
                  if (formkey.currentState!.validate()) {
                    String e = emailController.text.toString();
                    String p = passController.text.toString();
                    if (e == "r@gmail.com" && p == "1234") {
                      sharedPreferences.setBool("tops", false);
                      sharedPreferences.setString("myemail", e);
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Login Successfully")));
                      Navigator.push(context, MaterialPageRoute(builder: (
                          context) => HomeScreen()));
                    }
                    else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Login Failed")));
                    }
                  }
                },
                  child: Text(
                    "Login", style: TextStyle(color: Colors.black),),),
              ],
            ),),),
      ),
    );
  }

checkvalue() async
  {
    sharedPreferences = await SharedPreferences.getInstance();
    newuser = sharedPreferences.getBool("tops")??true;
      if (newuser == false)
      {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
  }
}