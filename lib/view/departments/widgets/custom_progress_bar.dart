import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;

class CustomProgressBar extends StatefulWidget {
  final double progress;
  final double markerIndicator;
  final Color progressColor;

  const CustomProgressBar(
      {super.key,
      required this.progress,
      required this.markerIndicator,
      required this.progressColor});

  @override
  State<CustomProgressBar> createState() => _CustomProgressBarState();
}

class _CustomProgressBarState extends State<CustomProgressBar> {
  bool isRight = false;
  double progress = 0;
  double markerIndicator = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isRight = widget.markerIndicator <= 0.5;
    progress = widget.progress;
    markerIndicator = widget.markerIndicator;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(30.sp),
          child: Container(
            height: 100.sp,
            width: 100.sp,
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                    width: 3.sp,
                    color: const Color(0xff2ECC71).withOpacity(0.3))),
          ),
        ),
        SizedBox(
            height: 90.sp,
            width: 90.sp,
            child: CircularProgressIndicator(
              value: progress,
              strokeWidth: 8.sp,
              backgroundColor: Colors.transparent,
              valueColor: AlwaysStoppedAnimation<Color>(widget.progressColor),
            )),
        Positioned(
          left: 100.sp / 2 +
              (100.sp / 2 - 8.sp / 2) *
                  math.cos(2 * math.pi * markerIndicator - math.pi / 2) -
              2.sp / 2 +
              30.sp +
              (!isRight ? -35.sp : 0.sp),
          top: 100.sp / 2 +
              (100.sp / 2 - 8.sp / 2) *
                  math.sin(2 * math.pi * markerIndicator - math.pi / 2) -
              9.sp / 2 +
              30.sp,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              !isRight
                  ? Padding(
                      padding: EdgeInsets.only(right: 5.sp),
                      child: Text(
                        "${markerIndicator * 100} %",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontFamily: "Poppins",
                        ),
                      ),
                    )
                  : Container(),
              Transform.rotate(
                angle: 2 * math.pi * markerIndicator,
                child: Container(
                  width: 2.sp,
                  height: 8.sp,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                ),
              ),
              isRight
                  ? Padding(
                      padding: EdgeInsets.only(left: 5.sp),
                      child: Text(
                        "${markerIndicator * 100} %",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontFamily: "Poppins",
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
        Text(
          "${progress * 100}%",
          style: TextStyle(
              color: widget.progressColor,
              fontSize: 24.sp,
              fontFamily: "Poppins",
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
