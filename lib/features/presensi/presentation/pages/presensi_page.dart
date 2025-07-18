import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sadasbor_v2/config/theme/theme.dart';
import 'package:sadasbor_v2/features/presensi/presentation/pages/presensi_header_view.dart';
import 'package:sadasbor_v2/features/presensi/presentation/pages/presensi_history_view.dart';
import 'package:sadasbor_v2/features/presensi/presentation/pages/presensi_in_out_view.dart';

class PresensiPage extends HookWidget {
  const PresensiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Realtime clock state
    final currentTime = useState<DateTime>(DateTime.now());

    // Timer untuk update waktu realtime
    useEffect(() {
      final timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
        currentTime.value = DateTime.now();
      });

      return () => timer.cancel();
    }, []);

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 215,
              pinned: true,
              floating: false,
              snap: false,
              elevation: 0,
              backgroundColor: Colors.transparent,
              flexibleSpace: FlexibleSpaceBar(
                background: const PresensiHeaderView(),
                collapseMode: CollapseMode.parallax,
              ),
              // Custom leading dan actions jika diperlukan
              // leading: Container(), // Kosongkan jika tidak perlu back button
              automaticallyImplyLeading: false,
            ),
          ];
        },
        body: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF9FCFF),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Column(
              children: [
                // Date Time Container (menggantikan drag indicator)
                Container(
                  margin: EdgeInsets.symmetric(vertical: kDefLeftRight),
                  child: _buildDateTimeContainer(currentTime.value),
                ),
                PresensiInOutView(),
                // Content yang bisa di-scroll
                const Expanded(
                  child: SingleChildScrollView(
                    physics: ClampingScrollPhysics(),
                    child: Column(
                      children: [
                        PresensiHistoryView(),
                        SizedBox(height: 20), // Extra space di bottom
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDateTimeContainer(DateTime currentTime) {
    final List<String> dayNames = [
      'Minggu', 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu',
    ];
    final List<String> monthNames = [
      'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
      'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember',
    ];

    final dayName = dayNames[currentTime.weekday % 7];
    final monthName = monthNames[currentTime.month - 1];
    final dateString = '$dayName, ${currentTime.day} $monthName ${currentTime.year}';
    final timeString = '${currentTime.hour.toString().padLeft(2, '0')}:${currentTime.minute.toString().padLeft(2, '0')}:${currentTime.second.toString().padLeft(2, '0')}';

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFFE8F5E8),
            const Color(0xFFE8F5E8).withOpacity(0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF4CAF50).withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 4,
            offset: const Offset(0, 1),
            spreadRadius: 0,
          ),
        ],
        border: Border.all(
          color: const Color(0xFF4CAF50).withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Icon(
                  Icons.calendar_today_rounded,
                  size: 16,
                  color: const Color(0xFF2E7D32), // Dark green for contrast
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    dateString,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF2E7D32),
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 1,
            height: 16,
            margin: const EdgeInsets.symmetric(horizontal: 12),
            color: const Color(0xFF2E7D32).withOpacity(0.3),
          ),
          Row(
            children: [
              Icon(
                Icons.access_time_rounded,
                size: 16,
                color: const Color(0xFF2E7D32),
              ),
              const SizedBox(width: 6),
              Text(
                timeString,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF2E7D32),
                  fontWeight: FontWeight.w700,
                  fontFamily: 'monospace',
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}