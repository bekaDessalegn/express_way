import 'package:expressway/models/comments_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddCommentTextFormField extends StatelessWidget {

  TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<Com>(
        builder: (context, data, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: 20,),
                Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset("assets/images/p2.jpg", fit: BoxFit.cover, width: 40, height: 40,)),
                    SizedBox(width: 10,),
                    Expanded(
                      child: TextField(
                        controller: commentController,
                        decoration: InputDecoration(
                            hintText: "Share something Nardos Tamirat",
                            hintStyle: TextStyle(fontSize: 14),
                            border: OutlineInputBorder()
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)
                      )
                    ),
                    onPressed: (){
                      data.addComment(Comment(
                        date: "8",
                        firstName: "Nardos Tamirat",
                        imageUrl: "assets/images/p2.jpg",
                        like: 1,
                        liked: false,
                        disLike: 3,
                        reply: [],
                        message:
                        commentController.text,
                      ));
                    }, child: Text("Post"))
              ],
            ),
          );
        }
    );
  }
}