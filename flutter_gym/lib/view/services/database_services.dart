import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UsersData {
  final userCollection = FirebaseFirestore.instance.collection("usersData");

  Future<void> dataUser({
    required String dateOfBirth,
    required String height,
    required String weight,
  }) async {
    try {
      // Kullanıcının UID'sini al
      String uid = FirebaseAuth.instance.currentUser!.uid;

      // Firestore kullanıcı verilerini kaydet
      await userCollection.doc(uid).set({
        "dateOfBirth": dateOfBirth,
        "height": height,
        "weight": weight,
      });
    } catch (e) {
      // ignore: avoid_print
      print("Hata oluştu: $e");
      // Hata durumunda gerekli işlemleri yapabilirsiniz
    }
  }
}
