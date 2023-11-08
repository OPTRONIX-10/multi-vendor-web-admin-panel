import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:multi_vendor_app_admin_panel_web/views/screens/side_bar_screens/widgets/category_widget.dart';

class CategoriesScreen extends StatefulWidget {
  CategoriesScreen({super.key});
  static const routname = '/CategoriesScreen';

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  dynamic _image;
  String? _fileName;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  FirebaseStorage _storage = FirebaseStorage.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late String categoryName;
  _pickImage() async {
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

  _uploadCategoriesToTorage(dynamic image) async {
    Reference ref = _storage.ref().child('Category Images').child(_fileName!);

    UploadTask uploadTask = ref.putData(image);

    TaskSnapshot snapshot = await uploadTask;

    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  _uploadCategories() async {
    EasyLoading.show(
      status: 'Uploading...',
      maskType: EasyLoadingMaskType.black,
    );
    if (_formKey.currentState!.validate()) {
      if (_image != null) {
        String imageUrl = await _uploadCategoriesToTorage(_image);
        await _firestore.collection('Categories').doc(_fileName).set({
          'image': imageUrl,
          'name': categoryName,
        }).whenComplete(() => EasyLoading.dismiss());
      }
      setState(() {
        _image = null;
        _formKey.currentState!.reset();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10),
              child: Text(
                'Upload Categoiries',
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
                                  'Categories',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _pickImage();
                      },
                      child: Text(
                        'Upload Categories',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[900]),
                    )
                  ],
                ),
                SizedBox(
                  width: 300,
                  child: Expanded(
                    child: TextFormField(
                      onChanged: (value) => categoryName = value,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter categories name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(hintText: 'Categories Name'),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _uploadCategories();
                  },
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[900]),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(
                color: Colors.green[900],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Categories List',
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                  )),
            ),
            CategoryWidget()
          ],
        ),
      ),
    );
  }
}
