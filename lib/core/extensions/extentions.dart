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

  String get trim => toStringAsFixed(2);
}

extension StringExt on String {
  String get routeName {
    if (this == '/') return this;
    if (startsWith('/')) return split('/').last;

    return this;
  }

  double get price => double.parse(replaceAll(RegExp(r'[^\d.]'), ''));

  String get capSentence {
    if (trim().isEmpty) return this;
    final words = split(' ');
    return words
        .map((e) => "${e.substring(0, 1).toUpperCase()}${e.substring(1)}")
        .join(' ');
  }
}

extension ListExt on List {
  int get lastIndex => length - 1;
}
