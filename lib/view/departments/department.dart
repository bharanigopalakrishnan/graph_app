import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graph_project/controller/department_controller.dart';
import 'package:graph_project/view/departments/widgets/department_card.dart';

class Departments extends StatefulWidget {
  const Departments({super.key});

  @override
  State<Departments> createState() => _DepartmentsState();
}

class _DepartmentsState extends State<Departments> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(15.sp),
      children: [
        DepartmentCard(
          department: Department(
              departmentName: "Department A",
              efficiency: 0.75,
              machineSpeed: 49505,
              machineStatus: true),
        ),
        DepartmentCard(
          department: Department(
              departmentName: "Department B",
              efficiency: 0.5,
              machineSpeed: 34505,
              machineStatus: false),
        )
      ],
    );
  }
}
