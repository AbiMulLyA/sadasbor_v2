import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
class DummyAccountPage extends HookWidget {
  const DummyAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Data untuk grafik populasi kecamatan
    final populationData = useMemoized(() => [
      ChartData('Kec. Cilandak', 85000, const Color(0xFF3B82F6)),
      ChartData('Kec. Kebayoran', 92000, const Color(0xFF10B981)),
      ChartData('Kec. Menteng', 78000, const Color(0xFF8B5CF6)),
      ChartData('Kec. Cempaka', 65000, const Color(0xFFF59E0B)),
      ChartData('Kec. Sawah Besar', 71000, const Color(0xFFEF4444)),
      ChartData('Kec. Tanah Abang', 88000, const Color(0xFF06B6D4)),
      ChartData('Kec. Gambir', 54000, const Color(0xFF84CC16)),
      ChartData('Kec. Kemayoran', 79000, const Color(0xFFEC4899)),
      ChartData('Kec. Senen', 67000, const Color(0xFF6366F1)),
      ChartData('Kec. Cikini', 58000, const Color(0xFF14B8A6)),
    ]);

    // Data untuk grafik penduduk miskin
    final povertyData = useMemoized(() => [
      ChartData('Kec. Cilandak', 8500, const Color(0xFF3B82F6)),
      ChartData('Kec. Kebayoran', 7200, const Color(0xFF10B981)),
      ChartData('Kec. Menteng', 5800, const Color(0xFF8B5CF6)),
      ChartData('Kec. Cempaka', 9200, const Color(0xFFF59E0B)),
      ChartData('Kec. Sawah Besar', 8800, const Color(0xFFEF4444)),
      ChartData('Kec. Tanah Abang', 6900, const Color(0xFF06B6D4)),
      ChartData('Kec. Gambir', 7500, const Color(0xFF84CC16)),
      ChartData('Kec. Kemayoran', 8100, const Color(0xFFEC4899)),
      ChartData('Kec. Senen', 9500, const Color(0xFF6366F1)),
      ChartData('Kec. Cikini', 6300, const Color(0xFF14B8A6)),
    ]);

    // Data untuk grafik jalan rusak
    final roadDamageData = useMemoized(() => [
      ChartData('Kec. Cilandak', 12.5, const Color(0xFF3B82F6)),
      ChartData('Kec. Kebayoran', 8.2, const Color(0xFF10B981)),
      ChartData('Kec. Menteng', 15.8, const Color(0xFF8B5CF6)),
      ChartData('Kec. Cempaka', 22.3, const Color(0xFFF59E0B)),
      ChartData('Kec. Sawah Besar', 18.7, const Color(0xFFEF4444)),
      ChartData('Kec. Tanah Abang', 9.4, const Color(0xFF06B6D4)),
      ChartData('Kec. Gambir', 14.1, const Color(0xFF84CC16)),
      ChartData('Kec. Kemayoran', 11.8, const Color(0xFFEC4899)),
      ChartData('Kec. Senen', 19.6, const Color(0xFF6366F1)),
      ChartData('Kec. Cikini', 16.2, const Color(0xFF14B8A6)),
    ]);

