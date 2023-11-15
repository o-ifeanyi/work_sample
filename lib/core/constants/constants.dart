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
    photoUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStmCLEsyvJAh_c3saVkbztU_u9myvhU6oFpQ&usqp=CAU',
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
    photoUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8Js-4ADxPxIKO1-UrY1N-oORtABsDYnHmwJV0pum2dw&s',
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
    photoUrl:
        'https://media.self.com/photos/57d8c96d24fe9dae32832e67/master/w_1600%2Cc_limit/nutrition-oct30-main.jpg',
    quantity: 4,
    price: 8500.0,
    status: [
      OrderStatusModel.placed(DateTime.now()),
    ],
    orderDate: DateTime.now(),
  )
];
