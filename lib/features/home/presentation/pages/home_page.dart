import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

@RoutePage()
class MyHomePage extends HookWidget {
  const MyHomePage({super.key, required this.title});

  final String title; // This might be unused if AppBar title is dynamic

  // Combined list of pages for the NavigationBar
  static final List<Widget> _mainPages = <Widget>[
    const Center(child: Text('Halaman Utama (Home)', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Halaman Presensi', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Halaman Akun', style: TextStyle(fontSize: 24))),
  ];

  // Titles for the AppBar corresponding to each page
  static const List<String> _pageTitles = <String>[
    "Sadasbor",
    "Presensi",
    "Akun",
  ];

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState(0); // Index 0:Home, 1:Presensi, 2:Akun
    final theme = Theme.of(context);

    void onItemTapped(int index) {
      selectedIndex.value = index;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(_pageTitles[selectedIndex.value]),
      ),
      body: _mainPages.elementAt(selectedIndex.value),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex.value,
        onDestinationSelected: onItemTapped,
        indicatorColor: theme.colorScheme.primaryContainer.withOpacity(0.6),
        backgroundColor: theme.colorScheme.surface, // Or theme.colorScheme.surfaceContainer for M3
        elevation: 8.0,
        height: 72, // Typical height for M3 NavigationBar
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.fingerprint_outlined), // Presensi default icon
            selectedIcon: Icon(Icons.fingerprint), // Made standard like others
            label: 'Presensi',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Akun',
          ),
        ],
      ),
    );
  }
}

// Comments for page content widgets can remain if you plan to extract them later
// class HomePageContent extends StatelessWidget { ... }
// class PresensiPageContent extends StatelessWidget { ... }
// class AkunPageContent extends StatelessWidget { ... }
