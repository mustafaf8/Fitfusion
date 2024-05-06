//home profile vs gibi butonların context giris bolumleri
import 'package:flutter/material.dart';
import 'package:flutter_gym/common/color_extension.dart';
import 'package:flutter_gym/common/tab_button.dart';
import 'package:flutter_gym/view/home/home_view.dart';
import 'package:flutter_gym/view/photo_progress/photo_progress_view.dart';
import 'package:flutter_gym/view/profile/profile_view.dart';
import 'package:flutter_gym/view/workout_tracker/workout_tracker_view.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  int selectTab = 0;

  final PageStorageBucket pageBucket = PageStorageBucket();
  Widget curentTab = const HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.white,
      body: PageStorage(bucket: pageBucket, child: curentTab),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: InkWell(
          onTap: () {
            setState(() {
              curentTab = const WorkoutTrackerView(
                dObj: {},
              );
            });
          },
          //buradan
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: TColor.primryG),
              borderRadius: BorderRadius.circular(35),
            ),
            child: Icon(
              Icons.search,
              color: TColor.white,
              size: 35,
            ),
          ),
          //buraya search icon
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue[50],
        height: 61,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TabButton(
                icon: "lib/assets/img/Home.png",
                selectIcon: "lib/assets/img/Home_p.png",
                isActive: selectTab == 0,
                onTab: () {
                  selectTab = 0;
                  curentTab = const HomeView();
                  if (mounted) {
                    setState(() {});
                  }
                }),
            TabButton(
                icon: "lib/assets/img/Activity.png",
                selectIcon: "lib/assets/img/Activity_p.png",
                isActive: selectTab == 1,
                onTab: () {
                  selectTab = 1;
                  curentTab = const WorkoutTrackerView(
                    dObj: {},
                  );
                  if (mounted) {
                    setState(() {});
                  }
                }),
            const SizedBox(
              width: 45,
            ),
            TabButton(
                icon: "lib/assets/img/Camera.png",
                selectIcon: "lib/assets/img/Camera_p.png",
                isActive: selectTab == 2,
                onTab: () {
                  selectTab = 2;
                  curentTab = const PhotoProgressView();
                  if (mounted) {
                    setState(() {});
                  }
                }),
            TabButton(
                icon: "lib/assets/img/Profile.png",
                selectIcon: "lib/assets/img/Profile_p.png",
                isActive: selectTab == 3,
                onTab: () {
                  selectTab = 3;
                  curentTab = const ProfileView();
                  if (mounted) {
                    setState(() {});
                  }
                }),
          ],
        ),
      ),
    );
  }
}
