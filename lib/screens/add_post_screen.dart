import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_flutter/models/users.dart' as model;
import 'package:instagram_flutter/providers/user_provider.dart';
import 'package:instagram_flutter/resources/firestore_methods.dart';
import 'package:instagram_flutter/utils/colors.dart';
import 'package:instagram_flutter/utils/utils.dart';
import 'package:provider/provider.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  Uint8List? _file;
  final TextEditingController _discriptionController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _discriptionController.dispose();
  }

  void postImage(String uid, String username, String profImage) async {
    try {
      setState(() {
        _isLoading = true;
      });
      String res = await FirestoreMethods().uploadPost(
          _discriptionController.text, _file!, uid, username, profImage);
      setState(() {
        _isLoading = false;
      });
      if (res == 'success') {
        showSnackBar(context, 'posted!');
        clearImage();
      } else {
        showSnackBar(context, res);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  _selectImage(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text('create a post'),
            children: [
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Take a photo'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(ImageSource.camera);
                  setState(() {
                    _file = file;
                  });
                },
              ),
              SimpleDialogOption(
                padding: EdgeInsets.all(20),
                child: const Text('Choose from gallery'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(ImageSource.gallery);
                  setState(() {
                    _file = file;
                  });
                },
              ),
              SimpleDialogOption(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Colors.red.shade400),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  void clearImage() {
    setState(() {
      _file = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    //there is a class called User in FirebaseAuth so you have to take care for name collision
    final model.User user = Provider.of<UserProvider>(context).getUser;
    return _file == null
        ? Center(
            child: IconButton(
            icon: const Icon(Icons.upload),
            onPressed: () => _selectImage(context),
          ))
        : Scaffold(
            appBar: AppBar(
              backgroundColor: mobileBackgroundColor,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                ),
                onPressed: clearImage,
              ),
              title: const Text('Post to'),
              centerTitle: false,
              actions: [
                TextButton(
                    onPressed: () =>
                        postImage(user.uid, user.username, user.photoUrl),
                    child: const Text(
                      'post',
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ))
              ],
            ),
            body: Column(
              children: [
                _isLoading == true
                    ? const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: LinearProgressIndicator(
                          color: Colors.blueAccent,
                        ),
                      )
                    : Container(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(user.photoUrl),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .4,
                      // i am having difficulty with the controller the text is not being passed instead the user name is written on the database
                      child: TextField(
                        controller: _discriptionController,
                        decoration: const InputDecoration(
                          hintText: 'write a caption...',
                          border: InputBorder.none,
                        ),
                        maxLines: 8,
                      ),
                    ),
                    SizedBox(
                      height: 45,
                      width: 45,
                      child: AspectRatio(
                        aspectRatio: 487 / 451,
                        child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    //to display a Unit8List image we use MemoryImage
                                    image: MemoryImage(_file!),
                                    fit: BoxFit.fill,
                                    alignment: FractionalOffset.topRight))),
                      ),
                    ),
                    const Divider(),
                  ],
                )
              ],
            ),
          );
  }
}
