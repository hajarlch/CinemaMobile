
import 'package:exammobile/pages/signin.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(

            decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('images/cinema.jpg'))),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Welcome'),
            onTap: () => {
            Navigator.pushReplacementNamed(context, "/Home")
            },
          ),
          ListTile(
            leading: Icon(Icons.home_work_outlined),
            title: Text('Cinemas'),
            onTap: () => {

              Navigator.pushReplacementNamed(context, "/VillePage")
            },
          ),
          ListTile(
            leading: Icon(Icons.camera_alt),
            title: Text('Camera'),
            onTap: () => {
              Navigator.pushReplacementNamed(context, "/Camera")
            },
          ),
          ListTile(
            leading: Icon(Icons.qr_code),
            title: Text('Scanner'),
            onTap: () => {
              Navigator.pushReplacementNamed(context, "/Camera")
            },
          ),
          ListTile(
            leading: Icon(Icons.map),
            title: Text('Map'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {
    Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => SignIn()),
    )
            },
          ),
        ],
      ),
    );
  }
}