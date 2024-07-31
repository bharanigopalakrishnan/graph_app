import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graph_project/view/dashboard/widgets/performance_status.dart';
import 'package:graph_project/view/dashboard/widgets/table_section.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 15.sp,
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
          child: const PerformanceStatus(),
        ),
        SizedBox(
          height: 15.sp,
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
          child: const ComparisonTable(),
        )
      ],
    );
  }
}
