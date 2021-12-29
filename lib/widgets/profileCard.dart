import 'package:flutter/material.dart';
import 'package:github_api_integration_sample/screens/tabScreen.dart';

class ProfileCard extends StatelessWidget {
  ProfileCard(this.user, this.text, this.image, this.publicRepos,
      this.following, this.followers);

  final String text;
  final String user;
  final String image;
  final int publicRepos;
  final int followers;
  final int following;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        TabScreen(this.text, this.user, this.image,this.publicRepos)));
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            margin: const EdgeInsets.only(right: 5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(right: 16.0),
                  child: Image.network(
                    image,
                    width: 100.0,
                    height: 100.0,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(text, style: Theme.of(context).textTheme.headline6),
                      Padding(padding: EdgeInsets.only(bottom: 30.0)),
                      Text('Public Repo : $publicRepos'),
                      Padding(padding: EdgeInsets.only(bottom: 6.0)),
                      Row(
                        children: <Widget>[
                          Text('Followers : $followers'),
                          Padding(padding: const EdgeInsets.only(right: 15.0)),
                          Text('Following : $following')
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
