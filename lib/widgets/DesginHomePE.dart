import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ParentHomeDesginE extends StatelessWidget {
  const ParentHomeDesginE({
    Key key,
    @required this.text,
    @required this.icon,
    this.press,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: FlatButton(
        padding: EdgeInsets.all(30),
        shape: RoundedRectangleBorder(side: BorderSide(
            color: Colors.amberAccent,
            width: 2.5,
            style: BorderStyle.solid
        ), borderRadius: BorderRadius.circular(15)),
        color: Colors.white,
        onPressed: press,
        child: Center(
          child: Row(
            children: [
              Expanded(
                  child: Center(
                    child: Text(
                      text,textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.1,
                        color: Colors.lightBlue,

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
