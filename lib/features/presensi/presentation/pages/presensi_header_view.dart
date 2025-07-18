import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'dart:async';

class PresensiHeaderView extends HookWidget {
  const PresensiHeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    const double kDefLeftRight = 16.0;
    const String imageUrl =
        'https://fastly.picsum.photos/id/1/5000/3333.jpg?hmac=Asv2DU3rA_5D1xSe22xZK47WEAN0wjWeFOhzd13ujW4';

    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 500),
    );

    // Realtime clock state
    final currentTime = useState<DateTime>(DateTime.now());

    // Timer untuk update waktu realtime
    useEffect(() {
      final timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
        currentTime.value = DateTime.now();
      });

      return () => timer.cancel();
    }, []);

    useEffect(() {
      animationController.forward();
      return null;
    }, []);

    return Container(
      width: MediaQuery.of(context).size.width,
      // Increased top margin untuk mengurangi mepet
      margin: const EdgeInsets.fromLTRB(kDefLeftRight, 24, kDefLeftRight, 16),
      child: FadeTransition(
        opacity: animationController,
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -0.2),
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: animationController,
            curve: Curves.easeOutBack,
          )),
          child: Column(
            children: [
              // Top Section - Greeting and DateTime
              _buildTopSection(context, currentTime.value),

              const SizedBox(height: 12),

              // Main Card - Avatar, Name, NIP, Position
              _buildMainCard(context, imageUrl),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopSection(BuildContext context, DateTime currentTime) {
    // Format tanggal Indonesia
    final List<String> dayNames = [
      'Minggu', 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu'
    ];
    final List<String> monthNames = [
      'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
      'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'
    ];

    final dayName = dayNames[currentTime.weekday % 7];
    final monthName = monthNames[currentTime.month - 1];
    final dateString = '$dayName, ${currentTime.day} $monthName';
    final timeString = '${currentTime.hour.toString().padLeft(2, '0')}:${currentTime.minute.toString().padLeft(2, '0')}:${currentTime.second.toString().padLeft(2, '0')}';

    return Container(
      // Added padding untuk spacing yang lebih baik
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Greeting
          Text(
            'Selamat Datang,',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),

          // Compact DateTime Card - Enhanced
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFFFFF0BB),
                  const Color(0xFFFFF0BB).withOpacity(0.9),
                ],
              ),
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFFFF0BB).withOpacity(0.4),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                  spreadRadius: 0,
                ),
              ],
              border: Border.all(
                color: const Color(0xFFFFF0BB).withOpacity(0.6),
                width: 0.5,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.calendar_today_rounded,
                  size: 14,
                  color: Colors.brown,
                ),
                const SizedBox(width: 6),
                Text(
                  dateString,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.brown,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 1,
                  height: 12,
                  color: Colors.brown.withOpacity(0.4),
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.access_time_rounded,
                  size: 14,
                  color: Colors.brown,
                ),
                const SizedBox(width: 4),
                Text(
                  timeString,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.brown,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'monospace',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainCard(BuildContext context, String imageUrl) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          // Main shadow
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 8),
            spreadRadius: 0,
          ),
          // Secondary shadow for depth
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
            spreadRadius: 0,
          ),
          // Subtle top highlight
          BoxShadow(
            color: Colors.white.withOpacity(0.8),
            blurRadius: 1,
            offset: const Offset(0, -1),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Card(
        elevation: 0, // Remove default elevation since we're using custom shadow
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                const Color(0xFFFFF0BB).withOpacity(0.2),
              ],
            ),
            // Add subtle border for more definition
            border: Border.all(
              color: const Color(0xFFFFF0BB).withOpacity(0.3),
              width: 0.5,
            ),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {
                print('Header tapped - Open profile');
              },
              // Add splash color that matches theme
              splashColor: const Color(0xFFFFF0BB).withOpacity(0.3),
              highlightColor: const Color(0xFFFFF0BB).withOpacity(0.1),
              child: Container(
                padding: const EdgeInsets.all(18), // Slightly more padding
                child: Row(
                  children: [
                    // Avatar with Status
                    _buildCompactAvatar(context, imageUrl),

                    const SizedBox(width: 16),

                    // User Info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Name Section
                          _buildInfoRow(
                            context,
                            icon: Icons.person_outline_rounded,
                            iconColor: Colors.green.shade600,
                            iconBgColor: Colors.green.shade50,
                            label: 'Nama Lengkap',
                            value: 'Ahmad Abi Mulya, S.Kom.',
                          ),

                          const SizedBox(height: 12),

                          // NIP Section
                          _buildInfoRow(
                            context,
                            icon: Icons.badge_outlined,
                            iconColor: Colors.blue.shade600,
                            iconBgColor: Colors.blue.shade50,
                            label: 'NIP',
                            value: '200109102025051002',
                          ),

                          const SizedBox(height: 12),

                          // Position Section
                          _buildInfoRow(
                            context,
                            icon: Icons.work_outline_rounded,
                            iconColor: Colors.orange.shade600,
                            iconBgColor: Colors.orange.shade50,
                            label: 'Jabatan',
                            value: 'Pranata Komputer Ahli Pertama',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCompactAvatar(BuildContext context, String imageUrl) {
    return Stack(
      children: [
        Container(
          width: 64, // Slightly larger
          height: 64,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              // Main shadow
              BoxShadow(
                color: const Color(0xFFFFF0BB).withOpacity(0.4),
                blurRadius: 12,
                offset: const Offset(0, 6),
                spreadRadius: 0,
              ),
              // Secondary shadow for depth
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 4),
                spreadRadius: 0,
              ),
            ],
            border: Border.all(
              color: const Color(0xFFFFF0BB),
              width: 3, // Thicker border
            ),
          ),
          child: ClipOval(
            child: imageUrl.isNotEmpty
                ? CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFFFF0BB),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.brown.shade600,
                    ),
                  ),
                ),
              ),
              errorWidget: (context, url, error) {
                print("CachedNetworkImage error: $error, URL: $url");
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.person,
                    color: Colors.grey[600],
                    size: 32,
                  ),
                );
              },
            )
                : Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.person,
                color: Colors.grey[600],
                size: 32,
              ),
            ),
          ),
        ),

        // Status Indicator - Enhanced
        Positioned(
          bottom: 2,
          right: 2,
          child: Container(
            width: 18, // Slightly larger
            height: 18,
            decoration: BoxDecoration(
              color: Colors.green.shade600,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 2.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.green.withOpacity(0.3),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Icon(
              Icons.check,
              color: Colors.white,
              size: 11,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(
      BuildContext context, {
        required IconData icon,
        required Color iconColor,
        required Color iconBgColor,
        required String label,
        required String value,
      }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon Container - Enhanced
        Container(
          padding: const EdgeInsets.all(8), // Slightly more padding
          decoration: BoxDecoration(
            color: iconBgColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: iconColor.withOpacity(0.15),
                blurRadius: 6,
                offset: const Offset(0, 2),
                spreadRadius: 0,
              ),
            ],
            border: Border.all(
              color: iconColor.withOpacity(0.1),
              width: 0.5,
            ),
          ),
          child: Icon(
            icon,
            color: iconColor,
            size: 18, // Slightly larger icon
          ),
        ),

        const SizedBox(width: 12),

        // Info Column
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12, // Standardized label size
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14, // Standardized value size
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w600,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}