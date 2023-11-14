import 'package:eden_work_sample/app/data/models/order_model.dart';
import 'package:eden_work_sample/app/data/models/order_status_model.dart';
import 'package:eden_work_sample/core/utils/app_icons.dart';
import 'package:flutter/material.dart';

typedef JsonObject = Map<String, Object?>;
typedef JsonDynamic = Map<String, dynamic>;

List<JsonDynamic> kNavItems = [
  {
    'title': 'Orders',
    'icon': Icon(AppIcons.orders),
    'inactice': Icon(AppIcons.ordersOl),
  },
  {
    'title': 'Profile',
    'icon': Icon(AppIcons.user),
    'inactice': Icon(AppIcons.userOl),
  },
];

List<OrderModel> kOrders = [
  OrderModel(
    id: '2023',
    item: 'Beans and fried plantain',
    quantity: 2,
    price: 600.0,
    status: [
      OrderStatusModel.placed(DateTime.now()),
    ],
    orderDate: DateTime.now(),
  ),
  OrderModel(
    id: '2024',
    item: '8 Pieces KFC bucket',
    quantity: 1,
    price: 12250.0,
    status: [
      OrderStatusModel.placed(DateTime.now()),
    ],
    orderDate: DateTime.now(),
  ),
  OrderModel(
    id: '2025',
    item: 'Pizza Hut - Sweet chilli chicken pizza',
    quantity: 4,
    price: 8500.0,
    status: [
      OrderStatusModel.placed(DateTime.now()),
    ],
    orderDate: DateTime.now(),
  )
];
