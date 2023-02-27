import 'package:expressway/models/comments_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

TextEditingController replyController = TextEditingController();

Widget replyDialog({required int commentIndex}) {
  return Consumer<Com>(
      builder: (context, data, child) {
      return Dialog(
        child: SizedBox(
          height: 200,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[300],
                  ),
                  child: TextField(
                    controller: replyController,
                    maxLines: 3,
                    minLines: 2,
                    decoration: InputDecoration(
                      hintText: 'Reply',
                      hintStyle: TextStyle(fontSize: 20),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ElevatedButton(onPressed: (){
                        print(replyController.text);
                        data.addReply(replyController.text, commentIndex);
                        Navigator.pop(context);
                      }, child: Text("Reply")),
                    ))
              ],
            ),
          ),
        ),
      );
    }
  );
}