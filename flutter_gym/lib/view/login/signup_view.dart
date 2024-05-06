import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gym/common/color_extension.dart';
import 'package:flutter_gym/common_widget/round_button.dart';
import 'package:flutter_gym/common_widget/round_textfield.dart';
import 'package:flutter_gym/view/login/complete_profile_view.dart';
import 'package:flutter_gym/view/login/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Firebase Authentication eklemeyi unutmayın

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _auth =
      FirebaseAuth.instance; // Firebase Authentication nesnesini oluşturun

  final _tName = TextEditingController();
  final _tSurname = TextEditingController();
  final _tEmail = TextEditingController();
  final _tPassword = TextEditingController();

  bool isCheck = false;

  Future<void> registerUser() async {
    try {
      final newUser = await _auth.createUserWithEmailAndPassword(
        email: _tEmail.text.trim(),
        password: _tPassword.text.trim(),
      );
      // Firestore kullanarak kullanıcıyı kaydet
      await FirebaseFirestore.instance
          .collection('users')
          .doc(newUser.user!.uid)
          .set({
        'name': _tName.text.trim(),
        'surname': _tSurname.text.trim(),
        'email': _tEmail.text.trim(),
        'password': _tPassword.text.trim(),
        // Buraya kullanıcının diğer bilgilerini de ekleyebilirsiniz
      });

      Navigator.push(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
          builder: (context) => const CompleteProfileView(),
        ),
      );
      // Başarılı kayıt bildirimi göster
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Kayıt işlemi başarıyla tamamlandı!'),
          duration: Duration(seconds: 2), // Bildirimin görüntüleneceği süre
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
        reverse: true,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Hesap Oluşturun",
                  style: TextStyle(
                    color: TColor.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                RoundTextField(
                  controller: _tName,
                  hitText: "Adınız",
                  icon: "lib/assets/img/Profile.png",
                ),
                SizedBox(
                  height: media.width * 0.03,
                ),
                RoundTextField(
                  controller: _tSurname,
                  hitText: "Soy Adınız",
                  icon: "lib/assets/img/Profile.png",
                ),
                SizedBox(
                  height: media.width * 0.03,
                ),
                RoundTextField(
                  controller: _tEmail,
                  hitText: "Eposta Adresi",
                  icon: "lib/assets/img/essage.png",
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: media.width * 0.03,
                ),
                RoundTextField(
                  controller: _tPassword,
                  hitText: "Şifre",
                  icon: "lib/assets/img/ock.png",
                  obscureText: true,
                  rightIcon: TextButton(
                    onPressed: () {},
                    child: Container(
                      alignment: Alignment.center,
                      width: 20,
                      height: 20,
                      child: Image.asset(
                        "lib/assets/img/ide-Password.png",
                        width: 23,
                        height: 23,
                        fit: BoxFit.contain,
                        color: TColor.gray,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isCheck = !isCheck;
                        });
                      },
                      icon: Icon(
                        isCheck
                            ? Icons.check_box_outlined
                            : Icons.check_box_outline_blank_outlined,
                        color: TColor.gray,
                        size: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        "Kullanım şartları ve gizlilik hakları aydınlatma metni",
                        style: TextStyle(color: TColor.gray, fontSize: 10),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: media.width * 0.20,
                ),
                RoundButton(
                  title: "Kayıt Ol",
                  onPressed: () {
                    registerUser(); // Kayıt işlemi için fonksiyonu çağırın
                  },
                  elevation: 0,
                ),
                SizedBox(
                  height: media.width * 0.03,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: TColor.gray,
                      ),
                    ),
                    Text(
                      "Veya",
                      style: TextStyle(color: TColor.gray, fontSize: 10),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: TColor.gray,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: media.width * 0.03,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          color: TColor.white,
                          border: Border.all(
                            width: 1,
                            color: TColor.gray.withOpacity(0.5),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: media.width * 0.03,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginView()),
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Hesabınız Var Mı? ",
                        style: TextStyle(
                          color: TColor.black,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        "Giriş",
                        style: TextStyle(
                          color: TColor.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: media.width * 0.03,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
