import 'dart:async';

import 'dialog_service.dart';

final class DialogAction {
  final String text;
  final void Function()? onPressed;
  final bool isDefaultAction;

  DialogAction({
    required this.text,
    required this.onPressed,
    this.isDefaultAction = false,
  });
}

class DialogServiceImpl implements DialogService {
  final StreamController<DialogModel> _controller =
      StreamController<DialogModel>();

  @override
  Stream<DialogModel> get stream => _controller.stream;

  @override
  void displayMessage(String message,
      {Status status = Status.failed, String? title}) {
    _controller.add(DialogModel(
      title: title,
      message: message,
      status: status,
    ));
  }

  @override
  void displayDialog({
    String? title,
    required String message,
    DialogAction? action,
  }) {
    _controller.add(DialogModel(
        title: title,
        message: message,
        action: action,
        displayType: DisplayType.dialog));
  }

  @override
  void dispose() => _controller.close();
}
