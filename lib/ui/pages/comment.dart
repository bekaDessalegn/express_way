import 'package:expressway/models/comments_data.dart';
import 'package:expressway/ui/widgets/add_comment_textformfield.dart';
import 'package:expressway/ui/widgets/comment_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

class CommentSection extends StatefulWidget {
  const CommentSection({super.key});

  @override
  State<CommentSection> createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {

  @override
  void initState() {
    super.initState();
  }

  //its still under development

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<Com>(
        builder: (context, data, child) {
          return CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              backgroundColor: Colors.white,
              leading: CupertinoButton(
                child: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: Color.fromARGB(255, 83, 83, 83),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              middle: const Text(
                'Comments',
                style: TextStyle(
                  color: Color.fromARGB(255, 83, 83, 83),
                  fontFamily: 'Red Hat Display',
                  fontSize: 20,
                ),
              ),
            ),
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height-80,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: data.comments.length,
                        itemBuilder: (context, index) {
                          final _comm = data.comments[index];
                          return Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 20,
                              right: 10,
                            ),
                            child: Column(
                              children: [
                                commentBox(comm: _comm, context: context, commentIndex: index),
                                _comm.reply.length == 0 ? SizedBox() :
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: BouncingScrollPhysics(),
                                    itemCount: _comm.reply.length,
                                    itemBuilder: (context, index) {
                                      final _reply = _comm.reply[index];
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                          top: 10,
                                          left: 20,
                                          right: 10,
                                        ),
                                        child: commentBox(comm: Comment(date: "26/02/2022 at 6:08", firstName: "Beka", like: 8, disLike: 7, reply: [], message: _reply), context: context, commentIndex: index),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Divider(thickness: 1.0,),
                    AddCommentTextFormField()
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
//Widget 
