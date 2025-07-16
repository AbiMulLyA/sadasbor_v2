import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:sadasbor_v2/features/dashboard/domain/entities/posts/dashboard_posts_entity.dart';

class HomeAnnouncementSliderView extends HookWidget {
  final List<DashboardPostsEntity> announcements;
  final Function(DashboardPostsEntity)? onSelengkapnyaTap;

  const HomeAnnouncementSliderView({
    Key? key,
    required this.announcements,
    this.onSelengkapnyaTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(0);
    final controller = useMemoized(() => CarouselSliderController());

    if (announcements.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          // Carousel Slider
          CarouselSlider.builder(
            carouselController: controller,
            itemCount: announcements.length,
            itemBuilder: (context, index, realIndex) {
              final announcement = announcements[index];
              return _buildSliderCard(announcement);
            },
            options: CarouselOptions(
              height: 180,
              aspectRatio: 16/9,
              viewportFraction: 0.85,
              initialPage: 0,
              enableInfiniteScroll: false,
              reverse: false,
              autoPlay: announcements.length > 1,
              autoPlayInterval: const Duration(seconds: 5),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.2,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                currentIndex.value = index;
              },
            ),
          ),

          // Dots Indicator (hanya tampil jika ada lebih dari 1 item)
          if (announcements.length > 1) ...[
            const SizedBox(height: 12),
            _buildDotsIndicator(currentIndex.value),
          ],
        ],
      ),
    );
  }

  Widget _buildSliderCard(DashboardPostsEntity announcement) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background Image
            CachedNetworkImage(
              imageUrl: announcement.featureImage ?? '',
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                color: Colors.grey[300],
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                color: Colors.grey[300],
                child: const Center(
                  child: Icon(
                    Icons.error_outline,
                    size: 40,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),

            // Dark overlay for better text readability
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.1),
                    Colors.black.withOpacity(0.6),
                  ],
                ),
              ),
            ),

            // Content Overlay
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Title
                    Text(
                      announcement.postTitle ?? 'Untitled',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            offset: Offset(0, 1),
                            blurRadius: 3,
                            color: Colors.black54,
                          ),
                        ],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 12),

                    // Selengkapnya Button
                    ElevatedButton(
                      onPressed: () {
                        if (onSelengkapnyaTap != null) {
                          onSelengkapnyaTap!(announcement);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black87,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 2,
                        minimumSize: const Size(0, 32),
                      ),
                      child: const Text(
                        'Selengkapnya',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDotsIndicator(int currentIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: announcements.asMap().entries.map((entry) {
        int index = entry.key;
        return Container(
          width: currentIndex == index ? 24 : 8,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: currentIndex == index
                ? Colors.blue
                : Colors.grey.withOpacity(0.5),
          ),
        );
      }).toList(),
    );
  }
}
// Usage example - akan menggunakan data dari cubit
// HomeAnnouncementSliderView(
//   announcements: context.read<DashboardPostsCubit>().announcements,
//   onSelengkapnyaTap: (announcement) {
//     print('Selengkapnya tapped for: ${announcement.postTitle}');
//     // Handle navigation atau action lainnya
//   },
// );