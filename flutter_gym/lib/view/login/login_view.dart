import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gym/common/color_extension.dart';
import 'package:flutter_gym/common_widget/round_button.dart';
import 'package:flutter_gym/common_widget/round_textfield.dart';
import 'package:flutter_gym/view/login/complete_profile_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_gym/view/main_tab/main_tab_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: media.height,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Tekrar Hoş Geldin",
                  style: TextStyle(
                      color: TColor.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                SizedBox(
                  height: media.width * 0.03,
                ),
                RoundTextField(
                  controller: _emailController,
                  hitText: "Eposta Adresi",
                  icon: "lib/assets/img/essage.png",
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: media.width * 0.03,
                ),
                RoundTextField(
                  controller: _passwordController,
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
                          ))),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        "Şifremi Unuttum",
                        style: TextStyle(
                            color: TColor.gray,
                            fontSize: 10,
                            decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
                const Spacer(),
                RoundButton(
                  title: "Giriş Yap",
                  onPressed: () async {
                    try {
                      UserCredential userCredential = await FirebaseAuth
                          .instance
                          .signInWithEmailAndPassword(
                        email: _emailController.text.trim(),
                        password: _passwordController.text.trim(),
                      );

                      if (userCredential.user != null) {
                        bool profileCompleted =
                            await isProfileCompleted(userCredential.user!);

                        if (profileCompleted) {
                          Navigator.pushReplacement(
                            // ignore: use_build_context_synchronously
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MainTabView(),
                            ),
                          );
                        } else {
                          Navigator.pushReplacement(
                            // ignore: use_build_context_synchronously
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CompleteProfileView(),
                            ),
                          );
                        }
                      }
                    } catch (e) {
                      showDialog(
                        // ignore: use_build_context_synchronously
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Hata"),
                            content: const Text(
                                "Giriş yapılamadı. Lütfen bilgilerinizi kontrol edin."),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("Tamam"),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  elevation: 0,
                ),
                SizedBox(
                  height: media.width * 0.03,
                ),
                //7777777777777777777
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: TColor.gray,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "Coryp",
                        style: TextStyle(color: TColor.gray, fontSize: 10),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: TColor.gray,
                      ),
                    ),
                  ],
                ),
                //777777777777777777777
                SizedBox(
                  height: media.width * 0.03,
                ),

                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Hesabın Yok mu?",
                        style: TextStyle(
                          color: TColor.black,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        "Kayıt Ol",
                        style: TextStyle(
                            color: TColor.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: media.width * 0.8,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> isProfileCompleted(User user) async {
    try {
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (userSnapshot.exists) {
        return true;
      }
    } catch (e) {
      // ignore: avoid_print
      print("Hata: $e");
    }
    return false;
  }
}
