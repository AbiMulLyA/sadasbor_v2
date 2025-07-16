import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shimmer/shimmer.dart';

class HomeAnnoucementSliderShimmerView extends HookWidget {
  const HomeAnnoucementSliderShimmerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useMemoized(() => CarouselSliderController());
    final current = useState(0);

    final shimmerBase = Colors.grey.shade300;
    final shimmerHighlight = Colors.grey.shade100;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Shimmer.fromColors(
              baseColor: shimmerBase,
              highlightColor: shimmerHighlight,
              child: CarouselSlider.builder(
                carouselController: controller,
                itemCount: 3,
                itemBuilder: (_, __, ___) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.07),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                ),
                options: CarouselOptions(
                  height: 180,
                  viewportFraction: 0.85,
                  enableInfiniteScroll: false,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) => current.value = index,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Shimmer.fromColors(
            baseColor: shimmerBase,
            highlightColor: shimmerHighlight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                final isActive = current.value == index;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: isActive ? 24.0 : 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
