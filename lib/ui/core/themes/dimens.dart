import 'package:flutter/material.dart';

abstract final class Dimens {
  const Dimens();

  /// General horizontal padding used to separate UI items
  static const paddingHorizontal = 16.0;

  /// General vertical padding used to separate UI items
  static const paddingVertical = 20.0;

  /// Maximum width for UI elements in Auth screens
  static const maxWidth = 400.0;

  /// Horizontal padding for screen edges
  double get paddingScreenHorizontal;

  /// Vertical padding for screen edges
  double get paddingScreenVertical;

  /// Horizontal symmetric padding for screen edges
  EdgeInsets get edgeInsetsScreenHorizontal => EdgeInsets.symmetric(
        horizontal: paddingScreenHorizontal,
      );

  /// Symmetric padding for screen edges
  EdgeInsets get edgeInsetsScreenSymmetric => EdgeInsets.symmetric(
        horizontal: paddingScreenHorizontal,
        vertical: paddingScreenVertical,
      );

  static const Dimens desktop = _DimensDesktop();
  static const Dimens mobile = _DimensMobile();

  /// Get dimensions definition based on screen size
  factory Dimens.of(BuildContext context) => switch (MediaQuery.sizeOf(
        context,
      ).width) {
        > 600 && < 840 => desktop,
        _ => mobile,
      };
}

/// Mobile dimensions
final class _DimensMobile extends Dimens {
  @override
  final double paddingScreenHorizontal = Dimens.paddingHorizontal;

  @override
  final double paddingScreenVertical = Dimens.paddingVertical;

  const _DimensMobile();
}

/// Desktop/Web dimensions
final class _DimensDesktop extends Dimens {
  @override
  final double paddingScreenHorizontal = 100.0;

  @override
  final double paddingScreenVertical = 64.0;

  const _DimensDesktop();
}
