import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sadasbor_v2/features/presensi/presentation/pages/presensi_header_view.dart';
import 'package:sadasbor_v2/features/presensi/presentation/pages/presensi_in_out_view.dart';


class PresensiPage extends HookWidget {
  const PresensiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [PresensiHeaderView(), PresensiInOutView()]),
    );
  }
}
