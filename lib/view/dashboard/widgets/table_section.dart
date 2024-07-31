import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ComparisonTable extends StatefulWidget {
  const ComparisonTable({super.key});

  @override
  State<ComparisonTable> createState() => _ComparisonTableState();
}

class _ComparisonTableState extends State<ComparisonTable> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12.sp)),
        child: DataTable(
            horizontalMargin: 12.sp,
            headingRowHeight: 38.sp,
            dataRowMinHeight: 38.sp,
            dataRowMaxHeight: 38.sp,
            border: TableBorder.all(
                color: const Color(0xffF3F3F3),
                borderRadius: BorderRadius.circular(8.sp)),
            columns: [
              const DataColumn(
                label: Text(''),
              ),
              DataColumn(
                label: Text(
                  'LHS',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600),
                ),
              ),
              DataColumn(
                label: Text(
                  'RHS',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
            rows: [
              rows(1, 2, const Color(0xff3CC28F), 3, const Color(0xffF3C356)),
              rows(2, 5, const Color(0xffFF3E3E), 0, const Color(0xff3CC28F)),
              rows(3, 0, const Color(0xff3CC28F), 1, const Color(0xff3CC28F)),
              rows(4, 3.30, const Color(0xffF3C356), 4.5,
                  const Color(0xffFF3E3E)),
            ]));
  }

  DataRow rows(
    int step,
    double lhs,
    Color lhsColor,
    double rhs,
    Color rhsColor,
  ) {
    return DataRow(cells: [
      DataCell(Text(
        'Step $step',
        style: TextStyle(
          color: Colors.black,
          fontSize: 14.sp,
          fontFamily: "Poppins",
        ),
      )),
      DataCell(Text(
        '$lhs',
        style: TextStyle(
            color: lhsColor,
            fontSize: 17.sp,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w600),
      )),
      DataCell(Text(
        '$rhs',
        style: TextStyle(
            color: rhsColor,
            fontSize: 17.sp,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w600),
      )),
    ]);
  }
}
