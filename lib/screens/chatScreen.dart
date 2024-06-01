import 'package:chat_app/colors/color_app.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen(
      {super.key,
      required this.name,
      required this.image,
      required this.message});

  final String name;
  final String image;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        foregroundColor: AppColor.white,
        title: Text(name),
        actions: const [Icon(Icons.more_horiz_rounded)],
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(image),
                      ),
                      title: Container(
                        padding: const EdgeInsets.only(left: 10),
                        alignment: Alignment.centerLeft,
                        height: 50,
                        decoration: BoxDecoration(
                            color: AppColor.white2,
                            borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: Text(
                          message,
                          style: TextStyle(
                              color: AppColor.primary,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: 1),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              validator: (value) {
                return null;
              },
              cursorColor: AppColor.primary,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Type your message here',
                suffixIcon: Container(
                  margin: const EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(
                      color: AppColor.primary,
                      borderRadius: BorderRadius.circular(50)),
                  child: Icon(
                    Icons.send,
                    size: 25,
                    color: AppColor.white,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColor.primary),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColor.primary),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.red),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.red),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
