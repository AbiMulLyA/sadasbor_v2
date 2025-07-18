import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sadasbor_v2/config/router/router.dart';

import '../../../../core/components/card/presensi_card_component.dart';

class PresensiHistoryView extends HookWidget {
  const PresensiHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    // Updated dummy data for list
    final List<HistoryItem> historyList = [
      HistoryItem(
        jamDatang: "07:28:23 WIB",
        tanggal: "Senin, 30 Juni 2025",
        statusDatang: "Tepat Waktu",
        tepatWaktuDatang: true,
        jamPulang: "15:30:23 WIB",
        statusPulang: "Sesuai Jadwal",
        tepatWaktuPulang: true,
      ),
      HistoryItem(
        jamDatang: "08:15:10 WIB",
        tanggal: "Selasa, 01 Juli 2025",
        statusDatang: "Terlambat",
        tepatWaktuDatang: false,
        jamPulang: "17:05:50 WIB",
        statusPulang: "Lembur",
        // Example of another status for pulang
        tepatWaktuPulang: true, // Assuming lembur is also "good" or "green"
      ),
      HistoryItem(
        jamDatang: "07:55:00 WIB",
        tanggal: "Rabu, 02 Juli 2025",
        statusDatang: "Tepat Waktu",
        tepatWaktuDatang: true,
        jamPulang: "14:00:00 WIB",
        statusPulang: "Pulang Cepat",
        tepatWaktuPulang: false,
      ),
      HistoryItem(
        jamDatang: "08:15:10 WIB",
        tanggal: "Selasa, 01 Juli 2025",
        statusDatang: "Terlambat",
        tepatWaktuDatang: false,
        jamPulang: "17:05:50 WIB",
        statusPulang: "Lembur",
        // Example of another status for pulang
        tepatWaktuPulang: true, // Assuming lembur is also "good" or "green"
      ),
      HistoryItem(
        jamDatang: "07:55:00 WIB",
        tanggal: "Rabu, 02 Juli 2025",
        statusDatang: "Tepat Waktu",
        tepatWaktuDatang: true,
        jamPulang: "14:00:00 WIB",
        statusPulang: "Pulang Cepat",
        tepatWaktuPulang: false,
      ),
    ];
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                "Riwayat Presensi",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              InkWell(
                onTap: () {
                  print("Lihat Semua diklik");
                  context.pushRoute(PresensiAllPresensiRoute());
                },
                child: Text(
                  "Lihat Semua",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ListView.separated(
            itemCount: historyList.length > 5 ? 5 : historyList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final item = historyList[index];
              return PresensiCardComponent(
                item: item,
                onTap: () {
                  context.pushRoute(PresensiDetailRoute());
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
