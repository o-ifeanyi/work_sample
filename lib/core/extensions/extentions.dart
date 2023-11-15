import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String get formatTime {
    final kDfMY = DateFormat('HH:mm a');
    return kDfMY.format(this);
  }

  String get formatDateTime {
    final kDfMY = DateFormat('E dd MMM HH:mm');
    return kDfMY.format(this);
  }
}

extension DoubleExt on double {
  String get formatedPrice => NumberFormat.simpleCurrency(
        name: 'NGN',
        decimalDigits: 2,
      ).format(this);
}

extension StringExt on String {
  String get routeName {
    if (this == '/') return this;
    if (startsWith('/')) return split('/').last;

    return this;
  }
}

extension ListExt on List {
  int get lastIndex => length - 1;
}
