import 'package:flutter/material.dart';
import 'package:mapbox_navigation/constants/restaurants.dart';

class ForumPage extends StatefulWidget {
  @override
  createState() => new ForumPageState();
}

class ForumPageState extends State<ForumPage> {
  List<String> _comments = [
    "The food is tasty",
    "Very clean space",
    "The waitress is very beautiful"
  ];

  void _addComment(String val) {
    setState(() {
      _comments.add(val);
    });
  }

  Widget _buildCommentList() {
    return ListView.builder(
        itemCount: _comments.length,
        itemBuilder: ((context, index) {
          return _buildCommentItem(_comments[index]);
        }));
  }

  Widget _buildCommentItem(String comment) {
    return ListTile(
      title: Text(comment),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Forum"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: _buildCommentList(),
          ),
          TextField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(20.0),
              hintText: "Add comment",
            ),
            onSubmitted: (String submittedStr) {
              _addComment(submittedStr);
            },
          ),
        ],
      ),
    );
  }
}
