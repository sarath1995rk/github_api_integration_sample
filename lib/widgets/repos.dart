import 'package:flutter/material.dart';

class Repos extends StatelessWidget {
  final String name;
  final String? description;

  Repos(this.name, this.description);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: const EdgeInsets.all(12.0),
          margin: const EdgeInsets.symmetric(
            vertical: 5.0,
          ),
          child: Row(
            children: <Widget>[
              Container(
                child: CircleAvatar(
                    child: Text(
                  name[0].toUpperCase(),
                  style: TextStyle(fontSize: 15.0),
                )),
                width: 40.0,
                height: 40.0,
                margin: const EdgeInsets.only(right: 10.0),
              ),
              Expanded(
                child: Text(
                  name,
                  style: TextStyle(fontSize: 15.0),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ],
          )),
    );
  }
}
