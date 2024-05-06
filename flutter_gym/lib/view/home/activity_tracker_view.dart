import 'package:flutter/material.dart';
import 'package:flutter_gym/common/color_extension.dart';
import 'package:flutter_gym/common_widget/latest_activity_row.dart';
import 'package:flutter_gym/common_widget/today_target_cell.dart';

class ActivityTrackerView extends StatefulWidget {
  const ActivityTrackerView({super.key});

  @override
  State<ActivityTrackerView> createState() => _ActivityTrackerView();
}

class _ActivityTrackerView extends State<ActivityTrackerView> {
  List latestArr = [
    {
      "image": "lib/assets/img/Latest_Pic (1).png",
      "title": "Su Alımı Zamanı 300ml",
      "time": "1 saat önce"
    },
    {
      "image": "lib/assets/img/Latest_Pic.png",
      "title": "Yemek Zamanı",
      "time": "3 saat önce"
    },
  ];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
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
                color: TColor.white, borderRadius: BorderRadius.circular(10)),
            child: Image.asset(
              "lib/assets/img/donusikonu.png",
              width: 20,
              height: 20,
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: Text(
          "Yapılacaklar",
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
              // alignment: Alignment.center,
              // decoration: BoxDecoration(
              //   color: TColor.lightgray,
              //  borderRadius: BorderRadius.circular(10)),
              // child: Image.asset(
              //   "lib/assets/img/ikinokta.png",
              //   width: 12,
              //   height: 12,
              //   fit: BoxFit.contain,
              // ),
            ),
          )
        ],
      ),
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      TColor.primryColor2.withOpacity(0.3),
                      TColor.primryColor1.withOpacity(0.3)
                    ]),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Bugünkü Hedef",
                          style: TextStyle(
                              color: TColor.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: 30,
                          height: 30,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: TColor.primryG,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: MaterialButton(
                                onPressed: () {},
                                padding: EdgeInsets.zero,
                                height: 30,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                textColor: TColor.primryColor1,
                                minWidth: double.maxFinite,
                                elevation: 0,
                                color: Colors.transparent,
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 12,
                                )),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Row(
                      children: [
                        Expanded(
                          child: TodayTargetCell(
                              icon: "lib/assets/img/glass 1.png",
                              value: "8L",
                              title: "Su Alımı"),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: TodayTargetCell(
                              icon: "lib/assets/img/boots 1.png",
                              value: "2400",
                              title: "Adım Sayısı"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: media.width * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "İhtiyaç",
                    style: TextStyle(
                        color: TColor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: media.width * 0.1,
                  ),
                  // TextButton(
                  //     onPressed: () {},
                  //     child: Text(
                  //       "Daha Fazla",
                  //       style: TextStyle(
                  //         color: TColor.gray,
                  //         fontSize: 14,
                  //       ),
                  //     ))
                ],
              ),
              ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: latestArr.length,
                  itemBuilder: (context, index) {
                    var w0bj = latestArr[index] as Map? ?? {};
                    return LatestActivityRow(w0bj: w0bj);
                  }),
              SizedBox(
                height: media.width * 0.01,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
