import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeArticleShimmerView extends StatelessWidget {
  final int itemCount;

  const HomeArticleShimmerView({
    super.key,
    this.itemCount = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        itemCount,
            (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Row(
                  children: [
                    // Image shimmer - Di sebelah kiri
                    Container(
                      height: 100,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),

                    const SizedBox(width: 16),

                    // Content shimmer - Di sebelah kanan
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Time shimmer
                          Row(
                            children: [
                              Container(
                                height: 16,
                                width: 16,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              const SizedBox(width: 4),
                              Container(
                                height: 12,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 8),

                          // Title shimmer - 2 lines
                          Container(
                            height: 14,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            height: 14,
                            width: MediaQuery.of(context).size.width * 0.6,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),

                          const SizedBox(height: 8),

                          // Category and Author shimmer
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Category shimmer
                              Container(
                                height: 20,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),

                              // Author shimmer
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    height: 14,
                                    width: 14,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Container(
                                    height: 10,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
