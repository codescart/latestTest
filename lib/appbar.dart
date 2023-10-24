import 'package:flutter/material.dart';


class AppBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0, // Adjust as needed
            floating: true,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              title: Column(
                children: [
                  Text("categruy"),
                  Text("Single Title"),
                ],
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(0.0),
              child: Text("Single Title"),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return ListTile(
                  title: Text('Item $index'),
                );
              },
              childCount: 100, // Replace with the number of items you want to display
            ),
          ),
        ],
      ),
    );
  }
}
