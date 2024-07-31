import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderSection extends StatefulWidget {
  const HeaderSection({super.key});

  @override
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(top: 7.sp, bottom: 7.sp, left: 15.sp, right: 15.sp),
      decoration: const BoxDecoration(color: Color(0xff006FD8)),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "Shift A",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600),
            ),
          ),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: "Total: ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontFamily: "Poppins",
                ),
              ),
              TextSpan(
                text: "8.0",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600),
              )
            ]),
          ),
          SizedBox(
            width: 15.sp,
          ),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: "Elapsed: ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontFamily: "Poppins",
                ),
              ),
              TextSpan(
                text: "7.0",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600),
              )
            ]),
          )
        ],
      ),
    );
  }
}
