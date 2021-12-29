import 'package:flutter/material.dart';
import 'package:github_api_integration_sample/services/apiService.dart';
import 'package:github_api_integration_sample/widgets/profileCard.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _textController = TextEditingController();
  final _apiService = ApiService();
  List<ProfileCard>? _card = [];

  bool searching = false;

  Widget _buildTextComposer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 50,
      child: TextField(
        controller: _textController,
        onSubmitted: (_) async {
          setState(() {
            searching = true;
          });
          _card = await _apiService.getUser(_textController.text);
          setState(() {
            searching = false;
          });
        },
        decoration: InputDecoration(hintText: "Enter Github Username"),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Github API"), elevation: 4.0),
        body: Container(
          child: Column(children: <Widget>[
            Container(
              decoration: BoxDecoration(color: Theme.of(context).cardColor),
              child: _buildTextComposer(),
            ),
            const Divider(height: 2.0),
            loading(),
            Flexible(
                child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemBuilder: (_, int index) => _card![index],
              itemCount: _card!.length,
            )),
          ]),
        ));
  }

  Widget loading() {
    if (searching) {
      return Container(
        height: 60.0,
        child: Center(child: const CircularProgressIndicator()),
      );
    } else {
      return const SizedBox();
    }
  }
}
