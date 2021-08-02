import 'package:flutter/cupertino.dart';

class Tache {
  final int id;
  final String title;
  final String description;
  Tache({ @required this.id,  this.title,  this.description});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }
}