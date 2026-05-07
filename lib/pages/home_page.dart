import 'package:flutter/material.dart';
import 'package:states/pages/change_notifier_page.dart';
import 'package:states/pages/cubit_page.dart';
import 'package:states/pages/riverpod_page.dart';
import 'package:states/pages/rxdart_page.dart';
import 'package:states/pages/set_state_page.dart';
import 'package:states/pages/signals_page.dart';
import 'package:states/pages/value_notifier_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('State Management Demo')),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        children: const [
          _NavCard(
            title: 'setState',
            subtitle: 'Estado local en el widget, sin gestor externo',
            color: Colors.grey,
            page: SetStatePage(),
          ),
          _NavCard(
            title: 'ValueNotifier',
            subtitle: 'ValueNotifier<T>.value + ValueListenableBuilder',
            color: Colors.teal,
            page: ValueNotifierPage(),
          ),
          _NavCard(
            title: 'ChangeNotifier + Provider',
            subtitle: 'notifyListeners() + context.watch<T>()',
            color: Colors.blue,
            page: ChangeNotifierPage(),
          ),
          _NavCard(
            title: 'RxDart',
            subtitle: 'BehaviorSubject<T> + StreamBuilder',
            color: Colors.purple,
            page: RxDartPage(),
          ),
          _NavCard(
            title: 'Cubit (flutter_bloc)',
            subtitle: 'emit(state) + BlocBuilder',
            color: Colors.orange,
            page: CubitPage(),
          ),
          _NavCard(
            title: 'Riverpod',
            subtitle: 'NotifierProvider + ref.watch()',
            color: Colors.green,
            page: RiverpodPage(),
          ),
          _NavCard(
            title: 'Signals',
            subtitle: 'signal<T>() + Watch()',
            color: Colors.red,
            page: SignalsPage(),
          ),
        ],
      ),
    );
  }
}

class _NavCard extends StatelessWidget {
  const _NavCard({
    required this.title,
    required this.subtitle,
    required this.color,
    required this.page,
  });

  final String title;
  final String subtitle;
  final Color color;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withValues(alpha: 0.15),
          child: Icon(Icons.layers_outlined, color: color),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute<void>(builder: (_) => page),
        ),
      ),
    );
  }
}
