import 'package:flutter/material.dart';
import 'package:lotoreya/screens/get_winner_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Lottelore",
                style: TextStyle(
                  color: Colors.deepPurple.shade900,
                  fontSize: 40,
                ),
              ),
              TextField(
                controller: controllerStart,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  focusColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  hintText: 'Start',
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
              ),
              TextField(
                controller: controllerEnd,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  focusColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  hintText: 'End',
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
              ),
              TextField(
                controller: controllerLimit,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  focusColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  hintText: 'Limit',
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  if (controllerStart.text.isNotEmpty &&
                      controllerEnd.text.isNotEmpty &&
                      controllerLimit.text.isNotEmpty) {
                    if (int.tryParse(controllerStart.text) != null &&
                        int.tryParse(controllerEnd.text) != null &&
                        int.tryParse(controllerLimit.text) != null) {
                      if ((int.parse(controllerEnd.text) -
                              int.parse(controllerStart.text)) >=
                          int.parse(controllerLimit.text)) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => GetWinnerPage(
                                  start: int.parse(controllerStart.text),
                                  end: int.parse(controllerEnd.text),
                                  limit: int.parse(controllerLimit.text),
                                ),
                          ),
                        );
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Siz kiritgan limit start va end oralig'idan katta ! limitni kamaytiring"),
                            duration: Duration(seconds: 2),
                            backgroundColor: Colors.blue.shade700,
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Kiritishda xatolik ! (son kiriting)'),
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.blue.shade700,
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("To'liq kiriting !"),
                        duration: Duration(seconds: 2),
                        backgroundColor: Colors.blue.shade700,
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    );
                  }
                },
                height: sizeHeight * 0.08,
                minWidth: sizeWidth * 0.5,
                color: Colors.blue.shade700,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(width: 2, color: Colors.blue.shade300),
                ),
                child: Text(
                  "Generator",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
