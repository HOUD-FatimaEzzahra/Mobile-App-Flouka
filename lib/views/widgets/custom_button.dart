import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  Color filleColor;
  Color splashColor;
  String text;
  Function onClick;
  double radius;
  double heigth;
  IconData icon;
  CustomButton(
      {this.filleColor,
      this.heigth,
      this.splashColor,
      this.text,
      this.onClick,
      this.radius,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heigth,
      child: RawMaterialButton(
        fillColor: filleColor,
        splashColor: splashColor,
        child: Padding(
          padding: EdgeInsets.only(right: 10, left: 5),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                icon,
                color: Colors.white,
                size: 20,
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                text,
                maxLines: 1,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        onPressed: onClick,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
        ),
      ),
    );
  }
}
