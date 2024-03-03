import 'package:flutter/material.dart';

import '../../models/easy_month.dart';
import '../../utils/utils.dart';

/// A widget that displays a drop-down list of months.
class EasyMonthDropDown extends StatelessWidget {
  const EasyMonthDropDown({
    super.key,
    this.value,
    this.onMonthChange,
    required this.locale,
    this.style,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.iconDropdown,
    required this.height,
    required this.width,
  });

  /// The currently selected month.
  final EasyMonth? value;

  /// A callback function that is called when the selected month changes.
  final OnMonthChangeCallBack? onMonthChange;

  /// A `String` that represents the locale code to use for formatting the month names in the drop-down list.
  final String locale;

  /// The text style applied to the month string.
  final TextStyle? style;

  final Color backgroundColor;
  final Color foregroundColor;
  final Icon iconDropdown;

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor,
      ),
      alignment: Alignment.center,
      child: DropdownButtonHideUnderline(
        child: DropdownButton<EasyMonth>(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              EasyConstants.monthDropDownRadius,
            ),
          ),
          dropdownColor: backgroundColor,
          icon: iconDropdown,
          isExpanded: true,
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          elevation: EasyConstants.monthDropDownElevation,
          value: value,
          style: style,
          items: EasyDateUtils.getYearMonths(DateTime.now(), locale)
              .map(
                (month) => DropdownMenuItem<EasyMonth>(
                  value: month,
                  child: Text(capitalize(month.name)),
                ),
              )
              .toList(),
          onChanged: onMonthChange,
        ),
      ),
    );
  }

  String capitalize(String val) {
    return "${val[0].toUpperCase()}${val.substring(1).toLowerCase()}";
  }
}
