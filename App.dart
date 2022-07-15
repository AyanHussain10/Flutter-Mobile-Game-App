import 'package:flutter/material.dart';
import 'dart:math';
import 'package:game_rps/winner.dart';
class Home extends StatefulWidget {


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String op='rock1.png', op2='rock2.png', mike= 'assets/Polish_20211209_133512997.png', monster='assets/monster1.png', send='';//variable declaration
  int s1=0,s2=0, k=0;
  int col1=0, col2=0;
    T getRandomElement<T>(List<T> list){
    final random =new Random();
    var i=random.nextInt(list.length);
    return list[i];
  }

  void getRan() {
    var list=['rock1.png','paper1.png','scissor1.png'];
     setState(() {
     op=getRandomElement(list);
     whoWon();
    });
     }//getran

     void whoWon() {
       if ((op == 'rock1.png' && op2 == 'scissor2.png')
           || (op == 'scissor1.png' && op2 == 'paper2.png')
           || (op == 'paper1.png' && op2 == 'rock2.png')
          ) {
                setState(() {
                  s1 += 1;
                  col1=1;
                  col2=0;
                });
       }
       else if ((op2 == 'rock2.png' && op == 'scissor1.png')
           || (op2 == 'scissor2.png' && op == 'paper1.png')
           || ((op2 == 'paper2.png' && op == 'rock1.png'))) {
         setState(() {
           s2 += 1;
           col2=1;
           col1=0;
         });

       } //else if
       else if  ((op2 == 'rock2.png' && op == 'rock1.png')
           || (op2 == 'scissor2.png' && op == 'scissor1.png')
           || ((op2 == 'paper2.png' && op == 'paper1.png'))) {
         setState(() {
         col1=0; col2=0;
       });
       }//else if

       if(s1==5) {
         send=mike;

       }//if
       else if(s2==5){
         send=monster;
        }//if

     }//whowon

    @override
  Widget build(BuildContext context) {

      Color C1= (col1>col2)? Colors.green : Colors.red;
      Color C2= (col2>col1)? Colors.green : Colors.red;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.yellow[600],
              title: Text('Play!',
                  style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 2.0,
                  color:Colors.white,
                ),//textstyle
              ),
              centerTitle: true,
            ),//appBar
      backgroundColor: Colors.yellow[400],
      body: Container(
         child: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/$op'),
                radius: 40.0,
              ),//circleavatar
              SizedBox(width: 120.0,),//space
              CircleAvatar(
                backgroundImage: AssetImage('assets/$op2'),
                radius: 40.0,
              ),//circleavatar
        ],
              ),


          SizedBox(height: 2.0),//space
           Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
             Container(
              padding: const EdgeInsets.all(9),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: C1,
                ),
                child: Text('$s1',
                style: TextStyle(
                  fontSize: 25.0,
               ),),
          ),//container
                SizedBox(width: 150.0,),//space
                Container(
                  padding: const EdgeInsets.all(9),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: C2,
                  ),
                  child: Text('$s2',
                    style: TextStyle(
                      fontSize: 25.0,
                    ),),
                ),//container2
        ],//children
      ),//row
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
                  child: Container(
                    height: 200.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            mike),
                        fit: BoxFit.fill,
                      ),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                ),
                SizedBox(width: 50.0),//space
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
                  child: Container(
                    height: 200.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            monster),
                        fit: BoxFit.fill,
                      ),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                ),
                ],//children
          ),//row
          SizedBox(height: 4.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Mike',
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.5,
              color: Colors.grey[800]
            ),),//text

            SizedBox(width: 110),
            Text('You',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                    color: Colors.lightBlue[800]
                ),),

            ],//row
        ),//row
          SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RaisedButton(onPressed: () {
                  op2='rock2.png';
                  getRan();
                  if(s1==5||s2==5) {
                   Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=> Win(send: send)));
                     setState(() {
                      s1=0;s2=0;
                      col1=0;col2=0;
                    });}


                                 },
                  color: Colors.black54,
                     child: Text('Rock',
                         style: TextStyle(
                           fontSize: 30.0,
                           letterSpacing: 2.0,
                           color: Colors.white,
                           fontWeight: FontWeight.w500,
                          ),//textStyle
                     ),//text
                ),//raisedButton
                SizedBox(height: 10),
                RaisedButton(onPressed: () {
                  op2='paper2.png';
                  getRan();
                  if(s1==5||s2==5){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=> Win(send: send)));
                      setState(() {
                        s1=0;s2=0;
                        col1=0;col2=0;
                      });
                  }


                },
                  color: Colors.black54,
                  child: Text('Paper',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w500,
                    ),//textStyle
                  ),//text
                ),//raisedButton
                SizedBox(height: 10),
                RaisedButton(onPressed: () {
                  op2='scissor2.png';
                  getRan();
                  if(s1==5||s2==5){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=> Win(send: send)));
                    setState(() {
                      s1=0;s2=0;
                      col1=0;col2=0;
                    });}

                },
                  color: Colors.black54,
                  child: Text('Scissor',
                    style: TextStyle(
                      fontSize: 30.0,
                      letterSpacing: 2.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),//textStyle
                  ),//text
                ),//raisedButton
              ],//widget
          ),//column

      ],//row
          ),//row
          ],//widget
    ),//column
         ),//padding
          ),//container

    );//scaffold
  }
}