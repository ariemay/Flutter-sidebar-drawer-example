import 'package:flutter/material.dart';
import './detailProfile.dart';

void main() {
  runApp(new MaterialApp(
    title: "Sidebar",
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String gambar1 =
      "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80";
  String gambar2 =
      "https://static1.squarespace.com/static/51b3dc8ee4b051b96ceb10de/t/5c1ea8b54fa51a050540ea19/1545513149132/johnny-depp-confirmed-not-to-return-as-jack-sparrow-in-disneys-pirates-of-the-caribbean-reboot-social.jpg?format=2500w";
  String backup;

  String nama1 = "Arie May Wibowo";
  String email1 = "ariemayw@gmail.com";
  String nama2 = "Jack Separo";
  String email2 = "jackseparoedan@gmail.com";
  String backupNama;
  String backupEmail;

  void gantiUser() {
    this.setState(() {
      backup = gambar1;
      backupNama = nama1;
      backupEmail = email1;
      gambar1 = gambar2;
      nama1 = nama2;
      email1 = email2;
      gambar2 = backup;
      nama2 = backupNama;
      email2 = backupEmail;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Sidebar Flutter DRAWER"),
          backgroundColor: Colors.red[700],
        ),
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountName: new Text(nama1),
                accountEmail: new Text(email1),
                currentAccountPicture: new GestureDetector(
                  // onTap: () =>
                  // Navigator.of(context).push(new MaterialPageRoute(
                  //   builder: (BuildContext context) => new DetailProfile(nama: nama1, gambar: gambar1)
                  // )),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) =>
                            new DetailProfile(nama: nama1, gambar: gambar1)));
                  },
                  child: new CircleAvatar(
                      backgroundImage: new NetworkImage(gambar1)),
                ),
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                        image: new NetworkImage(
                            "http://www.philly.com/resizer/vAsYqbiAetvzd_p9G1P-HQUiOMQ=/1400x932/smart/arc-anglerfish-arc2-prod-pmn.s3.amazonaws.com/public/BBVY6MUVL5A3HH3JRM3CXG5SKM.jpg"),
                        fit: BoxFit.cover)),
                otherAccountsPictures: <Widget>[
                  new GestureDetector(
                    onTap: () => gantiUser(),
                    child: new CircleAvatar(
                      backgroundImage: NetworkImage(gambar2),
                    ),
                  )
                ],
              ),
              new ListTile(
                title: new Text("Setting"),
                trailing: new Icon(Icons.settings),
              ),
              new ListTile(
                title: new Text("Close"),
                trailing: new Icon(Icons.close),
              )
            ],
          ),
        ),
        body: new Container());
  }
}
