import 'package:ait_flutter_template/feature/glosarium/presentation/pages/color_glosarium/color_glosarium.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class GlosariumPage extends HookWidget {
  const GlosariumPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TabController _tabController =
        useTabController(initialLength: 3, initialIndex: 0);
    return Scaffold(
      appBar: _buildAppbar(_tabController),
      body: TabBarView(
        controller: _tabController,
        children: [
          ColorGlosariumPage(),
          Container(),
          Container(),
        ],
      ),
    );
  }

  AppBar _buildAppbar(TabController _tabController) {
    return AppBar(
      centerTitle: true,
      title: TabBar(
        controller: _tabController,
        indicatorColor: Colors.transparent,
        tabs: [
          _MetaTabBar(title: 'Color'),
          _MetaTabBar(title: 'TextSize'),
          _MetaTabBar(title: 'Button'),
        ],
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
