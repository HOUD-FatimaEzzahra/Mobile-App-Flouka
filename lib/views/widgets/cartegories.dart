import 'package:flutter/material.dart';
import 'package:flutter_auth/views/widgets/categorie_card.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Text(
        //         "Categories",
        //         style: TextStyle(
        //           color: darkGray,
        //           fontWeight: FontWeight.bold,
        //           fontSize: 25,
        //         ),
        //       ),
        //       // TextButton(onPressed: () {}, child: Text("View all"))
        //     ],
        //   ),
        // ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CategoryCard(
                  image: Image.asset(
                    "images/cat1.jpg",
                    fit: BoxFit.cover,
                  ),
                  name: "Frais",
                  svg: "icons/fish.svg",
                  cat: 2),
              SizedBox(
                width: 40,
              ),
              CategoryCard(
                  image: Image.asset(
                    "images/cat2.jpg",
                    fit: BoxFit.cover,
                  ),
                  name: "Congelés",
                  svg: "icons/freezing.svg",
                  cat: 1),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 30,
              ),
              CategoryCard(
                  image: Image.asset(
                    "images/cat3.jpg",
                    fit: BoxFit.cover,
                  ),
                  svg: "icons/chili.svg",
                  name: "Épicerie",
                  cat: 3),
              SizedBox(
                width: 30,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
