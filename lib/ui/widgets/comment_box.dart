import 'package:expressway/models/comments_data.dart';
import 'package:expressway/ui/widgets/reply_dialog.dart';
import 'package:flutter/material.dart';

Widget commentBox({required Comment comm, required BuildContext context, required commentIndex}) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("${comm.date} - ", style: TextStyle(
                fontSize: 16,
              color: Colors.black45
            ),),
            Text(comm.firstName, style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),),
          ],
        ),
        SizedBox(height: 10,),
        Text(comm.message,textAlign: TextAlign.left,style: TextStyle(fontSize: 16, color: Colors.black87)),
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.only(right: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("assets/images/like.png", fit: BoxFit.cover, width: 30,  height: 30,),
              Image.asset("assets/images/dislike.png", fit: BoxFit.cover, width: 30,  height: 30,),
              Image.asset("assets/images/chat.png", fit: BoxFit.cover, width: 30,  height: 30,),
              Row(
                children: [
                  GestureDetector(
                      onTap: (){
                        showDialog(context: context, builder: (BuildContext context) {
                          return replyDialog(commentIndex: commentIndex);
                        });
                      },
                      child: Image.asset("assets/images/reply.png", fit: BoxFit.cover, width: 30,  height: 30,)),
                  SizedBox(width: 5,),
                  comm.reply.length == 0 ? SizedBox() : Text(comm.reply.length.toString(), style: TextStyle(fontSize: 18),)
                ],
              ),
              Image.asset("assets/images/caution.png", fit: BoxFit.cover, width: 30,  height: 30,),
            ],
          ),
        )
      ],
    ),
  );
}