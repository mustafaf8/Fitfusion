import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gym/common/color_extension.dart';
import 'package:flutter_gym/common_widget/round_button.dart';
import 'package:flutter_gym/common_widget/workout_row.dart';
import 'package:flutter_gym/view/home/activity_tracker_view.dart';
import 'package:flutter_gym/view/home/notification_view.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List lastWorkoutArr = [
    {
      "name": "Omuz Antrenmanı",
      "image": "lib/assets/img/Ellipse (4).png",
      "kCal": "200",
      "time": "30dk",
    },
    {
      "name": "Karın Antrenmanı",
      "image": "lib/assets/img/Ellipse (5).png",
      "kCal": "170",
      "time": "25dk",
    },
    {
      "name": "Kardiyo",
      "image": "lib/assets/img/Ellipse (1).png",
      "kCal": "250",
      "time": "15dk",
    },
    {
      "name": "İp Atlama",
      "image": "lib/assets/img/Vector.png",
      "kCal": "300",
      "time": "10dk",
    },
  ];
  List<int> showingTooltipOnSpots = [21];

  List<FlSpot> get allSpots => const [
        FlSpot(0, 20),
        FlSpot(1, 25),
        FlSpot(2, 40),
        FlSpot(3, 50),
        FlSpot(4, 35),
        FlSpot(5, 40),
        FlSpot(6, 30),
        FlSpot(7, 20),
        FlSpot(8, 25),
        FlSpot(9, 40),
        FlSpot(10, 50),
        FlSpot(11, 35),
        FlSpot(12, 50),
        FlSpot(13, 60),
        FlSpot(14, 40),
        FlSpot(15, 50),
        FlSpot(16, 20),
        FlSpot(17, 25),
        FlSpot(18, 40),
        FlSpot(19, 50),
        FlSpot(20, 35),
        FlSpot(21, 80),
        FlSpot(22, 30),
        FlSpot(23, 20),
        FlSpot(24, 25),
        FlSpot(25, 40),
        FlSpot(26, 50),
        FlSpot(27, 35),
        FlSpot(28, 50),
        FlSpot(29, 60),
        FlSpot(30, 40),
      ];

  List waterArr = [
    {"title": "6am-8am", "subtitle": "600ml"},
    {"title": "9am-11am", "subtitle": "600ml"},
    {"title": "11am-2pm", "subtitle": "600ml"},
    {"title": "2pm-4pm", "subtitle": "600ml"},
    {"title": "4pm-..", "subtitle": "600ml"},
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    final lineBarsData = [
      LineChartBarData(
        showingIndicators: showingTooltipOnSpots,
        spots: allSpots,
        isCurved: false, //kenarları yumusatama
        barWidth: 3, // barın kalp ritim kalınlığı
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(
            colors: [
              TColor.primryColor2
                  .withOpacity(0.7), //dalgalanmaının altındaki renk şefaflıgı
              TColor.primryColor1.withOpacity(0.1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        dotData: const FlDotData(show: false),
        gradient: LinearGradient(
          colors: TColor.primryG,
        ),
      ),
    ];

    final tooltipsOnBar = lineBarsData[0];
    return Scaffold(
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const NotificationView()));
                      },
                      icon: Image.asset(
                        "lib/assets/img/notification_icon.png",
                        width: 25,
                        height: 25,
                        fit: BoxFit.fitHeight,
                      ))
                ],
              ),
              SizedBox(
                height: media.width * 0.05,
              ),
              Container(
                height: media.width * 0.4,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: TColor.primryG),
                    borderRadius: BorderRadius.circular(media.width * 0.075)),
                child: Stack(alignment: Alignment.center, children: [
                  Image.asset(
                    "lib/assets/img/Dots.png",
                    height: media.width * 0.4,
                    width: double.maxFinite,
                    fit: BoxFit.fitHeight,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Vücüt Kitle Endeksi",
                              style: TextStyle(
                                  color: TColor.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "Kilonuz Normal Düzeyde",
                              style:
                                  TextStyle(color: TColor.gray, fontSize: 12),
                            ),
                            SizedBox(
                              height: media.width * 0.01,
                            ),
                            SizedBox(
                              width: 120,
                              height: 30,
                              child: RoundButton(
                                title: "Daha Fazla",
                                type: RoundButtonType.bgSGradient,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                onPressed: () {},
                                elevation: 0,
                              ),
                            )
                          ],
                        ),
                        //yuvarlak chart
                        AspectRatio(
                          aspectRatio: 1,
                          child: PieChart(
                            PieChartData(
                              pieTouchData: PieTouchData(
                                touchCallback:
                                    (FlTouchEvent event, pieTouchResponse) {},
                              ),
                              startDegreeOffset: 180,
                              borderData: FlBorderData(
                                show: false,
                              ),
                              sectionsSpace: 3,
                              centerSpaceRadius: 1,
                              sections: showingSections(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
              ),
              SizedBox(
                height: media.width * 0.05,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                decoration: BoxDecoration(
                    color: TColor.primryColor2.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
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
                      width: 70,
                      height: 30,
                      child: RoundButton(
                        title: "Göz At",
                        type: RoundButtonType.bgGradient,
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ActivityTrackerView(),
                            ),
                          );
                        },
                        elevation: 0,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: media.width * 0.05,
              ),
              Text(
                "Genel Durum",
                style: TextStyle(
                    color: TColor.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: media.width * 0.02,
              ),
              //kalp ritm ,,,,,,,
              ClipRRect(
                borderRadius: BorderRadius.circular(25), //kenar yumusatma
                child: Container(
                  height: media.width * 0.4,
                  width: double.maxFinite,
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  decoration: BoxDecoration(
                    color: TColor.primryColor2.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 25, horizontal: 25),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Kalp Ritmi",
                              style: TextStyle(
                                  color: TColor.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                            ShaderMask(
                              blendMode: BlendMode.srcIn,
                              shaderCallback: (bounds) {
                                return LinearGradient(
                                        colors: TColor.primryG,
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight)
                                    .createShader(Rect.fromLTRB(
                                        0, 0, bounds.width, bounds.height));
                              },
                              child: Text(
                                "78 BPM",
                                style: TextStyle(
                                    color: TColor.gray,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                      ),
                      LineChart(
                        LineChartData(
                          showingTooltipIndicators:
                              showingTooltipOnSpots.map((index) {
                            return ShowingTooltipIndicators([
                              LineBarSpot(
                                tooltipsOnBar,
                                lineBarsData.indexOf(tooltipsOnBar),
                                tooltipsOnBar.spots[index],
                              ),
                            ]);
                          }).toList(),
                          lineTouchData: LineTouchData(
                            enabled: true,
                            handleBuiltInTouches: false,
                            touchCallback: (FlTouchEvent event,
                                LineTouchResponse? response) {
                              if (response == null ||
                                  response.lineBarSpots == null) {
                                return;
                              }
                              if (event is FlTapUpEvent) {
                                final spotIndex =
                                    response.lineBarSpots!.first.spotIndex;
                                showingTooltipOnSpots.clear();
                                setState(() {
                                  showingTooltipOnSpots.add(spotIndex);
                                });
                              }
                            },
                            mouseCursorResolver: (FlTouchEvent event,
                                LineTouchResponse? response) {
                              if (response == null ||
                                  response.lineBarSpots == null) {
                                return SystemMouseCursors.basic;
                              }
                              return SystemMouseCursors.click;
                            },
                            getTouchedSpotIndicator: (LineChartBarData barData,
                                List<int> spotIndexes) {
                              return spotIndexes.map((index) {
                                return TouchedSpotIndicatorData(
                                  const FlLine(
                                    color: Colors.transparent,
                                  ),
                                  FlDotData(
                                    show: true,
                                    getDotPainter:
                                        (spot, percent, barData, index) =>
                                            FlDotCirclePainter(
                                      radius: 3,
                                      color: Colors.white,
                                      strokeWidth: 3,
                                      strokeColor: TColor.scondaryColor1,
                                    ),
                                  ),
                                );
                              }).toList();
                            },
                            touchTooltipData: LineTouchTooltipData(
                              tooltipBgColor: TColor.scondaryColor1,
                              tooltipRoundedRadius: 15,
                              getTooltipItems:
                                  (List<LineBarSpot> lineBarsSpot) {
                                return lineBarsSpot.map((lineBarSpot) {
                                  return LineTooltipItem(
                                    "${lineBarSpot.x.toInt()} dk önce", // ritim barının içine
                                    const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                }).toList();
                              },
                            ),
                          ),
                          lineBarsData: lineBarsData,
                          minY: 0,
                          maxY: 120,
                          titlesData: const FlTitlesData(
                            show: false,
                          ),
                          gridData: const FlGridData(show: false),
                          borderData: FlBorderData(
                            show: true,
                            border: Border.all(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //ritimden sonrakiler
              SizedBox(
                height: media.width * 0.05,
              ),
              Row(
                children: [
                  Expanded(
                    //ilk uzun kutu sag
                    child: Container(
                      height: media.width * 0.95,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 25),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: const [
                            BoxShadow(color: Colors.black12, blurRadius: 2)
                          ]),
                      child: Row(
                        children: [
                          //dikey bar

                          SimpleAnimationProgressBar(
                            height: media.width * 0.85,
                            width: media.width * 0.07,
                            backgroundColor:
                                const Color.fromARGB(255, 238, 237, 237),
                            foregrondColor:
                                const Color.fromARGB(255, 228, 74, 255),
                            ratio: 0.3,
                            direction: Axis.vertical,
                            curve: Curves.fastLinearToSlowEaseIn,
                            duration: const Duration(seconds: 3),
                            borderRadius: BorderRadius.circular(15),
                            gradientColor: const LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 71, 166, 255),
                                  Color.fromARGB(255, 125, 169, 226)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter),
                          ),

                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Su ihtiyacı",
                                style: TextStyle(
                                    color: TColor.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              ),
                              ShaderMask(
                                blendMode: BlendMode.srcIn,
                                shaderCallback: (bounds) {
                                  return LinearGradient(
                                          colors: TColor.primryG,
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight)
                                      .createShader(Rect.fromLTRB(
                                          0, 0, bounds.width, bounds.height));
                                },
                                child: Text(
                                  "3 litre",
                                  style: TextStyle(
                                      color: TColor.gray,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Gün Boyu",
                                style: TextStyle(
                                    color: TColor.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: waterArr.map((w0bj) {
                                  var isLast = w0bj == waterArr.last;
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 4),
                                            width: 10,
                                            height: 10,
                                            decoration: BoxDecoration(
                                              color: TColor.scondaryColor2,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                          ),
                                          if (!isLast)
                                            DottedDashedLine(
                                                height: media.width * 0.1,
                                                width: 0,
                                                dashColor: TColor.scondaryColor1
                                                    .withOpacity(0.5),
                                                axis: Axis.vertical)
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            w0bj["title"].toString(),
                                            style: TextStyle(
                                                color: TColor.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          ShaderMask(
                                            blendMode: BlendMode.srcIn,
                                            shaderCallback: (bounds) {
                                              return LinearGradient(
                                                      colors: TColor.scondaryG,
                                                      begin:
                                                          Alignment.centerLeft,
                                                      end:
                                                          Alignment.centerRight)
                                                  .createShader(Rect.fromLTRB(
                                                      0,
                                                      0,
                                                      bounds.width,
                                                      bounds.height));
                                            },
                                            child: Text(
                                              w0bj["subtitle"].toString(),
                                              style: TextStyle(
                                                  color: TColor.gray,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  );
                                }).toList(),
                              )
                            ],
                          ))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: media.width * 0.05,
                  ),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //birinci kutu sol
                      Container(
                        width: double.maxFinite,
                        height: media.width * 0.45,
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: const [
                              BoxShadow(color: Colors.black12, blurRadius: 2)
                            ]),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Uyku",
                                style: TextStyle(
                                    color: TColor.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              ),
                              ShaderMask(
                                blendMode: BlendMode.srcIn,
                                shaderCallback: (bounds) {
                                  return LinearGradient(
                                          colors: TColor.primryG,
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight)
                                      .createShader(Rect.fromLTRB(
                                          0, 0, bounds.width, bounds.height));
                                },
                                child: Text(
                                  "8 Saat",
                                  style: TextStyle(
                                      color: TColor.gray,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Image.asset(
                                "lib/assets/img/Sleep-Graph.png",
                                width: double.infinity,
                                fit: BoxFit.fitWidth,
                              )
                            ]),
                      ),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      //ikinci kutu sol
                      Container(
                        width: double.maxFinite,
                        height: media.width * 0.45,
                        padding: const EdgeInsets.symmetric(
                            vertical: 25, horizontal: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: const [
                              BoxShadow(color: Colors.black12, blurRadius: 2)
                            ]),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Calori",
                                style: TextStyle(
                                    color: TColor.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              ),
                              ShaderMask(
                                blendMode: BlendMode.srcIn,
                                shaderCallback: (bounds) {
                                  return LinearGradient(
                                          colors: TColor.primryG,
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight)
                                      .createShader(Rect.fromLTRB(
                                          0, 0, bounds.width, bounds.height));
                                },
                                child: Text(
                                  "830 kCal",
                                  style: TextStyle(
                                      color: TColor.gray,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              const Spacer(),
                              Container(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  width: media.width * 0.2,
                                  height: media.width * 0.2,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        width: media.width * 0.17,
                                        height: media.width * 0.17,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              colors: TColor.primryG),
                                          borderRadius: BorderRadius.circular(
                                              media.width * 0.085),
                                        ),
                                        child: FittedBox(
                                          child: Text(
                                            "370 kCal\nleft",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: TColor.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                      ),
                                      SimpleCircularProgressBar(
                                        progressStrokeWidth: 10,
                                        backStrokeWidth: 10,
                                        progressColors: TColor.primryG,
                                        backColor: Colors.grey.shade100,
                                        valueNotifier: ValueNotifier(50),
                                        startAngle: -180,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    ],
                  ))
                ],
              ),

              SizedBox(
                height: media.width * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "İlerleme Durumu",
                    style: TextStyle(
                        color: TColor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Container(
                    height: 30,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: TColor.primryG),
                        borderRadius: BorderRadius.circular(15)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        items: ["Haftalık", "Aylık"]
                            .map((name) => DropdownMenuItem(
                                  value: name,
                                  child: Text(
                                    name,
                                    style: TextStyle(
                                        color: TColor.gray, fontSize: 14),
                                  ),
                                ))
                            .toList(),
                        onChanged: (value) {},
                        icon: Icon(Icons.expand_more, color: TColor.white),
                        hint: Text(
                          "Haftalık",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: TColor.white, fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: media.width * 0.05,
              ),

              Container(
                padding: const EdgeInsets.only(left: 15),
                height: media.width * 0.5,
                width: double.maxFinite,
                child: LineChart(
                  LineChartData(
                    showingTooltipIndicators:
                        showingTooltipOnSpots.map((index) {
                      return ShowingTooltipIndicators([
                        LineBarSpot(
                          tooltipsOnBar,
                          lineBarsData.indexOf(tooltipsOnBar),
                          tooltipsOnBar.spots[index],
                        ),
                      ]);
                    }).toList(),
                    lineTouchData: LineTouchData(
                      enabled: true,
                      handleBuiltInTouches: false,
                      touchCallback:
                          (FlTouchEvent event, LineTouchResponse? response) {
                        if (response == null || response.lineBarSpots == null) {
                          return;
                        }
                        if (event is FlTapUpEvent) {
                          final spotIndex =
                              response.lineBarSpots!.first.spotIndex;
                          showingTooltipOnSpots.clear();
                          setState(() {
                            showingTooltipOnSpots.add(spotIndex);
                          });
                        }
                      },
                      mouseCursorResolver:
                          (FlTouchEvent event, LineTouchResponse? response) {
                        if (response == null || response.lineBarSpots == null) {
                          return SystemMouseCursors.basic;
                        }
                        return SystemMouseCursors.click;
                      },
                      getTouchedSpotIndicator:
                          (LineChartBarData barData, List<int> spotIndexes) {
                        return spotIndexes.map((index) {
                          return TouchedSpotIndicatorData(
                            const FlLine(
                              color: Colors.transparent,
                            ),
                            FlDotData(
                              show: true,
                              getDotPainter: (spot, percent, barData, index) =>
                                  FlDotCirclePainter(
                                radius: 3,
                                color: Colors.white,
                                strokeWidth: 3,
                                strokeColor: TColor.scondaryColor1,
                              ),
                            ),
                          );
                        }).toList();
                      },
                      touchTooltipData: LineTouchTooltipData(
                        tooltipBgColor: TColor.scondaryColor1,
                        tooltipRoundedRadius: 15,
                        getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
                          return lineBarsSpot.map((lineBarSpot) {
                            return LineTooltipItem(
                              "${lineBarSpot.x.toInt()} dk önce", // ritim barının içine
                              const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          }).toList();
                        },
                      ),
                    ),
                    lineBarsData: lineBarsData1,
                    minY: -0.5,
                    maxY: 110,
                    titlesData: FlTitlesData(
                        show: true,
                        leftTitles: const AxisTitles(),
                        topTitles: const AxisTitles(),
                        bottomTitles: AxisTitles(
                          sideTitles: bottomTitles,
                        ),
                        rightTitles: AxisTitles(
                          sideTitles: rightTitles(),
                        )),
                    gridData: FlGridData(
                      show: true,
                      drawHorizontalLine: true,
                      horizontalInterval: 25,
                      drawVerticalLine: false,
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          color: TColor.gray.withOpacity(0.15),
                          strokeWidth: 2,
                        );
                      },
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border: Border.all(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: media.width * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "En Son Yapılanlar",
                    style: TextStyle(
                        color: TColor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              SizedBox(
                height: media.width * 0.05,
              ),
              ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: lastWorkoutArr.length,
                  itemBuilder: (context, index) {
                    var w0bj = lastWorkoutArr[index] as Map? ?? {};
                    return WorkoutRow(w0bj: w0bj);
                  }),

              SizedBox(
                height: media.width * 0.01,
              ),
            ],
          ),
        )),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(
      2,
      (i) {
        var color0 = TColor.scondaryColor1;

        switch (i) {
          case 0:
            return PieChartSectionData(
                color: color0,
                value: 25,
                title: '',
                radius: 50,
                titlePositionPercentageOffset: 0.55,
                badgeWidget: const Text(
                  "20,1",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
                ));
          case 1:
            return PieChartSectionData(
              color: Colors.white,
              value: 75,
              title: '',
              radius: 40,
              titlePositionPercentageOffset: 0.55,
            );

          default:
            throw Error();
        }
      },
    );
  }

  LineTouchData get lineTouchData1 => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
      );
  List<LineChartBarData> get lineBarsData1 => [
        lineChartBarData1_1,
        lineChartBarData1_2,
      ];
  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
        isCurved: true,
        gradient: LinearGradient(colors: [
          TColor.primryColor2.withOpacity(0.5),
          TColor.primryColor1.withOpacity(0.5)
        ]),
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 35),
          FlSpot(2, 70),
          FlSpot(3, 40),
          FlSpot(4, 80),
          FlSpot(5, 25),
          FlSpot(6, 70),
          FlSpot(7, 35),
        ],
      );

  LineChartBarData get lineChartBarData1_2 => LineChartBarData(
        isCurved: true,
        gradient: LinearGradient(colors: [
          TColor.scondaryColor2.withOpacity(1),
          TColor.scondaryColor1.withOpacity(0.8)
        ]),
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(
          show: false,
        ),
        spots: const [
          FlSpot(1, 80),
          FlSpot(2, 50),
          FlSpot(3, 90),
          FlSpot(4, 40),
          FlSpot(5, 80),
          FlSpot(6, 35),
          FlSpot(7, 80),
        ],
      );
  SideTitles rightTitles() => SideTitles(
        getTitlesWidget: rightTitleWidgets,
        showTitles: true,
        interval: 20,
        reservedSize: 40,
      );
  Widget rightTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 12,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0%';
        break;
      case 20:
        text = '20%';
        break;
      case 40:
        text = '40%';
        break;
      case 60:
        text = '60%';
        break;
      case 80:
        text = '80%';
        break;
      case 100:
        text = '100%';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.center);
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('Sun');
        break;
      case 2:
        text = const Text('Mon');
        break;
      case 3:
        text = const Text('Tue');
        break;
      case 4:
        text = const Text('Wed');
        break;
      case 5:
        text = const Text('Thu');
        break;
      case 6:
        text = const Text('Fri');
        break;
      case 7:
        text = const Text('Sat');
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }
}
