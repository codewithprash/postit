import 'package:flutter/material.dart';
import 'package:postit/models/post.dart';
import 'package:postit/services/remote_service.dart';

class Apipost extends StatefulWidget {
  const Apipost({Key? key}) : super(key: key);

  @override
  _ApipostState createState() => _ApipostState();
}

class _ApipostState extends State<Apipost> {
  List<Post>? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    //fetch data from API
    getData();
  }

  getData() async {
    posts = await RemoteService().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API data'),
        centerTitle: true,
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: posts?.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue,
                  ),
                  height: 40,
                  width: 40,
                ),
                title: Text(
                  posts![index].title,
                ),
                subtitle: Text(
                  posts![index].body ?? '',
                  maxLines: 2,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
