import 'package:eden_work_sample/core/di/service_locator.dart';
import 'package:eden_work_sample/core/platform_specific/platform_alert_dialog.dart';
import 'package:eden_work_sample/core/services/dialog_service/dialog_service.dart';
import 'package:eden_work_sample/core/utils/config.dart';
import 'package:eden_work_sample/core/utils/context_utils.dart';
import 'package:eden_work_sample/core/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppAware extends ConsumerStatefulWidget {
  final Widget child;

  const AppAware({
    super.key,
    required this.child,
  });
  @override
  AppAwareState createState() => AppAwareState();
}

class AppAwareState extends ConsumerState<AppAware> {
  OverlaySupportEntry? _snackBarEntry;
  OverlaySupportEntry? _dialogEntry;
  @override
  void initState() {
    super.initState();
    final dialog = sl<DialogService>();
    dialog.stream.listen((event) {
      switch (event.displayType) {
        case DisplayType.dialog:
          _dialogEntry?.dismiss();
          _dialogEntry = showOverlay(
            (context, _) {
              return Material(
                color: Colors.black38,
                child: PlatformAlertDialog(
                  title: event.title,
                  content: Text(
                    event.message,
                    style: Config.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  actions: const [],
                ),
              );
            },
            duration: event.duration,
          );
          HapticFeedback.mediumImpact();
          break;

        case DisplayType.snackbar:
          _snackBarEntry?.dismiss();
          _snackBarEntry = showOverlayNotification(
            (context) {
              return CustomSnackBar(
                title: event.title,
                message: event.message,
                background: event.status == Status.success
                    ? context.colorScheme.primary
                    : context.colorScheme.error,
                onDismiss: _snackBarEntry!.dismiss,
              );
            },
            position: event.position,
            duration: event.duration,
          );
          HapticFeedback.mediumImpact();
          break;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: widget.child,
    );
  }
}
