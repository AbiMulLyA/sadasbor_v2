import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sadasbor_v2/features/dashboard/presentation/bloc/dashboard/dashboard_page_cubit.dart';
import 'package:sadasbor_v2/features/account/presentation/pages/account_page.dart';
import 'package:sadasbor_v2/features/presensi/presentation/pages/presensi_page.dart';

import '../../../../config/injector/injector.dart';
import '../bloc/posts/dashboard_posts_cubit.dart';
import 'home/home_page.dart';

class SmartDashboardPage extends HookWidget {
  const SmartDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<DashboardPageCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<DashboardPostsCubit>(),
        ),
      ],
      child: const DashboardPageView(),
    );
  }
}

class DashboardPageView extends HookWidget {
  const DashboardPageView({super.key});

  @override
  Widget build(BuildContext context) {
    // Konfigurasi pages dengan hybrid strategy
    final pageConfigs = useMemoized(() => [
      PageConfig(
        builder: () => const HomePage(),
        preserveState: true,  // ✅ HomePage perlu preserve state (pagination)
        label: 'Home',
        icon: Icons.home_filled,
        appBarTitle: 'Sadasbor',
      ),
      PageConfig(
        builder: () => const PresensiPage(),
        preserveState: false, // ❌ Rebuild untuk data terbaru
        label: 'Presensi',
        icon: Icons.fingerprint,
        appBarTitle: 'Presensi',
      ),
      PageConfig(
        builder: () => const AccountPage(),
        preserveState: false, // ❌ Rebuild untuk data terbaru
        label: 'Akun',
        icon: Icons.person_outline,
        appBarTitle: 'Akun',
      ),
    ], []);

    return BlocBuilder<DashboardPageCubit, int>(
      builder: (context, selectedIndex) {
        return HybridNavigationWrapper(
          selectedIndex: selectedIndex,
          pageConfigs: pageConfigs,
          onIndexChanged: (index) {
            context.read<DashboardPageCubit>().changeNav(index);
          },
        );
      },
    );
  }
}

// Page configuration
class PageConfig {
  final Widget Function() builder;
  final bool preserveState;
  final String label;
  final IconData icon;
  final String appBarTitle;

  PageConfig({
    required this.builder,
    required this.preserveState,
    required this.label,
    required this.icon,
    required this.appBarTitle,
  });
}

// Hybrid Navigation Wrapper dengan animasi
class HybridNavigationWrapper extends StatefulWidget {
  final int selectedIndex;
  final List<PageConfig> pageConfigs;
  final Function(int) onIndexChanged;

  const HybridNavigationWrapper({
    super.key,
    required this.selectedIndex,
    required this.pageConfigs,
    required this.onIndexChanged,
  });

  @override
  State<HybridNavigationWrapper> createState() => _HybridNavigationWrapperState();
}

class _HybridNavigationWrapperState extends State<HybridNavigationWrapper>
    with TickerProviderStateMixin {
  final Map<int, Widget> _cachedPages = {};
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();

    // Setup animation controller
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.2, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCubic,
    ));

    // Pre-build pages yang perlu preserve state
    _initializeCachedPages();

    // Start dengan animasi awal
    _animationController.forward();
  }

  void _initializeCachedPages() {
    for (int i = 0; i < widget.pageConfigs.length; i++) {
      final config = widget.pageConfigs[i];
      if (config.preserveState) {
        _cachedPages[i] = config.builder();
      }
    }
  }

  @override
  void didUpdateWidget(HybridNavigationWrapper oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.selectedIndex != widget.selectedIndex && !_isAnimating) {
      _animatePageTransition(oldWidget.selectedIndex, widget.selectedIndex);
    }
  }

  void _animatePageTransition(int fromIndex, int toIndex) {
    setState(() {
      _isAnimating = true;
    });

    // Determine slide direction berdasarkan arah navigasi
    final isMovingRight = toIndex > fromIndex;
    _slideAnimation = Tween<Offset>(
      begin: Offset(isMovingRight ? 0.3 : -0.3, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCubic,
    ));

    // Reset dan animate
    _animationController.reset();
    _animationController.forward().then((_) {
      if (mounted) {
        setState(() {
          _isAnimating = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget _getPage(int index) {
    final config = widget.pageConfigs[index];

    if (config.preserveState) {
      // Return cached page untuk preserve state
      return _cachedPages[index] ??= config.builder();
    } else {
      // Always rebuild untuk non-preserved pages
      return config.builder();
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentConfig = widget.pageConfigs[widget.selectedIndex];

    return Scaffold(
      appBar: AppBar(
        title: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, -0.3),
                end: Offset.zero,
              ).animate(animation),
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            );
          },
          child: Text(
            currentConfig.appBarTitle,
            key: ValueKey(currentConfig.appBarTitle),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black87,
      ),

      body: _buildAnimatedBody(),

      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  Widget _buildAnimatedBody() {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return SlideTransition(
          position: _slideAnimation,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: _getPage(widget.selectedIndex),
          ),
        );
      },
    );
  }

  Widget _buildBottomNavigation() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        iconSize: 24,
        elevation: 0,
        currentIndex: widget.selectedIndex,
        enableFeedback: true,
        selectedItemColor: Colors.blue[700],
        unselectedItemColor: Colors.grey[600],
        backgroundColor: Colors.transparent,
        onTap: widget.onIndexChanged,
        items: widget.pageConfigs.asMap().entries.map((entry) {
          final index = entry.key;
          final config = entry.value;
          final isSelected = index == widget.selectedIndex;
          final isCached = _cachedPages.containsKey(index);

          return BottomNavigationBarItem(
            icon: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: EdgeInsets.only(
                top: isSelected ? 2 : 5,
              ),
              child: Stack(
                children: [
                  Icon(
                    config.icon,
                    size: 24,
                  ),
                  // Cache indicator (green dot untuk cached pages)
                  if (isCached)
                    Positioned(
                      right: -2,
                      top: -2,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 1),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            label: config.label,
          );
        }).toList(),
      ),
    );
  }
}