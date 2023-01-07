import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:kashflow/util/strings.dart';

class MobileSettingsPage extends StatelessWidget {
  const MobileSettingsPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar.large(
              automaticallyImplyLeading: false,
              expandedHeight: MediaQuery.of(context).size.height * 0.4,
              flexibleSpace: FlexibleSpaceBar(
                expandedTitleScale: 2.4,
                title: Text(
                  SETTINGS_LABEL,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                titlePadding: EdgeInsetsDirectional.only(start: 16, bottom: 18),
              ),
            ),
            SliverMasonryGrid(
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              gridDelegate: SliverSimpleGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 800,
              ),
              delegate: SliverChildListDelegate.fixed([]),
            ),
          ],
        ),
      ),
    );
  }
}

final _settingsList = <Widget>[
  //Select theme
  ListTile(),
  ListTile(),
  ListTile(),
  ListTile(),
  ListTile(),
];
