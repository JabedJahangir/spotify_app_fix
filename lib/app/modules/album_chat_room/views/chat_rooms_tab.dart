import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tanit_tanit_app/app/data/app_colors.dart';

class ChatRoomsTab extends StatelessWidget {
  const ChatRoomsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 40,
          width: 300,
          decoration: BoxDecoration(
            color: AppColors.white
          ),
        ),
        Padding(
          padding:  EdgeInsets.only(bottom: 30),
          child: Row(
            children: [
              Container(
                  height: 40,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45)
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      contentPadding:  EdgeInsets.symmetric(horizontal: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(45),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  )),
              Container(
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                  color: AppColors.blue
                ),
                child: Text('data'),
              )
            ],
          ),
        ),
      ],
    );
  }
}
