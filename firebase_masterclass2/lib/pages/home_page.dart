import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_masterclass2/components/my_drawer.dart';
import 'package:firebase_masterclass2/components/my_list_tile.dart';
import 'package:firebase_masterclass2/components/my_post_button.dart';
import 'package:firebase_masterclass2/components/my_textfield.dart';
import 'package:firebase_masterclass2/database/firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  //firestore access
  FirestoreDatabase database = FirestoreDatabase();

  //text controller
  final TextEditingController newPostController = TextEditingController();

  //post message
  void postMessage() {
    if (newPostController.text.isNotEmpty) {
      String message = newPostController.text;
      database.addPost(message);
    }

    newPostController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text("W A L L "),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
      ),
      drawer: MyDrawer(),
      body: Column(
        children: [
          //Textfield box for us
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              children: [
                //text field
                Expanded(
                  child: MyTextField(
                      hintText: "Say something..",
                      obscureText: false,
                      controller: newPostController),
                ),

                //post button
                PostButton(
                  onTap: postMessage,
                ),
              ],
            ),
          ),

          //posts
          StreamBuilder(
            stream: database.getPostsStream(),
            builder: (context, snapshot) {
              //show loading
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              //get all post
              final posts = snapshot.data!.docs;

              //no data?
              if (snapshot.data == null || posts.isEmpty) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(25),
                    child: Text("No posts.. Post something!"),
                  ),
                );
              }

              //return as a list
              return Expanded(
                child: ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      //get each individual post
                      final post = posts[index];

                      //get data from each post
                      String message = post['PostMessage'];
                      String userEmail = post['UserEmail'];
                      Timestamp timestamp = post['TimeStamp'];

                      return MyListTile(
                        title: message,
                        subTitle: userEmail,
                      );
                    }),
              );
            },
          )
        ],
      ),
    );
  }
}
