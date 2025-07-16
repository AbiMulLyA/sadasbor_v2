import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sadasbor_v2/features/account/presentation/pages/dummy_account_page.dart';
import 'package:sadasbor_v2/features/dashboard/presentation/bloc/dashboard/dashboard_page_cubit.dart';
import 'package:sadasbor_v2/features/account/presentation/pages/account_page.dart';
import 'package:sadasbor_v2/features/presensi/presentation/pages/presensi_page.dart';

import '../../../../config/injector/injector.dart';
import '../bloc/posts/dashboard_posts_cubit.dart';
import '../bloc/posts_annoucement/dashboard_posts_annoucement_cubit.dart';
import 'home/home_page.dart';

class AnimatedDashboardPage extends HookWidget {
  const AnimatedDashboardPage({super.key});

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
        BlocProvider(
          create: (_) => getIt<DashboardPostsAnnouncementCubit>(),
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
    // Animation controller untuk transitions
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 300),
    );

    // Pages yang akan di-maintain statenya
    final pages = useMemoized(
          () => [
        const HomePage(),
        const PresensiPage(),
        const DummyAccountPage(),
      ],
      [],
    );

    // Navigation items configuration
    final navItems = useMemoized(
          () => [
        {
          'label': 'Home',
          'icon': const Icon(Icons.home_filled),
          'appBarTitle': 'Sadasbor',
        },
        {
          'label': 'Presensi',
          'icon': const Icon(Icons.fingerprint),
          'appBarTitle': 'Presensi',
        },
        {
          'label': 'Akun',
          'icon': const Icon(Icons.person_outline),
          'appBarTitle': 'Akun',
        },
      ],
      [],
    );

    // Start animation saat first build
    useEffect(() {
      animationController.forward();
      return null;
    }, []);

    return BlocListener<DashboardPageCubit, int>(
      listener: (context, selectedIndex) {
        // Trigger animation saat tab berubah
        animationController.reset();
        animationController.forward();
      },
      child: BlocBuilder<DashboardPageCubit, int>(
        builder: (context, selectedIndex) {
          return AnimatedNavigationScaffold(
            selectedIndex: selectedIndex,
            pages: pages,
            navItems: navItems,
            animationController: animationController,
            onIndexChanged: (index) {
              context.read<DashboardPageCubit>().changeNav(index);
            },
          );
        },
      ),
    );
  }
}

// Animated Navigation Scaffold
class AnimatedNavigationScaffold extends StatefulWidget {
  final int selectedIndex;
  final List<Widget> pages;
  final List<Map<String, dynamic>> navItems;
  final AnimationController animationController;
  final Function(int) onIndexChanged;

  const AnimatedNavigationScaffold({
    super.key,
    required this.selectedIndex,
    required this.pages,
    required this.navItems,
    required this.animationController,
    required this.onIndexChanged,
  });

  @override
  State<AnimatedNavigationScaffold> createState() => _AnimatedNavigationScaffoldState();
}

class _AnimatedNavigationScaffoldState extends State<AnimatedNavigationScaffold>
    with TickerProviderStateMixin {
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late AnimationController _appBarAnimationController;
  late Animation<double> _appBarFadeAnimation;
  late Animation<Offset> _appBarSlideAnimation;

  int _previousIndex = 0;

  @override
  void initState() {
    super.initState();

    // Setup body animations
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: widget.animationController,
      curve: const Interval(0.2, 1.0, curve: Curves.easeInOut),
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.3, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: widget.animationController,
      curve: Curves.easeOutCubic,
    ));

    // Setup AppBar animations
    _appBarAnimationController = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );

    _appBarFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _appBarAnimationController,
      curve: Curves.easeInOut,
    ));

    _appBarSlideAnimation = Tween<Offset>(
      begin: const Offset(0, -0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _appBarAnimationController,
      curve: Curves.easeOutCubic,
    ));

    _previousIndex = widget.selectedIndex;

    // Start initial animation
    _appBarAnimationController.forward();
  }

  @override
  void didUpdateWidget(AnimatedNavigationScaffold oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.selectedIndex != widget.selectedIndex) {
      _handlePageTransition(oldWidget.selectedIndex, widget.selectedIndex);
    }
  }

  void _handlePageTransition(int fromIndex, int toIndex) {
    setState(() {
      _previousIndex = fromIndex;
    });

    // Update slide direction berdasarkan navigasi
    final isMovingRight = toIndex > fromIndex;
    _slideAnimation = Tween<Offset>(
      begin: Offset(isMovingRight ? 0.3 : -0.3, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: widget.animationController,
      curve: Curves.easeOutCubic,
    ));

    // Animate AppBar title change
    _appBarAnimationController.reverse().then((_) {
      if (mounted) {
        _appBarAnimationController.forward();
      }
    });
  }

  @override
  void dispose() {
    _appBarAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAnimatedAppBar(),
      body: _buildAnimatedBody(),
      bottomNavigationBar: _buildAnimatedBottomNavigation(),
    );
  }

  PreferredSizeWidget _buildAnimatedAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: AnimatedBuilder(
        animation: _appBarAnimationController,
        builder: (context, child) {
          return AppBar(
            centerTitle: true,
            title: FadeTransition(
              opacity: _appBarFadeAnimation,
              child: SlideTransition(
                position: _appBarSlideAnimation,
                child: Text(
                  widget.navItems[widget.selectedIndex]['appBarTitle'].toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black87,
            elevation: 0,
            shadowColor: Colors.transparent,
          );
        },
      ),
    );
  }

  Widget _buildAnimatedBody() {
    return AnimatedBuilder(
      animation: widget.animationController,
      builder: (context, child) {
        return SlideTransition(
          position: _slideAnimation,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: IndexedStack(
              index: widget.selectedIndex,
              children: widget.pages,
            ),
          ),
        );
      },
    );
  }

  Offset _getSlideDirection() {
    // Tentukan arah slide berdasarkan perubahan index
    if (_previousIndex < widget.selectedIndex) {
      return const Offset(0.3, 0); // Slide dari kanan
    } else if (_previousIndex > widget.selectedIndex) {
      return const Offset(-0.3, 0); // Slide dari kiri
    } else {
      return const Offset(0.2, 0); // Default slide untuk initial load
    }
  }

  Widget _buildAnimatedBottomNavigation() {
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
        items: widget.navItems.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          final isSelected = index == widget.selectedIndex;

          return BottomNavigationBarItem(
            icon: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: EdgeInsets.only(
                top: isSelected ? 2 : 5,
              ),
              child: AnimatedScale(
                duration: const Duration(milliseconds: 200),
                scale: isSelected ? 1.1 : 1.0,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Colors.blue.withOpacity(0.1)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: item['icon'] as Widget,
                ),
              ),
            ),
            label: item['label'].toString(),
          );
        }).toList(),
      ),
    );
  }
}