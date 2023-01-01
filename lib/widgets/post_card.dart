import 'package:flutter/material.dart';
import 'package:instagram_flutter/utils/colors.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mobileBackgroundColor,
      padding: const EdgeInsets.all(0.0),
      child: Column(children: [
        Row(
          children: [
            //the profile picture
            const CircleAvatar(
              radius: 17,
              backgroundColor: Colors.grey,
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'username',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => Dialog(
                            child: ListView(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                shrinkWrap: true,
                                children: [
                                  'Delete',
                                ]
                                    .map((e) => InkWell(
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 12, horizontal: 16),
                                            child: Text(e),
                                          ),
                                        ))
                                    .toList()),
                          ));
                },
                icon: const Icon(
                  Icons.more_vert,
                  color: primaryColor,
                ))
          ],
        ),
        //IMAGE SECTION
        SizedBox(
          height: MediaQuery.of(context).size.height * .5,
          width: MediaQuery.of(context).size.width,
          child: Image.network(
            'https://images.unsplash.com/photo-1447933601403-0c6688de566e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1961&q=80',
            fit: BoxFit.cover,
          ),
        ),
        //LIKE AND COMMENT SECTION

        Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite,
                  color: primaryColor,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.comment,
                  color: primaryColor,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.send,
                  color: primaryColor,
                )),
            Expanded(
                child: Align(
              alignment: Alignment.bottomRight,
              child: Icon(Icons.bookmark_border_outlined),
            ))
          ],
        )
      ]),
    );
  }
}
