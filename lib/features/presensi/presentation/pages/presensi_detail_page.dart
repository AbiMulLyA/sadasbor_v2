import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// Model data untuk detail presensi
class PresensiDetailData {
  final String tanggal;
  final bool isSynced; // Status sinkronisasi

  final String datangJam;
  final String datangPosisi;
  final String datangStatus;
  final bool datangTepatWaktu;
  final String datangAlamat;
  final String datangJarak;

  final String pulangJam;
  final String pulangPosisi;
  final String pulangStatus;
  final bool pulangTepatWaktu;
  final String pulangAlamat;
  final String pulangJarak;

  PresensiDetailData({
    required this.tanggal,
    required this.isSynced,
    required this.datangJam,
    required this.datangPosisi,
    required this.datangStatus,
    required this.datangTepatWaktu,
    required this.datangAlamat,
    required this.datangJarak,
    required this.pulangJam,
    required this.pulangPosisi,
    required this.pulangStatus,
    required this.pulangTepatWaktu,
    required this.pulangAlamat,
    required this.pulangJarak,
  });
}

@RoutePage()
class PresensiDetailPage extends HookWidget {
  const PresensiDetailPage({super.key /* Tambahkan parameter jika butuh ID presensi */});

  Widget _buildSyncStatusIndicator(BuildContext context, bool isSynced, VoidCallback onSyncAction) {
    IconData syncIconData;
    Color syncIconColor;
    String statusText;
    Widget? actionButton;

    if (isSynced) {
      syncIconData = Icons.cloud_done_outlined;
      syncIconColor = Colors.green.shade600;
      statusText = "Data telah tersinkronisasi";
    } else {
      syncIconData = Icons.cloud_upload_outlined;
      syncIconColor = Colors.orange.shade700;
      statusText = "Menunggu sinkronisasi ke server";
      actionButton = ElevatedButton(
        onPressed: onSyncAction,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          shape: const CircleBorder(),
        ),
        child: const Icon(Icons.sync, size: 18),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Icon(syncIconData, color: syncIconColor, size: 24),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              statusText,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey[800],
              ),
            ),
          ),
          if (actionButton != null) const SizedBox(width: 8),
          if (actionButton != null) actionButton,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final PresensiDetailData dummyDetail = PresensiDetailData(
      tanggal: "Selasa, 01 Juli 2025",
      isSynced: false,
      datangJam: "08:15:10 WIB",
      datangPosisi: "(-6.200000, 106.816666) map",
      datangStatus: "Terlambat",
      datangTepatWaktu: false,
      datangAlamat: "Jl. Sudirman No.Kav. 45-46, Karet Semanggi, Kecamatan Setiabudi, Kota Jakarta Selatan, DKI Jakarta 12930",
      datangJarak: "75 meter dari kantor",
      pulangJam: "17:05:50 WIB",
      pulangPosisi: "(-6.200123, 106.816789) map",
      pulangStatus: "Sesuai Jadwal",
      pulangTepatWaktu: true,
      pulangAlamat: "Jl. Sudirman No.Kav. 45-46, Karet Semanggi, Kecamatan Setiabudi, Kota Jakarta Selatan, DKI Jakarta 12930",
      pulangJarak: "15 meter dari kantor",
    );

    final PresensiDetailData detail = dummyDetail;

    final dateStyle = TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold);
    final cardTitleStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87);
    final labelStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey[700]);
    final valueStyle = TextStyle(fontSize: 14, color: Colors.black87);
    final colonStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey[700]);

    Widget buildStatusDisplay(String status, bool isTepatWaktu) {
      IconData statusIconData = isTepatWaktu ? Icons.check_circle_outline : Icons.highlight_off;
      Color statusColor = isTepatWaktu ? Colors.green.shade700 : Colors.red.shade700;
      Color backgroundColor = isTepatWaktu ? Colors.green.shade50 : Colors.red.shade50;

      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(statusIconData, color: statusColor, size: 16),
            const SizedBox(width: 6),
            Text(
              status,
              style: TextStyle(
                color: statusColor,
                fontWeight: FontWeight.bold,
                fontSize: 11,
              ),
            ),
          ],
        ),
      );
    }

    Widget buildDetailRow(String label, String value, {Widget? valueWidget}) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 75,
              child: Text(label, style: labelStyle),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Text(":", style: colonStyle),
            ),
            Expanded(
              child: valueWidget ?? Text(value, style: valueStyle),
            ),
          ],
        ),
      );
    }

    Widget buildPresensiCard({
      required String title,
      required String jam,
      required String posisi,
      required String statusText,
      required bool isTepatWaktu,
      required String alamat,
      required String jarak,
    }) {
      Color borderColor = isTepatWaktu ? Colors.green.shade300 : Colors.red.shade300;

      return Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: BorderSide(color: borderColor, width: 1.5),
        ),
        elevation: 1.5,
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: cardTitleStyle),
              const SizedBox(height: 12),
              buildDetailRow("Jam", jam),
              buildDetailRow("Posisi", posisi),
              buildDetailRow("Status", "", valueWidget: buildStatusDisplay(statusText, isTepatWaktu)),
              buildDetailRow("Alamat", alamat),
              buildDetailRow("Jarak", jarak),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Detail Kehadiran",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // _buildSyncStatusIndicator(context, detail.isSynced, () {
            //   print("Tombol Sinkronkan (dari state) ditekan!");
            // }),
            // const SizedBox(height: 10), // Dihapus karena _buildSyncStatusIndicator sudah punya margin-bottom
            // const Text("Contoh Tampilan Jika Sudah Tersinkron:", style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic, color: Colors.grey)),
            _buildSyncStatusIndicator(context, true, () {
              print("Tombol Sinkronkan (contoh synced) ditekan!");
            }),

            const SizedBox(height: 16), // Spasi sebelum tanggal
            Row(
              children: [
                Icon(Icons.calendar_today_outlined, size: 20, color: dateStyle.color),
                const SizedBox(width: 8),
                Text(detail.tanggal, style: dateStyle),
              ],
            ),
            const SizedBox(height: 10), // Spasi sebelum kartu pertama, bisa disesuaikan jika _buildSyncStatusIndicator punya margin atas yang cukup

            buildPresensiCard(
              title: "Datang",
              jam: detail.datangJam,
              posisi: detail.datangPosisi,
              statusText: detail.datangStatus,
              isTepatWaktu: detail.datangTepatWaktu,
              alamat: detail.datangAlamat,
              jarak: detail.datangJarak,
            ),
            buildPresensiCard(
              title: "Pulang",
              jam: detail.pulangJam,
              posisi: detail.pulangPosisi,
              statusText: detail.pulangStatus,
              isTepatWaktu: detail.pulangTepatWaktu,
              alamat: detail.pulangAlamat,
              jarak: detail.pulangJarak,
            ),
          ],
        ),
      ),
    );
  }
}