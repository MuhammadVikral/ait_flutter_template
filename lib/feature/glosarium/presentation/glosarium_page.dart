import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class GlosariumPage extends HookWidget {
  const GlosariumPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _tabController = useTabController(initialLength: 3, initialIndex: 0);
    print('rebuild scaffold');
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: ColoredBox(
          color: Colors.blue,
          child: TabBar(
            controller: _tabController,
            indicatorColor: Colors.purple,
            tabs: [
              _MetaTabBar(title: 'Color'),
              _MetaTabBar(title: 'TextSize'),
              _MetaTabBar(title: 'Button'),
            ],
          ),
        ),
      ),
      body: const Center(
        child: Text(
          'GlosariumPage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class _MetaTabBar extends StatelessWidget {
  final String title;
  const _MetaTabBar({
    Key? key,
    required this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}
