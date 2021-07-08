import 'package:barcode_scan/barcode_scan.dart';
import 'package:exammobile/widgets/nav-drawer.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:date_format/date_format.dart';
import 'dart:io';

File image;

class Camera extends StatefulWidget {
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  TextEditingController _codebarController;
  pickerCam() async {
    final picker = ImagePicker();
    final img = await picker.getImage(source: ImageSource.camera);
    // File img = await ImagePicker.pickImage(source: ImageSource.camera);
    if (img != null) {
      image = File(img.path);
      setState(() {});
    }
  }

  pickerGallery() async {
    final picker = ImagePicker();
    final img = await picker.getImage(source: ImageSource.gallery);
    // File img = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      image = File(img.path);
      setState(() {});
    }
  }

  String barcode = " ";
  Future scanCode() async {
    try {
      String barcode = await BarcodeScanner.scan();

      setState(() => this.barcode = barcode);
      _codebarController.text = barcode;
    } catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => this.barcode = 'Unknown error: $e');
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _codebarController =
        new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: NavDrawer(),
      appBar: AppBar(

        title: Text('Camera'),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(

          //height: 570.0,
          padding: const EdgeInsets.all(20.0),
          child: Card(
              child: Center(
                  child: Column(children: <Widget>[
            Row(
              children: <Widget>[
                new Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: new BoxDecoration(
                      border: new Border.all(color: Colors.blueAccent)),
                  padding: new EdgeInsets.all(5.0),
                  child: image == null ? Text('Add') : Image.file(image),
                ),

                Divider(),
                new IconButton(
                    icon: new Icon(Icons.camera_alt), onPressed: pickerCam),
                Divider(),
                new IconButton(
                    icon: new Icon(Icons.image), onPressed: pickerGallery),
              ],
            ),
            TextField(
              controller: _codebarController,
              style: TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
              decoration: InputDecoration(
                  icon: Icon(Icons.person), labelText: 'CodeBar'),
            ),
            new FloatingActionButton(
              onPressed: scanCode,
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
            ),
            Divider(),
    FlatButton(
    onPressed: () {})
          ])))),
    );
  }
}
