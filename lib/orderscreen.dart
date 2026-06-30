// import 'package:flutter/material.dart';
//
// class Orderscreen extends StatefulWidget {
//   String mydata;
//   var pizza;
//   var burger;
//   var coffee;
//
//   Orderscreen({super.key, required this.mydata,required this.pizza,required this.burger,required this.coffee});
//
//   @override
//   State<Orderscreen> createState() => _OrderscreenState();
// }
//
// class _OrderscreenState extends State<Orderscreen> {
//   @override
//   Widget build(BuildContext context) {
//
//     int total = 0;
//     return Scaffold(
//       appBar: AppBar(title: Text("Bill Process",style: TextStyle(fontWeight: FontWeight.bold),),),
//       body: Center(
//         child: Padding(padding: EdgeInsetsGeometry.all(18), child: Column(
//           children: [
//         Text("Table No:- ${widget.mydata}",
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
//             Padding(padding: EdgeInsets.all(20)),
//         Text("Order Details",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
//
//     ],),),
//     ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class BillScreen extends StatelessWidget {

  final String mydata;

  final bool pizza;
  final bool burger;
  final bool coffee;

  BillScreen({
    required this.mydata,
    required this.pizza,
    required this.burger,
    required this.coffee,
  });

  @override
  Widget build(BuildContext context) {

    int total = 0;

    if (pizza) total += 199;
    if (burger) total += 100;
    if (coffee) total += 120;

    return Scaffold(

      appBar: AppBar(
        title: Text("Billing Process"),
      ),

      body: Padding(
        padding: EdgeInsets.all(20),

        child: Column(
          children: [

            Text(
              "Table Number : $mydata",

              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 20),

            Text(
              "Ordered Items",

              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            if (pizza)
              Text("Pizza - ₹199"),

            if (burger)
              Text("Burger - ₹100"),

            if (coffee)
              Text("Coffee - ₹120"),

            SizedBox(height: 20),

            Text(
              "Total : ₹$total",

              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}