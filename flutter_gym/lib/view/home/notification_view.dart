import 'package:flutter/material.dart';
import 'package:flutter_gym/common/color_extension.dart';
import 'package:flutter_gym/common_widget/notification_row.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificatViewionState();
}

class _NotificatViewionState extends State<NotificationView> {
  List notificationArr = [
    {
      "image": "lib/assets/img/Ellipse (1).png",
      "title": "Kol Antrenmanı Zamanı",
      "time": "1 saat önce"
    },
    {
      "image": "lib/assets/img/Ellipse (2).png",
      "title": "Yemek Zamanı",
      "time": "2 saat önce"
    },
    {
      "image": "lib/assets/img/Ellipse (5).png",
      "title": "Karın Antrenmanı Zamanı",
      "time": "3saat önce"
    },
    {
      "image": "lib/assets/img/Ellipse (4).png",
      "title": "Antrenman Zamanını Kaçırma",
      "time": "4 saat önce"
    },
    {
      "image": "lib/assets/img/Ellipse (4).png",
      "title": "Omuz Antrenmanı Zamanı",
      "time": "5 saat önce"
    },
    {
      "image": "lib/assets/img/Ellipse (2).png",
      "title": "Yemek Zamanı",
      "time": "6 saat önce"
    },
    {
      "image": "lib/assets/img/Ellipse (5).png",
      "title": "Karın Antrenmanı Zamanı",
      "time": "8 saat önce"
    },
    {
      "image": "lib/assets/img/Ellipse (4).png",
      "title": "Antrenman Zamanını Kaçırma",
      "time": "10 saat önce"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.white,
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: TColor.lightgray,
                borderRadius: BorderRadius.circular(10)),
            child: Image.asset(
              "lib/assets/img/donusikonu.png",
              width: 15,
              height: 15,
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: Text(
          "Bildirimler",
          style: TextStyle(
              color: TColor.black, fontSize: 16, fontWeight: FontWeight.w700),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.all(8),
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: TColor.lightgray,
                  borderRadius: BorderRadius.circular(10)),
              child: Image.asset(
                "lib/assets/img/ikinokta.png",
                width: 12,
                height: 12,
                fit: BoxFit.contain,
              ),
            ),
          )
        ],
      ),
      backgroundColor: TColor.white,
      body: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          itemBuilder: ((context, index) {
            var nObj = notificationArr[index] as Map? ?? {};
            return NotificationRow(nObj: nObj);
          }),
          separatorBuilder: (context, index) {
            return Divider(
              color: TColor.gray.withOpacity(0.5),
              height: 1,
            );
          },
          itemCount: notificationArr.length),
    );
  }
}
