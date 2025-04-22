import 'package:flutter/material.dart';
import 'package:lotoreya/screens/home_page.dart';
import 'package:lottie/lottie.dart';

class WinnersPage extends StatefulWidget {

  final Set set;

  const WinnersPage({required this.set, super.key});

  @override
  State<WinnersPage> createState() => _WinnersPageState();
}

class _WinnersPageState extends State<WinnersPage> {

  List list = [];

  @override
  void initState() {
    super.initState();
    list = widget.set.toList();
  }

  @override
  Widget build(BuildContext context) {

    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: SingleChildScrollView(
        child: Container(
          height: sizeHeight,
          width: sizeWidth,
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Lottie.asset("assets/jsons/Animation - 1745327116345.json"),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.deepPurple.shade900),
                    child: Center(child: Text("${list[0]}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                  ),
                  SizedBox(height: 30),
                  Row(
                    spacing: 30,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.deepPurple.shade900),
                        child: Center(child: Text("${list[1]}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.deepPurple.shade900),
                        child: Center(child: Text("${list[2]}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                      ),
                    ],
                  )
                ],
              ),
              MaterialButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage())),
                height: sizeHeight * 0.08,
                minWidth: sizeWidth * 0.5,
                color: Colors.blue.shade700,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30), side: BorderSide(width: 2, color: Colors.blue.shade300)),
                child: Text("Home", style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
