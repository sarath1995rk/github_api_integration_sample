import 'package:flutter/material.dart';
import 'package:github_api_integration_sample/services/apiService.dart';
import 'package:github_api_integration_sample/widgets/repos.dart';

class RepositoryScreen extends StatefulWidget {
  final String userName;

  RepositoryScreen(this.userName);

  @override
  _RepositoryScreenState createState() => _RepositoryScreenState();
}

class _RepositoryScreenState extends State<RepositoryScreen> {
  bool _loading = false;
  final _apiService = ApiService();
  List<Repos> _repoList = [];
  @override
  void initState() {
    print(widget.userName);
    _loading = true;
    _apiService.getRepositories(widget.userName).then((value) {
      _repoList = value!;
      setState(() {
        _loading = false;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? Center(
            child: const CircularProgressIndicator(),
          )
        : ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemBuilder: (_, int index) {
              return Repos(_repoList[index].name, _repoList[index].description);
            },
            itemCount: _repoList.length,
          );
  }
}
