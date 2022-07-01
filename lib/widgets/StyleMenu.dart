

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget{
  IconData icon;
  String text;
  Function onTap;

  CustomListTile(this.icon,this.text,this.onTap);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: InkWell(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget> [
              Row(
                children: <Widget>[
                  Icon(icon),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(text, style: TextStyle(
                      fontSize: 20,
                      // fontWeight: FontWeight.w100

                    ),),
                  ),
                ],
              ),
              Icon(Icons.arrow_right)
            ],

          ),
        ),
      ),
    );
  }}
class ProfileDesign extends StatelessWidget {
  IconData icon;
  String text;
  ProfileDesign(this.icon,this.text);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: InkWell(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget> [
            Row(
              children: <Widget>[
                Icon(icon),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(text, style: TextStyle(
                      fontSize: 20,
                      color: Colors.lightBlue[600],
                      fontWeight: FontWeight.bold

                  ),),
                ),
              ],
            ),
          ],

        ),
      ),
    );
  }
}