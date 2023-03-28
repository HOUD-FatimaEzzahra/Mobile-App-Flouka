import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';
import 'package:get/get.dart';

class SideMenuBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool userLoggedIn = true;
    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(50),
            color: darkBlueColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(height: 20),
                    Image.asset("images/logowhite.png"),
                    SizedBox(height: 80),
                    TextButton(
                        onPressed: () {
                          print(ModalRoute.of(context).settings.name);
                        },
                        child: Row(
                          children: [
                            Icon(Icons.home, color: Colors.white, size: 20),
                            SizedBox(width: 10),
                            Text('Accueil',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20))
                          ],
                        )),
                    SizedBox(height: 20),
                    TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(Icons.grid_view_rounded,
                              color: Colors.white, size: 20),
                          SizedBox(width: 10),
                          Text('Categories',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20))
                        ],
                      ),
                    ),
                    Visibility(
                      visible: userLoggedIn,
                      child: SizedBox(height: 20),
                    ),
                    Visibility(
                      visible: userLoggedIn,
                      child: TextButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(Icons.account_circle_rounded,
                                color: Colors.white, size: 20),
                            SizedBox(width: 10),
                            Text('Profile',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(Icons.info_rounded,
                              color: Colors.white, size: 20),
                          SizedBox(width: 10),
                          Text('About',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20))
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(Icons.contact_support,
                              color: Colors.white, size: 20),
                          SizedBox(width: 10),
                          Text('Contact',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20))
                        ],
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(userLoggedIn ? Icons.logout : Icons.login,
                            color: Colors.white, size: 20),
                        SizedBox(width: 10),
                        Text(userLoggedIn ? 'Se Deconnecter' : 'Se Connecter',
                            style: TextStyle(color: Colors.white, fontSize: 20))
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }
}
