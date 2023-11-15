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
  String get formatedPrice => NumberFormat.decimalPattern().format(this);
}

extension StringExt on String {
  String get currency => NumberFormat.simpleCurrency(name: this).currencySymbol;

  String get routeName {
    if (this == '/') return this;
    if (startsWith('/')) return split('/').last;

    return this;
  }
}

extension ListExt on List {
  int get lastIndex => length - 1;
}
