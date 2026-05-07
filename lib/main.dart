import 'package:flutter/material.dart';
import 'package:states/pages/cubit_page.dart';
import 'package:states/pages/rxdart_page.dart';
import 'package:states/pages/value_notifier_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'State Management Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MainShell(),
    );
  }
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _currentIndex = 0;

  // IndexedStack mantiene los 3 widgets vivos en memoria aunque no sean
  // visibles. Así las tareas de cada pestaña se conservan al cambiar de tab.
  static const _pages = [RxDartPage(), ValueNotifierPage(), CubitPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.stream), label: 'RxDart'),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: 'ValueNotifier',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.layers_outlined),
            label: 'Cubit',
          ),
        ],
      ),
    );
  }
}
