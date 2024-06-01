import 'package:chat_app/colors/color_app.dart';
import 'package:chat_app/models/user.dart';
import 'package:chat_app/screens/chatScreen.dart';
import 'package:flutter/material.dart';

class HomeChat extends StatelessWidget {
  HomeChat({super.key});

  List<User> userList = [
    User(
        name: 'Mahmoud Abdelkawy',
        image: 'assets/images/1.jpg',
        message: 'hi',
        deta: '10:02'),
    User(
        name: 'Mohamed Ahmed',
        image: 'assets/images/2.jpg',
        message: 'Welcome',
        deta: '11:00'),
    User(
        name: 'Ahmed Othman',
        image: 'assets/images/3.jpg',
        message: 'How are you',
        deta: '02:02'),
    User(
        name: 'Mahmoud Abdelkawy',
        image: 'assets/images/4.jpg',
        message: 'Please, help me',
        deta: '01:03'),
    User(
        name: 'Syid Fathy',
        image: 'assets/images/5.jpg',
        message: 'Welcome',
        deta: '09:02'),
    User(
        name: 'Mahmoud Syid',
        image: 'assets/images/6.jpg',
        message: 'my dear',
        deta: '10:02'),
    User(
        name: 'Amjad Syid',
        image: 'assets/images/7.jpg',
        message: 'Welcome',
        deta: '11:02'),
    User(
        name: 'Eadil Amjad',
        image: 'assets/images/8.jpg',
        message: 'How are you',
        deta: '07:02'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        title: Text(
          'Chats',
          style: TextStyle(fontWeight: FontWeight.bold, color: AppColor.white),
        ),
        actions: [Icon(Icons.settings, color: AppColor.white)],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Favorite Contacts',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: AppColor.white),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 100,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: AppColor.white,
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage(userList[index].image),
                              ),
                            ),
                            Text(
                              userList[index].name.split(' ').first,
                              style: TextStyle(color: AppColor.white),
                            )
                          ],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 10,
                        );
                      },
                      itemCount: userList.length),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 20, left: 10, bottom: 10),
              decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return ChatScreen(
                              name: userList[index].name,
                              image: userList[index].image,
                              message: userList[index].message,
                            );
                          },
                        ));
                      },
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(userList[index].image),
                      ),
                      title: Text(
                        userList[index].name,
                        style: TextStyle(
                            color: AppColor.primary,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(userList[index].message),
                      trailing: Text(userList[index].deta),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox();
                  },
                  itemCount: userList.length),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColor.primary,
        foregroundColor: AppColor.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}
