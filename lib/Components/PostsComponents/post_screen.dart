import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nav_router/nav_router.dart';
import 'package:volcano/Components/PostsComponents/post_button.dart';
import 'package:volcano/Components/PostsComponents/post_description.dart';
import 'package:volcano/Components/PostsComponents/post_title.dart';

class PostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: _back(context),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            PostTitle(),
            PostDescription(),
            PostButton(),
          ],
        ),
      ),
    );
  }

  _back(context) {
    return SafeArea(
      minimum: EdgeInsets.only(left: 20, top: 10),
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (_) {
              return SimpleDialog(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(20),
                      child: Text('Are you sure you want to discard?')),
                  FlatButton(
                    onPressed: () => {pop(), pop()},
                    child: Text('Yes'),
                  ),
                  FlatButton(onPressed: () => pop(), child: Text('No')),
                ],
              );
            },
          );
        },
        child: FaIcon(FontAwesomeIcons.arrowLeft),
      ),
    );
  }
}
