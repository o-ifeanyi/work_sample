import 'package:eden_work_sample/core/services/dialog_service/dialog_service_impl.dart';
import 'package:eden_work_sample/core/utils/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformAlertDialog extends StatelessWidget {
  final String? title;
  final Widget content;
  final List<DialogAction> actions;

  const PlatformAlertDialog(
      {super.key, this.title, required this.content, required this.actions});

  @override
  Widget build(BuildContext context) {
    return Config.isAndroid
        ? AlertDialog(
            title: title != null ? Text(title!) : null,
            content: content,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            actions: actions
                .map(
                  (e) =>
                      TextButton(onPressed: e.onPressed, child: Text(e.text)),
                )
                .toList(),
          )
        : CupertinoAlertDialog(
            title: title != null ? Text(title!) : null,
            content: content,
            actions: actions
                .map(
                  (e) => CupertinoDialogAction(
                      isDefaultAction: e.isDefaultAction,
                      onPressed: e.onPressed,
                      child: Text(e.text)),
                )
                .toList(),
          );
  }
}
