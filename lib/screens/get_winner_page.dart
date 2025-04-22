import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lotoreya/screens/winners_page.dart';

class GetWinnerPage extends StatefulWidget {

  final int start;
  final int end;
  final int limit;

  const GetWinnerPage({required this.start, required this.end, required this.limit,super.key});

  @override
  State<GetWinnerPage> createState() => _GetWinnerPageState();
}

class _GetWinnerPageState extends State<GetWinnerPage> {

  Set<int> set = {};
  late int num;

  @override
  void initState() {
    super.initState();
    num = Random().nextInt(widget.end + widget.start);
  }

  Set _winnersSet(){
    while(set.length < widget.limit){
      num = Random().nextInt(widget.end + widget.start);
      set.add(num);
    }
    return set;
  }

  TextEditingController controllerStart = TextEditingController();
  TextEditingController controllerEnd = TextEditingController();
  TextEditingController controllerLimit = TextEditingController();

  @override
  Widget build(BuildContext context) {

    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: SingleChildScrollView(
        child: Container(
          height: sizeHeight,
          width: sizeWidth,
          padding: EdgeInsets.all(30),
          child: Column(
            spacing: 20,
            children: [
              SizedBox(
                height: sizeHeight * 0.7,
                width: sizeWidth,
                child: Center(
                  child: GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 10,
                      childAspectRatio: 1.0,
                      mainAxisSpacing: 4.0,
                      crossAxisSpacing: 4.0,
                    ),
                    children: [
                      for(int i in _winnersSet())
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.deepPurple.shade900),
                          child: Center(child: Text("$i", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
                        ),
                    ],
                  ),
                )
              ),
              MaterialButton(
                onPressed: () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => WinnersPage(set: _winnersSet(),)), (Route<dynamic> route) => false),
                height: sizeHeight * 0.08,
                minWidth: sizeWidth * 0.5,
                color: Colors.blue.shade700,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30), side: BorderSide(width: 2, color: Colors.blue.shade300)),
                child: Text("Get Winner", style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ],
          )
        ),
      ),
    );
  }
}