    // Data untuk grafik bencana
    final disasterData = useMemoized(() => [
      ChartData('Banjir', 45, const Color(0xFF3B82F6)),
      ChartData('Kebakaran', 28, const Color(0xFFEF4444)),
      ChartData('Tanah Longsor', 12, const Color(0xFF8B5CF6)),
      ChartData('Gempa Bumi', 8, const Color(0xFFF59E0B)),
      ChartData('Angin Puting Beliung', 15, const Color(0xFF10B981)),
      ChartData('Kekeringan', 6, const Color(0xFF84CC16)),
    ]);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text(
          'DummyAccount Pemerintahan',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: const Color(0xFF1E40AF),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1E40AF), Color(0xFF3B82F6)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Laporan Data Kecamatan',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Visualisasi data pemerintahan terkini',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Chart 1: Population Data
            _buildChartCard(
              title: 'Jumlah Penduduk per Kecamatan',
              subtitle: 'Total penduduk di 10 kecamatan',
              icon: Icons.people,
              child: SizedBox(
                height: 300,
                child: SfCartesianChart(
                  plotAreaBorderWidth: 0,
                  tooltipBehavior: TooltipBehavior(
                    enable: true,
                    format: 'point.x: point.y jiwa',
                    header: 'Jumlah Penduduk',
                    canShowMarker: false,
                    textStyle: const TextStyle(fontSize: 12),
                  ),
                  primaryXAxis: const CategoryAxis(
                    labelStyle: TextStyle(fontSize: 10),
                    labelRotation: -45,
                  ),
                  primaryYAxis: NumericAxis(
                    numberFormat: NumberFormat('#,##0'),
                    labelStyle: const TextStyle(fontSize: 10),
                  ),
                  series: <CartesianSeries<ChartData, String>>[
                    ColumnSeries<ChartData, String>(
                      dataSource: populationData,
                      xValueMapper: (ChartData data, _) => data.category,
                      yValueMapper: (ChartData data, _) => data.value,
                      pointColorMapper: (ChartData data, _) => data.color,
                      enableTooltip: true,
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                      dataLabelSettings: const DataLabelSettings(
                        isVisible: true,
                        textStyle: TextStyle(fontSize: 9),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Chart 2: Poverty Data
            _buildChartCard(
              title: 'Penduduk Miskin per Kecamatan',
              subtitle: 'Jumlah penduduk di bawah garis kemiskinan',
              icon: Icons.help_outline,
              child: SizedBox(
                height: 300,
                child: SfCartesianChart(
                  plotAreaBorderWidth: 0,
                  tooltipBehavior: TooltipBehavior(
                    enable: true,
                    format: 'point.x: point.y jiwa',
                    header: 'Penduduk Miskin',
                    canShowMarker: false,
                    textStyle: const TextStyle(fontSize: 12),
                  ),
                  primaryXAxis: const CategoryAxis(
                    labelStyle: TextStyle(fontSize: 10),
                    labelRotation: -45,
                  ),
                  primaryYAxis: NumericAxis(
                    numberFormat: NumberFormat('#,##0'),
                    labelStyle: const TextStyle(fontSize: 10),
                  ),
                  series: <CartesianSeries<ChartData, String>>[
                    BarSeries<ChartData, String>(
                      dataSource: povertyData,
                      xValueMapper: (ChartData data, _) => data.category,
                      yValueMapper: (ChartData data, _) => data.value,
                      pointColorMapper: (ChartData data, _) => data.color,
                      enableTooltip: true,
                      borderRadius: const BorderRadius.horizontal(right: Radius.circular(4)),
                      dataLabelSettings: const DataLabelSettings(
                        isVisible: true,
                        textStyle: TextStyle(fontSize: 9),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Chart 3: Road Damage Data
            _buildChartCard(
              title: 'Jalan Rusak per Kecamatan (KM)',
              subtitle: 'Panjang jalan rusak dalam kilometer',
              icon: Icons.add_road,
              child: SizedBox(
                height: 300,
                child: SfCartesianChart(
                  plotAreaBorderWidth: 0,
                  tooltipBehavior: TooltipBehavior(
                    enable: true,
                    format: 'point.x: point.y km',
                    header: 'Jalan Rusak',
                    canShowMarker: false,
                    textStyle: const TextStyle(fontSize: 12),
                  ),
                  primaryXAxis: const CategoryAxis(
                    labelStyle: TextStyle(fontSize: 10),
                    labelRotation: -45,
                  ),
                  primaryYAxis: NumericAxis(
                    numberFormat: NumberFormat('#,##0.0'),
                    labelStyle: const TextStyle(fontSize: 10),
                  ),
                  series: <CartesianSeries<ChartData, String>>[
                    LineSeries<ChartData, String>(
                      dataSource: roadDamageData,
                      xValueMapper: (ChartData data, _) => data.category,
                      yValueMapper: (ChartData data, _) => data.value,
                      color: const Color(0xFFEF4444),
                      width: 3,
                      enableTooltip: true,
                      markerSettings: const MarkerSettings(
                        isVisible: true,
                        height: 6,
                        width: 6,
                        color: Color(0xFFEF4444),
                        borderColor: Colors.white,
                        borderWidth: 2,
                      ),
                      dataLabelSettings: const DataLabelSettings(
                        isVisible: true,
                        textStyle: TextStyle(fontSize: 9),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Chart 4: Disaster Data
            _buildChartCard(
              title: 'Jumlah Bencana per Kategori',
              subtitle: 'Total kejadian bencana berdasarkan jenis',
              icon: Icons.warning,
              child: SizedBox(
                height: 300,
                child: SfCircularChart(
                  tooltipBehavior: TooltipBehavior(
                    enable: true,
                    format: 'point.x: point.y kejadian',
                    header: 'Bencana',
                    textStyle: const TextStyle(fontSize: 12),
                  ),
                  legend: Legend(
                    isVisible: true,
                    position: LegendPosition.bottom,
                    textStyle: const TextStyle(fontSize: 10),
                  ),
                  series: <CircularSeries<ChartData, String>>[
                    DoughnutSeries<ChartData, String>(
                      dataSource: disasterData,
                      xValueMapper: (ChartData data, _) => data.category,
                      yValueMapper: (ChartData data, _) => data.value,
                      pointColorMapper: (ChartData data, _) => data.color,
                      innerRadius: '60%',
                      enableTooltip: true,
                      dataLabelSettings: const DataLabelSettings(
                        isVisible: true,
                        labelPosition: ChartDataLabelPosition.outside,
                        textStyle: TextStyle(fontSize: 10),
                      ),
                      dataLabelMapper: (ChartData data, _) => '${data.value}',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildChartCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Widget child,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF3B82F6).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: const Color(0xFF3B82F6),
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1F2937),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF6B7280),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }
}

class ChartData {
  final String category;
  final double value;
  final Color color;

  ChartData(this.category, this.value, this.color);
}