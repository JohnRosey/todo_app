import 'package:flutter/material.dart';
import 'package:todo_justdoit/screen/taches.dart';
import 'package:todo_justdoit/screen/widget.dart';


class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 32.0,
          ),
          color: Color(0xFFF6F6F6),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      bottom: 32.0,
                    ),
                    child: Image(
                      image: AssetImage(
                          'images/assets/Logo.jpeg'
                      ),
                      width: 60.0,
                      height: 60.0,
                    ),
                  ),
                  Expanded(
                    child: ScrollConfiguration(
                      behavior: NoGlowBehaviour(),
                      child: ListView(
                        children: [
                          TaskCardWidget(
                            title: "Get Started!",
                            desc: "Hello User!",
                          ),
                          TaskCardWidget(desc: 'Text', title: 'Text',),
                          TaskCardWidget(desc: 'Text', title: 'Text',),
                          TaskCardWidget(desc: 'Text', title: 'Text',),
                          TaskCardWidget(desc: 'Text', title: 'Text',),
                        ],
                      ),
                    ),
                  )
                ],
              ),

              Positioned(
                bottom: 0.0,
                right: 0.0,
                child: GestureDetector(
                  onTap:(){
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context)=>Taskpage()
                      ),
                  );
                },
                child: Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: new  BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.grey, Colors.black87],
                      begin: Alignment(0.0,-1.0),
                      end: Alignment(0.0,1.0)
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                  color: Colors.grey,
                    spreadRadius: 3,
                    blurRadius: 15,
                    offset: Offset(0,5)// Move to bottom 10 Vertically
                        ),
                    ],
                  ),
                  child: Image(
                    image: AssetImage(
                      "images/assets/add.jpeg",
                    ),
                  ),
                ),
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}