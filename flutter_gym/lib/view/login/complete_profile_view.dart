import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gym/common/color_extension.dart';
import 'package:flutter_gym/common_widget/round_button.dart';
import 'package:flutter_gym/common_widget/round_textfield.dart';
import 'package:flutter_gym/view/login/what_your_goal_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CompleteProfileView extends StatefulWidget {
  const CompleteProfileView({super.key});

  @override
  State<CompleteProfileView> createState() => _CompleteProfileViewState();
}

class _CompleteProfileViewState extends State<CompleteProfileView> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  void _usersData() async {
    try {
      // Kullanıcının UID'sini al
      String uid = FirebaseAuth.instance.currentUser!.uid;

      // Firestore kullanıcı verilerini kaydet
      await FirebaseFirestore.instance.collection('usersData').doc(uid).set({
        'dateOfBirth': _dateController.text.trim(),
        'weight': _weightController.text.trim(),
        'height': _heightController.text.trim(),
        // Diğer kullanıcı bilgilerini buraya ekleyebilirsiniz
      });

      // Başarılı kayıt bildirimi göster
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Profil bilgileriniz başarıyla kaydedildi!'),
          duration: Duration(seconds: 2),
        ),
      );
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      // Kayıt işlemi başarısız oldu, hata gösterilebilir
    }
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Image.asset(
                  "lib/assets/img/profil_tamamla.png",
                  width: media.width,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(height: media.width * 0.05),
                Text(
                  "Profilini Tamamla",
                  style: TextStyle(
                    color: TColor.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: media.width * 0.05),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      // Cinsiyet seçimi
                      Container(
                        decoration: BoxDecoration(
                          color: TColor.lightgray,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 50,
                              height: 50,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Image.asset(
                                "lib/assets/img/gender.png",
                                width: 15,
                                height: 15,
                                fit: BoxFit.contain,
                                color: TColor.gray,
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  items: ["Kadın", "Erkek"]
                                      .map((name) => DropdownMenuItem(
                                            value: name,
                                            child: Text(
                                              name,
                                              style: TextStyle(
                                                color: TColor.gray,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    // Seçilen değeri alabilirsiniz
                                  },
                                  isExpanded: true,
                                  hint: Text(
                                    "Cinsiyet",
                                    style: TextStyle(
                                      color: TColor.gray,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ),
                      SizedBox(height: media.width * 0.03),
                      // Doğum tarihi
                      RoundTextField(
                        controller: _dateController,
                        hitText: "Doğum Tarihi",
                        icon: "lib/assets/img/date.png",
                      ),
                      SizedBox(height: media.width * 0.03),
                      // Kilo
                      Row(
                        children: [
                          Expanded(
                            child: RoundTextField(
                              controller: _weightController,
                              hitText: "Ağırlık",
                              icon: "lib/assets/img/weight.png",
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            width: 50,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: TColor.scondaryG,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              "KG",
                              style: TextStyle(
                                color: TColor.white,
                                fontSize: 12,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: media.width * 0.03),
                      // Boy
                      Row(
                        children: [
                          Expanded(
                            child: RoundTextField(
                              controller: _heightController,
                              hitText: "Boy",
                              icon: "lib/assets/img/hight.png",
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            width: 50,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: TColor.scondaryG,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              "CM",
                              style: TextStyle(
                                color: TColor.white,
                                fontSize: 12,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: media.width * 0.070),
                      // Sonraki sayfa butonu
                      RoundButton(
                        title: "Sonraki Sayfa",
                        onPressed: () {
                          // Kullanıcının bilgilerini Firestore'a kaydedin
                          _usersData();
                          // Bir sonraki sayfaya geçin
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const WhatYourGoalView(),
                            ),
                          );
                        },
                        elevation: 0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
