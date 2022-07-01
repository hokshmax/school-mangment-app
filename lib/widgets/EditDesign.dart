import 'package:flutter/material.dart';

class EditDesign extends StatelessWidget {


  const EditDesign({
    Key key,
    @required this.icon,
    @required this.text,
    this.press,
  }) : super(key: key);
  final IconData icon;
  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: FlatButton(
        padding:EdgeInsets.all(30),
        //EdgeInsets.only(right: 20,left: 20,top: 30,bottom: 30),
        shape: RoundedRectangleBorder(side: BorderSide(
            color: Colors.amberAccent,
            width: 2.5,
            style: BorderStyle.solid
        ), borderRadius: BorderRadius.circular(15)),
        color: Colors.white,
        onPressed: press,
        child: Center(
          child: Row(
            children:<Widget> [
              Icon(icon,color: Colors.black,),
              Expanded(
                  child: Center(

                    child: Text(
                      text,textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.1,
                        color: Colors.lightBlue[600],

                      ),
                    ),
                  )),

              // Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }
}
