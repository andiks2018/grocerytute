import 'package:flutter/material.dart';
import 'package:grocerytute/pages/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 80.0, top: 160, right: 80, bottom: 40),
            child: Image.asset("img/avocado.png"),
          ),

          const Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              "We deliver groceries at your doorstep",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            ),
          ),

          ///
          ///
          SizedBox(
            height: 24,
          ),
          Text(
            "Fresh items everyday",
            style: TextStyle(color: Colors.grey[600]),
          ),

          const Spacer(),
          GestureDetector(
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const HomePage();
            })),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(24),
              child: Text("Get Started"),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
