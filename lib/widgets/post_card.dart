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
              //what is the diffrence between NetworkImage() and Image.network()
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1511920170033-f8396924c348?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80'),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
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
            iconButtonBuilder(Icons.favorite),
            iconButtonBuilder(Icons.comment),
            iconButtonBuilder(Icons.send),
            Expanded(
                child: Align(
              alignment: Alignment.bottomRight,
              child: iconButtonBuilder(Icons.bookmark_border_outlined),
            ))
          ],
        ),

        //DESCRIPTION SECTION
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultTextStyle(
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(fontWeight: FontWeight.bold),
                    child: const Align(
                        alignment: Alignment.bottomLeft,
                        child: Text('1,293 likes'))),
                RichText(
                    text: const TextSpan(
                        style: TextStyle(color: primaryColor),
                        children: [
                      TextSpan(
                          text: 'username',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                        text: ' some description goes here',
                      )
                    ])),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: const Text(
                      'view all 200 comments',
                      style: TextStyle(color: secondaryColor),
                    ),
                  ),
                ),

                ///so i will use rich text if there is text that spans more than one line
                RichText(
                    text: const TextSpan(
                        style: TextStyle(color: primaryColor),
                        children: [
                      TextSpan(
                          //
                          text: 'username',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                        text:
                            'comment by the user some description goes here this will be replaced by a real description',
                      )
                    ])),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: const Text(
                    //the minute or hour will not be hard coded - it will be generated dynamically
                    '19 minutes',
                    style: TextStyle(color: secondaryColor, fontSize: 10),
                  ),
                ),
              ]),
        )
      ]),
    );
  }
}

Widget iconButtonBuilder(IconData icon) {
  return IconButton(
      onPressed: () {},
      icon: Icon(
        icon,
        color: primaryColor,
      ));
}
