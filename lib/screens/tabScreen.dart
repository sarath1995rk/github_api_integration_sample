import 'package:flutter/material.dart';
import 'package:github_api_integration_sample/screens/profileScreen.dart';
import 'package:github_api_integration_sample/screens/repositoryScreen.dart';

class TabScreen extends StatelessWidget {
  final String username, user, image;
  final int repo;

  TabScreen(this.username, this.user, this.image, this.repo);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          bottom: TabBar(
            indicatorWeight: 2.5,
            tabs: [
              const Tab(
                text: 'Profile',
              ),
              const Tab(
                text: 'Repository',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ProfileScreen(this.image, this.username, this.repo),
            RepositoryScreen(this.user)
          ],
        ),
      ),
    );
  }
}
