import 'dart:ui' as ui;

bool isTablet() {
  final double screenWidth =
      ui.window.physicalSize.width / ui.window.devicePixelRatio;
  final double screenHeight =
      ui.window.physicalSize.height / ui.window.devicePixelRatio;

  final double diagonalSize = 0.5 * (screenWidth + screenHeight);

  return diagonalSize >= 800;
}