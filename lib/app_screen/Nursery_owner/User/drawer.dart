import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Drawer(
          child: Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Column(children: <Widget>[
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.orange,
                        image: DecorationImage(
                          image: AssetImage('assets/images/Sanket.jpeg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10, bottom: 10)),
                    Title(
                      color: Colors.blue,
                      child: Text(
                        "Username : Sanket",
                        style: TextStyle(),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10, bottom: 10)),
                    Title(
                      color: Colors.blue,
                      child: Text(
                        "Email : sankethake4847@gamil.com",
                        style: TextStyle(),
                      ),
                    )
                  ]),
                )),
            Divider(
              color: Colors.black,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/addproduct");
              },
              child: ListTile(
                leading: Icon(Icons.account_box_rounded),
                tileColor: Colors.blue[200],
                title: Text(
                  "My Account",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/Cart");
              },
              child: ListTile(
                leading: Icon(Icons.add_shopping_cart),
                tileColor: Colors.blue[200],
                title: Text(
                  "My Cart",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            Container(
              child: ListTile(
                leading: Icon(Icons.circle_notifications_sharp),
                tileColor: Colors.blue[200],
                title: Text(
                  " Notifications",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.popAndPushNamed(context, "/ContactUs");
              },
              child: ListTile(
                leading: Icon(Icons.call),
                tileColor: Colors.blue[200],
                title: Text(
                  "Contact Us",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.new_releases_rounded),
              tileColor: Colors.blue[200],
              title: Text(
                "About Agventure",
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/Login_page_User");
              },
              child: ListTile(
                leading: Icon(
                  Icons.login,
                ),
                tileColor: Colors.blue[200],
                title: Text(
                  "Log In",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushNamed(context, "/");
              },
              child: ListTile(
                leading: Icon(Icons.logout),
                tileColor: Colors.blue[200],
                title: Text(
                  "Log Out",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  void setState(Future<Null> Function() param0, void param1) {}
}

void signout(BuildContext, Context) {
  var alertDialog = Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      child: AlertDialog(
          title: Text(
        'Sign Out Completed',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      )));

  showDialog(
      context: Context,
      builder: (context) {
        return alertDialog;
      });
}
