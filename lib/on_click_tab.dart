import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class OnClickTAB extends StatefulWidget {
  const OnClickTAB({Key? key}) : super(key: key);

  @override
  State<OnClickTAB> createState() => _OnClickTABState();
}

class _OnClickTABState extends State<OnClickTAB> {
  late File _image;

  @override
  void initState() {
    super.initState();
    _image = File(''); // Initialize with an empty File
  }

  Future getImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);

    setState(
      () {
        if (image != null) {
          _image = File(image.path);
        }
      },
    );
  }

  String title = "";
  String desc = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: const Color.fromARGB(255, 182, 4, 242),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Add Items',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 23,
              ),
            ),
          ],
        ),
      ),
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: 340,
          child: ListView(
            children: <Widget>[
              const SizedBox(
                height: 23,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 100,
                  width: 360,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 200, 200, 200),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: _image.existsSync()
                      ? Image.file(_image)
                      : Center(
                          child: RawMaterialButton(
                            fillColor: const Color.fromARGB(255, 182, 4, 242),
                            constraints: const BoxConstraints(
                              minWidth: 150,
                              minHeight: 40,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            onPressed: getImage,
                            child: const Text('Click to add picture'),
                          ),
                        ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                // maxLength: 40,
                onChanged: (text) {
                  title = text;
                },
                decoration: InputDecoration(
                  labelText: 'Select Category',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                // maxLines: 6,
                onChanged: (text) {
                  desc = text;
                },
                decoration: InputDecoration(
                  hintText: 'Brand',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: RawMaterialButton(
                  fillColor: const Color.fromARGB(255, 182, 4, 242),
                  constraints: const BoxConstraints(
                    minWidth: 100,
                    minHeight: 50,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  onPressed: () {
                    // Handle the button click event
                  },
                  child: const Text(
                    'Done',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
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
