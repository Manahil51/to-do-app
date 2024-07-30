import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const Icon(
          Icons.sort,
          color: Colors.grey,
        ),
        title: const Center(
          child: Text(
            'My Profile',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.grey),
          ),
        ),
        actions: const [
          Icon(
            Icons.edit,
            color: Colors.grey,
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: const Padding(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'hhttps://cdn.pixabay.com/photo/2020/03/18/14/48/floral-4944279_1280.png'),
                radius: 50,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Manahil',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 3),
            Text(
              'Manahil@gmail.com',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 5),
            Expanded(
              child: SingleChildScrollView(
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 30, right: 30),
                  ),
                  ListTile(
                    leading: Icon(Icons.notifications, color: Colors.orange),
                    title: Text(
                      'Notifications',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_right),
                  ),
                  ListTile(
                    leading: Icon(Icons.people, color: Colors.blue),
                    title: Text(
                      'Change account name',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_right),
                  ),
                  ListTile(
                    leading: Icon(Icons.key, color: Colors.green),
                    title: Text(
                      'Change account Password',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_right),
                  ),
                  ListTile(
                    leading: Icon(Icons.camera_alt_rounded, color: Colors.grey),
                    title: Text(
                      'Change Account Image',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_right),
                  ),
                  ListTile(
                    leading: Icon(Icons.face, color: Colors.cyan),
                    title: Text(
                      'About Us',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_right),
                  ),
                  ListTile(
                    leading:
                        Icon(Icons.question_answer, color: Colors.amberAccent),
                    title: Text(
                      'FAQ s',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_right),
                  ),
                  ListTile(
                    leading: Icon(Icons.lightbulb, color: Colors.orangeAccent),
                    title: Text(
                      'Help & Feedback',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_right),
                  ),
                  ListTile(
                    leading: Icon(Icons.logout, color: Colors.lightBlueAccent),
                    title: Text(
                      'LogOut',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_right),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
