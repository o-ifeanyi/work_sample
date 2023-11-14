import 'package:ably_flutter/ably_flutter.dart';
import 'package:eden_work_sample/app/data/models/ably_event_model.dart';
import 'package:eden_work_sample/app/data/models/order_status_model.dart';
import 'package:eden_work_sample/app/presentation/provider/order_provider.dart';
import 'package:eden_work_sample/core/di/service_locator.dart';
import 'package:eden_work_sample/core/services/dialog_service/dialog_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final socketProvider = NotifierProvider<SocketProvider, ConnectionState>(
  () => sl<SocketProvider>(),
);

class SocketProvider extends Notifier<ConnectionState> {
  final Realtime realtime;
  final DialogService dialogService;
  SocketProvider({required this.realtime, required this.dialogService});

  @override
  ConnectionState build() => ConnectionState.closed;

  void connectoSocket(String uid) {
    realtime.connection
        .on(ConnectionEvent.connected)
        .listen((ConnectionStateChange stateChange) async {
      state = stateChange.current;
      switch (stateChange.current) {
        case ConnectionState.connected:
          dialogService.displayMessage('Connected to Ably!',
              status: Status.success);
          listenForUpdates(uid);
          break;
        case ConnectionState.failed:
          dialogService.displayMessage('Failed to connect to Ably');
          break;
        default:
      }
    });
  }

  void listenForUpdates(String uid) {
    try {
      final channel = realtime.channels.get('eden:$uid');
      final sub = channel.subscribe(name: 'order_updates');
      sub.listen((event) {
        if (event.data == null || event.timestamp == null) return;
        switch (event.name) {
          case 'order_updates':
            final data = AblyOrderEventModel.fromEvent(event);
            ref.read(orderProvider.notifier).updateOrder(
                  data.orderId,
                  switch (data.status) {
                    'ORDER_ACCEPTED' =>
                      OrderStatusModel.accepted(event.timestamp!),
                    'PICK_UP_IN_PROGRESS' =>
                      OrderStatusModel.pickUpInProgress(event.timestamp!),
                    'DROP_OFF_IN_PROGRESS' =>
                      OrderStatusModel.dropOffInProgress(event.timestamp!),
                    'ORDER_ARRIVED' =>
                      OrderStatusModel.arrived(event.timestamp!),
                    'ORDER_DELIVERED' =>
                      OrderStatusModel.delivered(event.timestamp!),
                    _ => null
                  },
                );
            break;
          default:
        }
      }).onError((error) {
        debugPrint('An error occured: $error');
      });
    } catch (error) {
      debugPrint('An error occured: $error');
    }
  }
}
