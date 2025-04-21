import 'package:evently_app/core/data/DM/category_dm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTab extends StatelessWidget {
  const CustomTab({
    super.key,
    required this.categoryDM,
    required this.isSelected,
    required this.selectedTabBg,
    required this.unselectedTabBg,
    required this.selectedLabelColor,
    required this.unselectedLabelColor,
  });

  final CategoryDM categoryDM;
  final bool isSelected;
  final Color selectedTabBg;
  final Color unselectedTabBg;
  final Color selectedLabelColor;
  final Color unselectedLabelColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        color: isSelected ? selectedTabBg : unselectedTabBg,
        borderRadius: BorderRadius.circular(46.r),
        border: Border.all(width: 1.w, color: selectedTabBg),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            width: 22.w,
            height: 22.h,
            categoryDM.iconPath,
            colorFilter: ColorFilter.mode(
              isSelected ? selectedLabelColor : unselectedLabelColor,
              BlendMode.srcIn,
            ),
          ),
          SizedBox(width: 8.w),
          Text(
            categoryDM.categoryName,

            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: isSelected ? selectedLabelColor : unselectedLabelColor,
            ),
          ),
        ],
      ),
    );
  }
}
