import 'package:eden_work_sample/core/utils/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformProgressIndicator extends StatelessWidget {
  const PlatformProgressIndicator({super.key, this.height});

  final double? height;

  Widget progress() {
    if (Config.isIOS) {
      return const CupertinoActivityIndicator(radius: 15);
    } else {
      return const CircularProgressIndicator();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Config.y(height ?? 50),
      width: Config.y(height ?? 50),
      child: Center(
        child: progress(),
      ),
    );
  }
}
