import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PerformanceStatus extends StatefulWidget {
  const PerformanceStatus({super.key});

  @override
  State<PerformanceStatus> createState() => _PerformanceStatusState();
}

class _PerformanceStatusState extends State<PerformanceStatus> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.sp),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 2.sp,
                spreadRadius: 2.sp)
          ]),
      padding: EdgeInsets.only(top: 15.sp, bottom: 15.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15.sp, bottom: 10.sp),
            child: Text(
              "Performance Status",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              cardSection(
                  title: "Machine speed",
                  image: "assets/png/machine_speed.png",
                  value: "23445 rpm",
                  color: const Color(0xff006FD8)),
              cardSection(
                  title: "Efficiency",
                  image: "assets/png/efficiency.png",
                  value: "60 %",
                  color: const Color(0xff2ECC71)),
            ],
          ),
          SizedBox(
            height: 15.sp,
          ),
          Row(
            children: [
              gridSection(
                  color: const Color(0xff1AA087),
                  image: 'assets/png/running_time.png',
                  title: 'Running Time',
                  value: '234 min'),
              gridSection(
                  color: const Color(0xff006FD8),
                  image: 'assets/png/avg_speed.png',
                  title: 'Avg speed',
                  value: '33940 RPM'),
            ],
          ),
          SizedBox(
            height: 15.sp,
          ),
          Row(
            children: [
              gridSection(
                  color: const Color(0xffFF8F6B),
                  image: 'assets/png/ideal_time.png',
                  title: 'Idle Time',
                  value: '5.5 min'),
              gridSection(
                  color: const Color(0xffA162F7),
                  image: 'assets/png/power.png',
                  title: 'Power',
                  value: '20 kwh'),
            ],
          ),
          SizedBox(
            height: 15.sp,
          ),
          Row(
            children: [
              gridSection(
                  color: const Color(0xffF541A6),
                  image: 'assets/png/maintenance.png',
                  title: 'Maintenance',
                  value: '3.3 min'),
              gridSection(
                  color: const Color(0xffFF6464),
                  image: 'assets/png/waste.png',
                  title: 'Waste',
                  value: '2.5%'),
            ],
          ),
        ],
      ),
    );
  }

  Widget cardSection(
      {required String title,
      required String image,
      required String value,
      required Color color}) {
    return Expanded(
        child: Container(
            padding: EdgeInsets.all(15.sp),
            decoration: BoxDecoration(color: color),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.sp,
                          fontFamily: "Poppins",
                        ),
                      ),
                      SizedBox(
                        height: 2.sp,
                      ),
                      Text(
                        value,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.sp,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  image,
                  scale: 2,
                )
              ],
            )));
  }

  Widget gridSection(
      {required String image,
      required Color color,
      required String title,
      required String value}) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
        child: Row(
          children: [
            Container(
              height: 30.sp,
              width: 30.sp,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.sp),
                  color: color.withOpacity(0.2)),
              child: Image.asset(
                image,
                scale: 2,
              ),
            ),
            SizedBox(
              width: 8.sp,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: const Color(0xff7C7C7C),
                    fontSize: 13.sp,
                    fontFamily: "Poppins",
                  ),
                ),
                SizedBox(
                  height: 2.sp,
                ),
                Text(
                  value,
                  style: TextStyle(
                      color: color,
                      fontSize: 17.sp,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
