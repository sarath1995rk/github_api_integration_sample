import 'package:github_api_integration_sample/widgets/profileCard.dart';
import 'package:github_api_integration_sample/widgets/repos.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

const kBaseurl = "https://api.github.com/users/";

class ApiService {
  Future<List<ProfileCard>?> getUser(String text) async {
    final List<ProfileCard> _card = <ProfileCard>[];
    var resBody;

    var uri = Uri.parse("https://api.github.com/users/$text");
    var res = await http.get(uri, headers: {"Accept": "application/json"});
    resBody = json.decode(res.body);
    print(resBody);

    if (resBody['name'] == null) {
      return [];
    }
    if (resBody['avatar_url'] != null) {
      ProfileCard card = ProfileCard(
        text,
        resBody['name'],
        resBody['avatar_url'],
        resBody['public_repos'],
        resBody['following'],
        resBody['followers'],
      );

      _card.insert(0, card);
      return _card;
    }
  }

  Future<List<Repos>?> getRepositories(String userName) async {
    List<Repos> repoList = [];
    var resBody;

    var uri = Uri.parse("$kBaseurl$userName/repos");
    print(uri.toString());
    var res = await http.get(uri, headers: {"Accept": "application/json"});
    resBody = json.decode(res.body);
    print(resBody);
    for (var data in resBody) {
      repoList.add(Repos(
        data['name'],
        data['description'],
      ));
    }
    return repoList;
  }
}
