import 'package:flutter/material.dart';

import '../../../config/theme/theme.dart';

class SpaceComponentHeight extends StatelessWidget {
  const SpaceComponentHeight({super.key, this.child, this.height});

  final Widget? child;
  final double? height;

  @override
  Widget build(BuildContext context) =>
      SizedBox(height: height ?? kDefTopBottom, child: child);
}

class SpaceComponentWidth extends StatelessWidget {
  const SpaceComponentWidth({super.key, this.child, this.width});

  final Widget? child;
  final double? width;

  @override
  Widget build(BuildContext context) =>
      SizedBox(width: width ?? kDefLeftRight, child: child);
}
