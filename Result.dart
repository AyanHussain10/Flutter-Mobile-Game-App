import 'package:flutter/material.dart';

class Win extends StatefulWidget {
 String send;
 Win({required this.send});

  @override
  _WinState createState() => _WinState( send: send);
}

class _WinState extends State<Win> {
  String send;
  _WinState({required this.send});

   @override
  Widget build(BuildContext context) {
        return Scaffold(
        backgroundColor: Colors.blue[400],

          body: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Text('Game Over!',
                      style: TextStyle(
                        fontSize: 65.0,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 2.0,
                        color:Colors.white,
                      ),//textstyle
                    ),
                  ),
                ),

              Center(
              child:Container(
                height: 400.0,
                width: 200.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        send),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),//padding
              ),//center
                SizedBox(height: 20.0),//space
                Center(
                  child: Text(
                    'Won!',
                    style: TextStyle(
                      fontSize: 60.0,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 2.0,
                      color:Colors.white,
                    ),//textstyle
                  ),
                ),//center
           Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              IconButton(
                onPressed: () {
                  Navigator.pop( context,'/home');
                },
                icon: Icon( Icons.replay),
                color: Colors.white,
                iconSize: 30,
              ),//icon
            ],),//row

     ],//widget
            ),//column
          ),//container
              );//scaffold
  }
}
