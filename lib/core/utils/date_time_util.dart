import 'package:intl/intl.dart';

class IndonesianDateTimeUtil {
  // Nama bulan dalam bahasa Indonesia
  static const List<String> _monthNames = [
    'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
    'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'
  ];

  /// Mengkonversi string tanggal atau DateTime ke format waktu Indonesia
  ///
  /// Parameter:
  /// - [dateInput] bisa berupa String atau DateTime
  /// - [inputFormat] format input jika dateInput berupa String (opsional)
  ///
  /// Contoh penggunaan:
  /// ```dart
  /// String result1 = IndonesianDateTimeUtil.formatPostDate("2025-07-08 10:30:00");
  /// String result2 = IndonesianDateTimeUtil.formatPostDate(DateTime.now());
  /// ```
  static String formatPostDate(dynamic dateInput, {String? inputFormat}) {
    try {
      DateTime targetDate;

      // Konversi input ke DateTime
      if (dateInput is String) {
        if (inputFormat != null) {
          targetDate = DateFormat(inputFormat).parse(dateInput);
        } else {
          // Coba parse dengan format umum
          targetDate = DateTime.tryParse(dateInput) ?? DateTime.now();
        }
      } else if (dateInput is DateTime) {
        targetDate = dateInput;
      } else {
        return 'Format tanggal tidak valid';
      }

      // Dapatkan waktu sekarang dalam timezone Indonesia (WIB)
      final now = DateTime.now();
      final difference = now.difference(targetDate);

      // Kurang dari 1 menit
      if (difference.inMinutes < 1) {
        return 'Baru saja';
      }

      // Kurang dari 1 jam
      if (difference.inHours < 1) {
        final minutes = difference.inMinutes;
        return '$minutes menit yang lalu';
      }

      // Kurang dari 24 jam
      if (difference.inHours < 24) {
        final hours = difference.inHours;
        return '$hours jam yang lalu';
      }

      // Tepat 1 hari (24-48 jam)
      if (difference.inDays == 1) {
        return 'Kemarin';
      }

      // Kurang dari 7 hari
      if (difference.inDays < 7) {
        final days = difference.inDays;
        return '$days hari yang lalu';
      }

      // 7 hari atau lebih - tampilkan tanggal lengkap
      return _formatFullDate(targetDate);

    } catch (e) {
      return 'Format tanggal tidak valid';
    }
  }

  /// Format tanggal lengkap dalam bahasa Indonesia
  static String _formatFullDate(DateTime date) {
    final day = date.day;
    final month = _monthNames[date.month - 1];
    final year = date.year;

    return '$day $month $year';
  }

  /// Utility tambahan untuk mengkonversi berbagai format tanggal
  static String formatWithCustomInput(String dateString, String inputFormat) {
    try {
      final DateTime parsedDate = DateFormat(inputFormat).parse(dateString);
      return formatPostDate(parsedDate);
    } catch (e) {
      return 'Format tanggal tidak valid';
    }
  }

  /// Utility untuk testing - generate contoh tanggal
  static Map<String, String> generateExamples() {
    final now = DateTime.now();

    return {
      'Baru saja': formatPostDate(now.subtract(const Duration(seconds: 30))),
      '15 menit yang lalu': formatPostDate(now.subtract(const Duration(minutes: 15))),
      '2 jam yang lalu': formatPostDate(now.subtract(const Duration(hours: 2))),
      'Kemarin': formatPostDate(now.subtract(const Duration(days: 1))),
      '3 hari yang lalu': formatPostDate(now.subtract(const Duration(days: 3))),
      '1 minggu lalu': formatPostDate(now.subtract(const Duration(days: 7))),
      '1 bulan lalu': formatPostDate(now.subtract(const Duration(days: 30))),
    };
  }
}

// Extension untuk memudahkan penggunaan
extension DateTimeExtension on DateTime {
  String toIndonesianFormat() {
    return IndonesianDateTimeUtil.formatPostDate(this);
  }
}

extension StringExtension on String {
  String toIndonesianDateFormat({String? inputFormat}) {
    return IndonesianDateTimeUtil.formatPostDate(this, inputFormat: inputFormat);
  }
}