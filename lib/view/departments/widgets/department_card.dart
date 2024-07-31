import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graph_project/controller/department_controller.dart';
import 'package:graph_project/view/departments/widgets/custom_progress_bar.dart';

class DepartmentCard extends StatelessWidget {
  final Department department;
  const DepartmentCard({super.key, required this.department});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.sp),
      padding: EdgeInsets.only(top: 15.sp, left: 10.sp, right: 10.sp),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.sp),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 2.sp,
                spreadRadius: 2.sp)
          ]),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  department.departmentName ?? "----",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17.sp,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.all(6.sp),
                decoration: BoxDecoration(
                    color: const Color(0xff006FD8),
                    borderRadius: BorderRadius.circular(4.sp)),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 13.sp,
                ),
              )
            ],
          ),
          SizedBox(
            height: 6.sp,
          ),
          const Divider(
            color: Color(0xffD9D9D9),
          ),
          Row(
            children: [
              CustomProgressBar(
                progress: department.efficiency ?? 0,
                markerIndicator: 0.7,
                progressColor: department.machineStatus == true
                    ? const Color(0xff2ECC71)
                    : const Color(0xffFF3E57),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Machine speed",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.sp,
                      fontFamily: "Poppins",
                    ),
                  ),
                  SizedBox(
                    height: 3.sp,
                  ),
                  Text(
                    "${department.machineSpeed ?? 0} rpm",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 13.sp,
                  ),
                  Text(
                    "Machine status",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.sp,
                      fontFamily: "Poppins",
                    ),
                  ),
                  SizedBox(
                    height: 3.sp,
                  ),
                  Text(
                    department.machineStatus == true ? "ON" : "Off",
                    style: TextStyle(
                        color: department.machineStatus == true
                            ? const Color(0xff2ECC71)
                            : const Color(0xffFF3E57),
                        fontSize: 20.sp,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ))
            ],
          )
        ],
      ),
    );
  }
}
