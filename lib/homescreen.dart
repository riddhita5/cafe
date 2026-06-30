import 'package:cafe/login.dart';
import 'package:cafe/orderscreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController Tablenumber = TextEditingController();

  late SharedPreferences sharedPreferences;
  var myuser;

  int counter = 0;

  var pizza = false;
  var burger = false;
  var coffee = false;

  @override
  void initState() {
    checkvalue();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          counter++;

          if (counter == 1) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Press back again to exit"),
                duration: Duration(seconds: 2),
              ),
            );

            Future.delayed(const Duration(seconds: 2), () {
              counter = 0;
            });

            return false;
          }

          return true;
        },

        child: Scaffold(
      appBar: AppBar(
        title: Text("Welcome $myuser", style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () {
              sharedPreferences.setBool("tops", true);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            icon: Icon(Icons.logout),
            color: Colors.white,
          ),
        ],
        backgroundColor: Colors.purpleAccent,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(38.0),
            child: Column(
              children: [
                Text(
                  "Table No:- ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Padding(padding: EdgeInsets.all(10)),
                TextField(
                  controller: Tablenumber,
                  decoration: InputDecoration(hintText: "Enter your table no"),
                ),
                SizedBox(height: 40),
                Center(
                  child: Text(
                    "Menu",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                SizedBox(height: 50),
                Container(
                  height: 800,
                  width: 300,
                  child: Column(
                    children: [
                      CheckboxListTile(
                        value: pizza,
                        onChanged: (value) {
                          setState(() {
                            pizza = value!;
                          });
                        },
                        title: Text("Pizza                  \t \t \t Rs. 199"),
                      ),
                      SizedBox(height: 10),

                      CheckboxListTile(
                        value: burger,
                        onChanged: (value) {
                          setState(() {
                            burger = value!;
                          });
                        },
                        title: Text("Burger             \t  \t \t \t Rs. 100"),
                      ),
                      SizedBox(height: 10),
                      CheckboxListTile(
                        value: coffee,
                        onChanged: (value) {
                          setState(() {
                            coffee = value!;
                          });
                        },
                        title: Text("Cold Coffee       \t \t \t Rs.120"),
                      ),
                      SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: () {
                          String data = Tablenumber.text.toString();
                          //sharedPreferences.setString("table", data);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BillScreen(mydata: data,pizza:pizza,burger:burger,coffee:coffee,),
                            ),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Ordered Sucessfully")),
                          );
                        },
                        child: Text("Order"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.pink.shade100,
    ));
  }

  checkvalue() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      myuser = sharedPreferences.getString("myemail")!;
    });
  }
}
