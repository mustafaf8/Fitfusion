import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gym/common/color_extension.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_auth/firebase_auth.dart';

class PhotoProgressView extends StatefulWidget {
  const PhotoProgressView({super.key});

  @override
  State<PhotoProgressView> createState() => _PhotoProgressViewState();
}

class _PhotoProgressViewState extends State<PhotoProgressView> {
  List<Map<String, dynamic>> photoArr = [
    {"time": "2 June", "photo": <String>[]},
    {"time": "5 May", "photo": <String>[]}
  ];

  final ImagePicker _picker = ImagePicker();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _loadUserPhotos(); // Kullanıcının resimlerini yükle
  }

  // Kullanıcının resimlerini yükleyen fonksiyon
  Future<void> _loadUserPhotos() async {
    String? uid = await _getUID();
    if (uid != null) {
      for (int i = 0; i < photoArr.length; i++) {
        await _loadUserPhotosForDay(uid, i);
      }
    }
  }

  // Belirli bir güne ait kullanıcının resimlerini yükleyen fonksiyon
  Future<void> _loadUserPhotosForDay(String uid, int dayIndex) async {
    firebase_storage.Reference userFolderRef = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child('users')
        .child(uid)
        .child('resimler');

    // Kullanıcının resimlerini al
    ListResult result = await userFolderRef.listAll();
    // ignore: avoid_function_literals_in_foreach_calls
    result.items.forEach((firebase_storage.Reference ref) async {
      String downloadURL = await ref.getDownloadURL();
      setState(() {
        photoArr[dayIndex]["photo"].add(downloadURL);
      });
    });
  }

  Future<String?> _getUID() async {
    final User? user = _auth.currentUser;
    return user?.uid;
  }

  Future<void> _getImageFromCamera(int selectedDayIndex) async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      String? uid = await _getUID();
      if (uid != null) {
        await _uploadImageToFirebase(pickedFile.path,
            uid: uid, selectedDayIndex: selectedDayIndex);
      }
    }
  }

  Future<void> _uploadImageToFirebase(String filePath,
      {required String uid, required int selectedDayIndex}) async {
    try {
      File file = File(filePath);

      // Kullanıcının UID'si ile klasör oluştur
      firebase_storage.Reference userFolderRef = firebase_storage
          .FirebaseStorage.instance
          .ref()
          .child('users')
          .child(uid);

      // Eğer klasör yoksa oluştur
      if (!(await userFolderRef.listAll()).items.isNotEmpty) {
        await userFolderRef.putData(
            Uint8List(0)); // Klasör oluşturmak için boş bir dosya yükle
      }

      // Firebase Storage'a referans oluştur
      firebase_storage.Reference ref = userFolderRef
          .child('resimler')
          .child('${DateTime.now().millisecondsSinceEpoch}.png');

      // Dosyayı Firebase Storage'a yükle
      await ref.putFile(file);

      // Dosyanın URL'sini al
      String downloadURL = await ref.getDownloadURL();

      setState(() {
        photoArr[selectedDayIndex]["photo"].add(downloadURL);
      });
    } catch (e) {
      // ignore: avoid_print
      print("Hata: $e");
      // Hata durumunda kullanıcıya bilgi vermek için bir Toast veya AlertDialog gösterebilirsiniz.
    }
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.white,
        centerTitle: true,
        elevation: 0,
        leadingWidth: 0,
        leading: const SizedBox(),
        title: Text(
          "İlerleme",
          style: TextStyle(
            color: TColor.black,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Gallery",
                    style: TextStyle(
                      color: TColor.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: photoArr.length,
              itemBuilder: ((context, index) {
                var pObj = photoArr[index];
                var imaArr = pObj["photo"] as List<String>;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: media.width * 0.05),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.zero,
                        itemCount: imaArr.length,
                        itemBuilder: ((context, indexRow) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: 100,
                            decoration: BoxDecoration(
                              color: TColor.lightgray,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                imaArr[indexRow],
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                );
              }),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _getImageFromCamera(0); // Seçilen günün indeksini buraya geçin
        },
        backgroundColor: TColor.scondaryColor1,
        child: const Icon(Icons.photo_camera),
      ),
    );
  }
}
