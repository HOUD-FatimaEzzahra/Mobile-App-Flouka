import 'package:flutter/material.dart';

class CustomHero extends StatelessWidget {
  String image, text, desc;
  CustomHero({this.image, this.text, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * .35,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  image,
                ),
                fit: BoxFit.cover)),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
            Colors.black.withOpacity(.5),
            Colors.black.withOpacity(.3),
          ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                text,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 100,
                margin: EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.transparent),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(0),
                    child: Text(
                      desc,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
