import 'dart:convert';

import 'package:ably_flutter/ably_flutter.dart';
import 'package:eden_work_sample/core/constants/constants.dart';

class AblyOrderEventModel {
  final String uid;
  final String orderId;
  final String status;

  AblyOrderEventModel(
      {required this.uid, required this.orderId, required this.status});

  factory AblyOrderEventModel.fromEvent(Message event) {
    final data = json.decode((event.data as String?) ?? '') as JsonDynamic;
    return AblyOrderEventModel(
      uid: data['uid'] ?? '',
      orderId: data['order_id'] ?? '',
      status: data['status'] ?? '',
    );
  }
}

// channel - eden:ZbSz2jSlYsaOZ6UIrjRZauO0NMq1
// data - { "uid": "ZbSz2jSlYsaOZ6UIrjRZauO0NMq1", "order_id": "2023", "status": "ORDER_ACCEPTED" }