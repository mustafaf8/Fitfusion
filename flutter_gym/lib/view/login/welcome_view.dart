import 'package:flutter/material.dart';
import 'package:flutter_gym/common/color_extension.dart';
import 'package:flutter_gym/common_widget/round_button.dart';
import 'package:flutter_gym/view/main_tab/main_tab_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WelcomView extends StatefulWidget {
  const WelcomView({super.key});

  @override
  State<WelcomView> createState() => _WelcomViewState();
}

class _WelcomViewState extends State<WelcomView> {
  late String name = ""; // Kullanıcı adını tutacak değişken

  @override
  void initState() {
    super.initState();
    getUserData(); // Kullanıcı adını almak için Firestore'a istek yap
  }

  // Kullanıcı adını Firestore'dan al
  void getUserData() async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection(
              'users') // Kullanıcı bilgilerinin saklandığı koleksiyon adı
          .doc(uid)
          .get();

      setState(() {
        name = userSnapshot['name']; // Firestore'dan kullanıcı adını al
      });
    } catch (e) {
      // ignore: avoid_print
      print("Hata: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: SafeArea(
        child: Container(
          width: media.width,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset(
                "lib/assets/img/welcome.png",
                height: media.width * 1.20,
                width: media.width * 0.75,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(
                // satır bosluk atma
                height: media.width * 0.01,
              ),
              Text(
                "Hoş Geldin $name", // Kullanıcı adını ekle
                style: TextStyle(
                    color: TColor.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "Herşey Tamam Harakete Geçmeye Hazırsın Artık",
                style: TextStyle(color: TColor.gray, fontSize: 14),
              ),
              SizedBox(
                height: media.width * 0.05,
              ),
              const Spacer(),
              RoundButton(
                title: "Ana Menü",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainTabView()));
                },
                elevation: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
