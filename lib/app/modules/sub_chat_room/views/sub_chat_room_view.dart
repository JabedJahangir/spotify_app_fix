import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanit_tanit_app/app/data/app_colors.dart';
import 'package:tanit_tanit_app/app/data/app_text_styles.dart';
import 'package:tanit_tanit_app/app/data/image_path.dart';
import 'package:tanit_tanit_app/app/modules/sub_chat_room/widget/chat_card_list.dart';
import 'package:tanit_tanit_app/app/modules/widget/elevated_button_widget.dart';
import '../controllers/sub_chat_room_controller.dart';


class SubChatRoomView extends GetView<SubChatRoomController> {
  SubChatRoomView({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.Magnolia,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Obx(() {
                  final isSearching = controller.isSearching.value;
                  return Row(
                    children: [
                      if (isSearching)
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            autofocus: true,
                            decoration: InputDecoration(
                              hintText: "Search...",
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 10,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        )
                      else
                        Expanded(
                          child: Text(
                            'Add Members',
                            style: AppTextStyles.light24.copyWith(
                              color: AppColors.black,
                            ),
                          ),
                        ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          controller.isSearching.toggle();
                        },
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: AppColors.white,
                          child: Center(
                            child: Icon(
                              isSearching ? Icons.close : Icons.search,
                              size: 18,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              sliver: SliverToBoxAdapter(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: List.generate(5, (index) {
                        return Container(
                          height: 40,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: AppColors.Magnolia,
                            borderRadius: BorderRadius.circular(120),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: 24,
                                width: 24,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Image.asset(ImagePath.babyImage),
                              ),
                              const SizedBox(width: 3),
                              const Text(
                                'Jacob',
                                style: TextStyle(color: Colors.black),
                              ),
                              const SizedBox(width: 6),
                              const CircleAvatar(
                                radius: 12,
                                child: Icon(Icons.close, size: 16),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: ElevatedButtonWidget(
                  prefixIcon: Icon(Icons.add, color: AppColors.white, size: 20),
                  text: 'Create a Subroom',
                  onPressed: () {},
                  backgroundColor: AppColors.darkBlue,
                  fontSize: 16,
                  textColor: AppColors.white,
                  height: 56,
                  width: double.infinity,
                  fontWeight: FontWeight.w400,
                  borderRadius: BorderRadius.circular(120),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Select Members To add',
                  style: AppTextStyles.regular16.copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SliverList.builder(
                itemCount: 10,
                itemBuilder: (context,index){
                  return ChatCardList();
                })

          ],
        ),
      ),
    );
  }
}


