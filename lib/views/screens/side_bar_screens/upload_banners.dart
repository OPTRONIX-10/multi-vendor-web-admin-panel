import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:multi_vendor_app_admin_panel_web/views/screens/side_bar_screens/widgets/bannerWidget.dart';

class UploadBannersScreen extends StatefulWidget {
  const UploadBannersScreen({super.key});
  static const routname = '/UploadBannersScreen';

  @override
  State<UploadBannersScreen> createState() => _UploadBannersScreenState();
}

class _UploadBannersScreenState extends State<UploadBannersScreen> {
  FirebaseStorage storage = FirebaseStorage.instance;
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  dynamic _image;
  String? _fileName;
  pickImage() async {
    try {
      FilePickerResult? result = await FilePicker.platform
          .pickFiles(allowMultiple: false, type: FileType.image);

      if (result != null) {
        setState(() {
          _image = result.files.first.bytes;
          _fileName = result.files.first.name;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  _uploadImageToStorage(dynamic image) async {
    Reference ref = storage.ref().child('Banner').child(_fileName!);

    UploadTask uploadTask = ref.putData(image);

    TaskSnapshot snapshot = await uploadTask;

    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  _uploadToFireStore() async {
    EasyLoading.show(
      status: 'Uploading...',
      maskType: EasyLoadingMaskType.black,
    );
    if (_image != null) {
      String imageUrl = await _uploadImageToStorage(_image);
      await fireStore.collection('Banner').doc(_fileName).set({
        'image': imageUrl,
      }).whenComplete(() => EasyLoading.dismiss());
    }
    setState(() {
      _image = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(10),
            child: Text(
              'Upload Banner',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 36),
            ),
          ),
          Divider(
            color: Colors.green[900],
          ),
          Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Container(
                      height: 140,
                      width: 140,
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: _image != null
                          ? Image.memory(
                              _image,
                              fit: BoxFit.cover,
                            )
                          : Center(
                              child: Text(
                                'Banner',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      pickImage();
                    },
                    child: Text(
                      'Upload Banner',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[900]),
                  )
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  _uploadToFireStore();
                },
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.blue[900]),
              )
            ],
          ),
          Divider(
            color: Colors.green[900],
          ),
          Text(
            'Banners',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          BannerWidget()
        ],
      ),
    );
  }
}
