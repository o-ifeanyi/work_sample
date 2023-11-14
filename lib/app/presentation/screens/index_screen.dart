import 'package:eden_work_sample/app/presentation/provider/auth_provider.dart';
import 'package:eden_work_sample/app/presentation/provider/socket_provider.dart';
import 'package:eden_work_sample/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class IndexScreen extends ConsumerStatefulWidget {
  const IndexScreen({
    super.key,
    required this.navigationShell,
  });
  final StatefulNavigationShell navigationShell;

  @override
  ConsumerState<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends ConsumerState<IndexScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final user = ref.read(authProvider).user!;
      ref.read(socketProvider.notifier).connectoSocket(user.uid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: widget.navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.navigationShell.currentIndex,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        items: [
          ...kNavItems.map(
            (e) {
              return BottomNavigationBarItem(
                label: e['title'],
                icon: e['inactice'],
                activeIcon: e['icon'],
              );
            },
          )
        ],
        onTap: (index) => widget.navigationShell.goBranch(
          index,
          initialLocation: index == widget.navigationShell.currentIndex,
        ),
      ),
    );
  }
}
