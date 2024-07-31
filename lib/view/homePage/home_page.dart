import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graph_project/controller/home_controller.dart';
import 'package:graph_project/view/dashboard/dashboard.dart';
import 'package:graph_project/view/departments/department.dart';
import 'package:graph_project/view/homePage/widgets/header_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 70.sp),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            controller.selectedKey == 0 ? "Dashboard" : "Departments",
            style: TextStyle(
                color: Colors.black,
                fontSize: 21.sp,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600),
          ),
          actions: [
            Container(
                padding: EdgeInsets.all(9.sp),
                decoration: const BoxDecoration(
                    color: Color(0xffF3F3F3), shape: BoxShape.circle),
                child: Icon(
                  Icons.notifications,
                  color: Colors.black,
                  size: 20.sp,
                )),
            SizedBox(
              width: 10.sp,
            ),
            Container(
                padding: EdgeInsets.all(9.sp),
                decoration: const BoxDecoration(
                    color: Color(0xffF3F3F3), shape: BoxShape.circle),
                child: Icon(
                  Icons.person,
                  color: Colors.black,
                  size: 20.sp,
                )),
            SizedBox(
              width: 10.sp,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const HeaderSection(),
          Expanded(
            child: PageView.builder(
              controller: controller.pageController,
              onPageChanged: (index) {
                setState(() {
                  controller.selectedKey = index;
                });
              },
              itemCount: 2,
              itemBuilder: (context, index) {
                return index == 0 ? const Dashboard() : const Departments();
              },
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(top: 15.sp, bottom: 15.sp),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              blurRadius: 2.sp,
              spreadRadius: 2.sp,
              color: Colors.grey.withOpacity(0.1))
        ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            bottomNavBarWidget(0, "assets/png/dashboard.png", "Dashboard"),
            SizedBox(
              width: 60.sp,
            ),
            bottomNavBarWidget(1, "assets/png/departments.png", "Departments"),
          ],
        ),
      ),
    );
  }

  Widget bottomNavBarWidget(int key, String image, String title) {
    return GestureDetector(
      onTap: () {
        setState(() {
          controller.selectedKey = key;
        });
        controller.pageController.animateToPage(key,
            duration: const Duration(milliseconds: 500), curve: Curves.linear);

        HapticFeedback.mediumImpact();
      },
      child: Container(
        key: ValueKey(key),
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              image,
              color: (controller.selectedKey == key)
                  ? const Color(0xff006FD8)
                  : Colors.black,
              scale: 2,
            ),
            SizedBox(
              height: 10.sp,
            ),
            Text(
              title,
              style: TextStyle(
                  color: (controller.selectedKey == key)
                      ? const Color(0xff006FD8)
                      : Colors.black,
                  fontSize: 13.sp,
                  fontFamily: "Poppins",
                  fontWeight:
                      (controller.selectedKey == key) ? FontWeight.bold : null),
            )
          ],
        ),
      ),
    );
  }
}
