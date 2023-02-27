import 'package:expressway/models/comments_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddCommentTextFormField extends StatelessWidget {

  TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<Com>(
        builder: (context, data, child) {
          return Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 30),
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[300],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: commentController,
                    decoration: InputDecoration(
                        labelText: "Add Comment",
                        labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),
                        border: InputBorder.none
                    ),
                  ),
                ),
                GestureDetector(
                    onTap: (){
                      data.addComment(Comment(
                        date: "23/02/2023 at 04:30",
                        firstName: "Beka D",
                        like: 1,
                        disLike: 3,
                        reply: [],
                        message:
                        commentController.text,
                      ));
                    },
                    child: Icon(Icons.send, size: 30))
              ],
            ),
          );
        }
    );
  }
}