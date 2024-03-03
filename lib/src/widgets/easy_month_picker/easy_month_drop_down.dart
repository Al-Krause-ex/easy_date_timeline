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
    required this.iconDropdown,
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
  final Icon iconDropdown;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<EasyMonth>(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              EasyConstants.monthDropDownRadius,
            ),
          ),
          icon: iconDropdown,
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          elevation: EasyConstants.monthDropDownElevation,
          value: value,
          style: style,
          items: EasyDateUtils.getYearMonths(DateTime.now(), locale)
              .map(
                (month) => DropdownMenuItem<EasyMonth>(
                  value: month,
                  child: Text(month.name),
                ),
              )
              .toList(),
          onChanged: onMonthChange,
        ),
      ),
    );
  }
}
