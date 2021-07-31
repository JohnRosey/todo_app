import 'package:flutter/material.dart';
import 'package:todo_justdoit/widgets.dart';


class Taskpage extends StatefulWidget {

  @override
  _TaskpageState createState() => _TaskpageState();

}
class _TaskpageState extends State<Taskpage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 24.0,
                      bottom: 6.0,
                    ),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Padding(padding: const EdgeInsets.all(24.0),
                            child: Image(
                              image: AssetImage('images/assets/back.jpeg'),
                            ),
                          ),
                        ),
                        Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Entrez votre texte",
                                border: InputBorder.none,
                              ),
                              style: TextStyle(
                                fontSize: 26.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.lightBlue,
                              ),
                            ))
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(
                    bottom: 12.0,
                  ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 12.0,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Ecrit ici!",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 24.0,
                        )
                      ),
                    ),
                  ),
                  TodoWidget(estFait: false, text: 'sssss',),
                  TodoWidget(estFait: false, text: 'sssssss',),
                  TodoWidget(text: 'ssss', estFait: true,),
                  TodoWidget(text: 'ddddd', estFait: true,),
                ],
              ),
              Positioned(
                bottom: 24.0,
                right: 24.0,
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
                      color: Colors.redAccent,
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
                        "images/assets/delete.jpeg",
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

