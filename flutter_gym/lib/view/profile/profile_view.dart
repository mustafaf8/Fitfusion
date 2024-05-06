import 'package:flutter/material.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter_gym/common/color_extension.dart';
import 'package:flutter_gym/common_widget/round_button.dart';
import 'package:flutter_gym/common_widget/setting_row.dart';
import 'package:flutter_gym/common_widget/title_subtitle_cell.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late String _userName = ""; // Kullanıcının adını tutacak değişken
  late String _userWeight = ""; // Kullanıcının kilosunu tutacak değişken
  late String _userHeight = ""; // Kullanıcının boyunu tutacak değişken
  late String _userAge = ""; // Kullanıcının yaşını tutacak değişken
  bool positive = false;

  List accountArr = [
    {
      "image": "lib/assets/img/Profile_2.png",
      "name": "Kişisel Bilgiler",
      "tag": "1"
    },
    {"image": "lib/assets/img/Document.png", "name": "Başarılar", "tag": "2"},
    {
      "image": "lib/assets/img/Graph.png",
      "name": "Yapılan Aktiviteler",
      "tag": "3"
    },
    {
      "image": "lib/assets/img/Icon-Workout.png",
      "name": "Antremanlar",
      "tag": "4"
    },
  ];
  List othertArr = [
    {
      "image": "lib/assets/img/Icon-Message.png",
      "name": "İletişime Geç",
      "tag": "5"
    },
    {
      "image": "lib/assets/img/Icon-Privacy.png",
      "name": "Gizlilik",
      "tag": "6"
    },
    {"image": "lib/assets/img/Icon-Setting.png", "name": "Ayarlar", "tag": "7"},
  ];

  @override
  void initState() {
    super.initState();
    // Kullanıcı verilerini al
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.white,
        centerTitle: true,
        elevation: 0,
        leadingWidth: 0,
        title: Text(
          "Profil",
          style: TextStyle(
              color: TColor.black, fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      "lib/assets/img/profilepic4x.png",
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _userName,
                          style: TextStyle(
                            color: TColor.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 80,
                    height: 30,
                    child: RoundButton(
                      title: "Düzenle",
                      type: RoundButtonType.bgGradient,
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const ActivityTrackerView(),
                        //   ),
                        // );
                      },
                      elevation: 0,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: TitleSubtitleCell(
                      title: "$_userHeight cm",
                      subtitle: "Boy",
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TitleSubtitleCell(
                      title: "$_userWeight kg",
                      subtitle: "Kilo",
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TitleSubtitleCell(
                      title: _userAge,
                      subtitle: "Yaş",
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              //account kısmı
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                    color: TColor.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 2)
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hesap",
                      style: TextStyle(
                        color: TColor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: accountArr.length,
                      itemBuilder: (context, index) {
                        var i0bj = accountArr[index] as Map? ?? {};
                        return SettingRow(
                          icon: i0bj["image"].toString(),
                          title: i0bj["name"].toString(),
                          onPressed: () {},
                        );
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              //account kısmı
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                    color: TColor.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 2)
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bildirimler",
                      style: TextStyle(
                        color: TColor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 40,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("lib/assets/img/notification_icon.png",
                              height: 19, width: 19, fit: BoxFit.contain),
                          const SizedBox(
                            height: 25,
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              "Bildirimleri Aç/Kapa",
                              style: TextStyle(
                                color: TColor.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          //bildirim switch
                          AnimatedToggleSwitch<bool>.dual(
                            current: positive,
                            first: false,
                            second: true,
                            spacing: 0.1,
                            style: const ToggleStyle(
                              borderColor: Colors.transparent,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 3,
                                  offset: Offset(2, 4),
                                ),
                              ],
                            ),
                            borderWidth: 2,
                            height: 25,
                            onChanged: (b) => setState(() => positive = b),
                            styleBuilder: (b) => ToggleStyle(
                                indicatorColor:
                                    b ? TColor.scondaryColor2 : TColor.gray),
                            textBuilder: (value) => value
                                ? const Center(
                                    child: Text(
                                    'Kapa',
                                    style: TextStyle(fontSize: 10),
                                  ))
                                : const Center(
                                    child: Text(
                                    'Aç',
                                    style: TextStyle(fontSize: 10),
                                  )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),

              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                    color: TColor.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 2)
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Diğer",
                      style: TextStyle(
                        color: TColor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: othertArr.length,
                      itemBuilder: (context, index) {
                        var i0bj = othertArr[index] as Map? ?? {};
                        return SettingRow(
                          icon: i0bj["image"].toString(),
                          title: i0bj["name"].toString(),
                          onPressed: () {},
                        );
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Kullanıcının verilerini Firestore'dan al
  // Kullanıcının verilerini Firestore'dan al
  Future<void> getUserData() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentSnapshot userDataSnapshot = await FirebaseFirestore.instance
            .collection('usersData')
            .doc(user.uid)
            .get();

        // Kullanıcının verilerini değişkenlere aktar
        if (userDataSnapshot.exists) {
          Map<String, dynamic>? usersData =
              userDataSnapshot.data() as Map<String, dynamic>?;

          if (usersData != null) {
            setState(() {
              _userName = usersData['name'] ?? "";
              _userWeight = usersData['weight'] ?? "";
              _userHeight = usersData['height'] ?? "";
              _userAge = usersData['dateOfBirth'] ?? "";
            });
          } else {
            // ignore: avoid_print
            print("userData bir Map değil");
            // Gerekirse, hata durumuna göre uygun bir işlem yapabilirsiniz.
          }
        }
      }
    } catch (e) {
      // ignore: avoid_print
      print("Hata: $e");
    }
  }
}
