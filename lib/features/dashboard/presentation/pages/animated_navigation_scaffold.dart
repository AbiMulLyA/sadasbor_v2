import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AnimatedNavigationScaffold extends StatefulHookWidget {
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
  State<AnimatedNavigationScaffold> createState() =>
      _AnimatedNavigationScaffoldState();
}

class _AnimatedNavigationScaffoldState
    extends State<AnimatedNavigationScaffold> with TickerProviderStateMixin {
  late Animation<double> fadeAnimation;
  late Animation<Offset> slideAnimation;

  @override
  Widget build(BuildContext context) {
    final selectedIndex = widget.selectedIndex;

    final appBarAnimationController = useAnimationController(
      duration: const Duration(milliseconds: 250),
    );

    final appBarFadeAnimation = useMemoized(() {
      return Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: appBarAnimationController,
          curve: Curves.easeInOut,
        ),
      );
    }, [appBarAnimationController]);

    final appBarSlideAnimation = useMemoized(() {
      return Tween<Offset>(begin: const Offset(0, -0.5), end: Offset.zero)
          .animate(
        CurvedAnimation(
          parent: appBarAnimationController,
          curve: Curves.easeOutCubic,
        ),
      );
    }, [appBarAnimationController]);

    fadeAnimation = useMemoized(() {
      return Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: widget.animationController,
          curve: const Interval(0.2, 1.0, curve: Curves.easeInOut),
        ),
      );
    }, [widget.animationController]);

    final slideAnim = useState<Animation<Offset>>(
      Tween<Offset>(begin: const Offset(0.3, 0), end: Offset.zero).animate(
        CurvedAnimation(
          parent: widget.animationController,
          curve: Curves.easeOutCubic,
        ),
      ),
    );

    // Trigger animasi appbar ketika index berubah
    useEffect(() {
      appBarAnimationController.forward();
      return null;
    }, []);

    useEffect(() {
      final isMovingRight = widget.selectedIndex > selectedIndex;

      slideAnim.value = Tween<Offset>(
        begin: Offset(isMovingRight ? 0.3 : -0.3, 0),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: widget.animationController,
          curve: Curves.easeOutCubic,
        ),
      );

      appBarAnimationController.reverse().then((_) {
        if (mounted) {
          appBarAnimationController.forward();
        }
      });

      return null;
    }, [widget.selectedIndex]);

    return Scaffold(
      appBar: _buildAnimatedAppBar(
        fade: appBarFadeAnimation,
        slide: appBarSlideAnimation,
        selectedIndex: selectedIndex,
      ),
      body: AnimatedBuilder(
        animation: widget.animationController,
        builder: (_, __) => SlideTransition(
          position: slideAnim.value,
          child: FadeTransition(
            opacity: fadeAnimation,
            child: IndexedStack(
              index: selectedIndex,
              children: widget.pages,
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(selectedIndex),
    );
  }

  PreferredSizeWidget _buildAnimatedAppBar({
    required Animation<double> fade,
    required Animation<Offset> slide,
    required int selectedIndex,
  }) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: AppBar(
        centerTitle: false,
        title: FadeTransition(
          opacity: fade,
          child: SlideTransition(
            position: slide,
            child: widget.navItems[selectedIndex]['appBarTitle'],
          ),
        ),
        // backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        foregroundColor: Colors.black87,
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
    );
  }

  Widget _buildBottomNavigationBar(int selectedIndex) {
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
        currentIndex: selectedIndex,
        enableFeedback: true,
        selectedItemColor: Colors.blue[700],
        unselectedItemColor: Colors.grey[600],
        backgroundColor: Colors.transparent,
        onTap: widget.onIndexChanged,
        items: widget.navItems.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          final isSelected = index == selectedIndex;

          return BottomNavigationBarItem(
            icon: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: EdgeInsets.only(top: isSelected ? 2 : 5),
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