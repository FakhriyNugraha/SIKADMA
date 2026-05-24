import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Scaffold mobile-first: body dibatasi lebar phone (~480 px) dan di-tengah,
/// sehingga saat di-debug di Chrome desktop tampilannya tetap mirip HP.
class MobileScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Color backgroundColor;
  final double maxWidth;
  final bool centerOnWide;

  const MobileScaffold({
    super.key,
    this.appBar,
    required this.body,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.backgroundColor = AppColors.softGray,
    this.maxWidth = 480,
    this.centerOnWide = true,
  });

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.of(context).size.width > maxWidth;
    return Scaffold(
      backgroundColor:
          wide && centerOnWide ? const Color(0xFFE4E8F0) : backgroundColor,
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: ClipRect(
            child: Scaffold(
              backgroundColor: backgroundColor,
              appBar: appBar,
              body: body,
              floatingActionButton: floatingActionButton,
              floatingActionButtonLocation: floatingActionButtonLocation,
            ),
          ),
        ),
      ),
    );
  }
}
