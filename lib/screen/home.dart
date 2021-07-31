import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:todo_justdoit/screen/taches.dart';
import 'package:todo_justdoit/screen/widget.dart';

import '../base.dart';


class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  DatabaseHelper _dbHelper = DatabaseHelper();
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
                      child: FutureBuilder(
                        future: _dbHelper.getTasks(),
                        builder: (context,snapshot){
                          return ListView.builder(
                            itemCount:snapshot.data.length,
                            itemBuilder: (context,index){
                              return TaskCardWidget(
                                title: snapshot.data[index].title,
                              );

                          },);
                        },
                      ),
                    ),

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