import 'package:flutter/material.dart';

class Subject extends StatelessWidget {
  final String year;
  final String name;
  final Color color;
  Subject({this.year, this.name, this.color});
  @override
  Widget build(BuildContext context) {
      return Card(
        color: color,
                elevation: 0.2,
                margin: EdgeInsets.all(16.0),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(year),
                      SizedBox(height: 20,),
                      Text(name),
                    ],
                  ),
                ),
    );
  }
}


