import 'package:flutter/material.dart';
import 'package:quiz_app_v1/screens/my_table.dart';
import 'package:quiz_app_v1/services/auth.dart';
class Home extends StatelessWidget {
  AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.purple[400],
          title: Text('Start Quiz'),
          actions: [
            IconButton(
                onPressed: (){
                },
                icon: Icon(Icons.settings),
                ),
            IconButton(
                onPressed: ()async{
                  await _auth.signOut();
                },
                icon: Icon(Icons.exit_to_app),
                )
          ],
          bottom: TabBar(
            tabs: [
              Tab(
                text:'1st Year',
                icon: Icon(Icons.note),
              ),
              Tab(
                text: '2nd Year',
                icon: Icon(Icons.description),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Table(
                children: [
                  TableRow(
                      children: [
                        Subject(year:'1st year',name:'Subject 1',color: Colors.red,),
                        Subject(year:'1st year',name:'Subject 2',color: Colors.blue),
                      ]
                  ),
                  TableRow(
                      children: [
                        Subject(year:'1st year',name:'Subject 3',color: Colors.orange),
                        Subject(year:'1st year',name:'Subject 4',color: Colors.green),
                      ]
                  ),
                  TableRow(
                      children: [
                        Subject(year:'1st year',name:'Subject 5',color: Colors.yellow),
                        Subject(year:'1st year',name:'Subject 6',color: Colors.cyan),
                      ]
                  )
                ],
              )
            ),
    Center(
    child: Table(
    children: [
    TableRow(
    children: [
    Subject(year:'2nd year',name:'Subject 1',color: Colors.red,),
    Subject(year:'2nd year',name:'Subject 2',color: Colors.blue),
    ]
    ),
    TableRow(
    children: [
    Subject(year:'2nd year',name:'Subject 3',color: Colors.orange),
    Subject(year:'2nd year',name:'Subject 4',color: Colors.green),
    ]
    ),
    TableRow(
    children: [
    Subject(year:'2nd year',name:'Subject 5',color: Colors.yellow),
    Subject(year:'2nd year',name:'Subject 6',color: Colors.cyan),
    ]
    )
    ],
    )
    ),
          ],
        ),
      ),
    );
  }
}
