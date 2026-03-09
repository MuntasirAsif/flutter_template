import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/static/const/app_icons.dart';
import '../../../../../core/static/theme/src/theme_extensions/src/dimensions.dart';
import '../../../../../core/static/theme/theme.dart';
import '../model/message_model.dart';
import '../view_model/message_provider.dart';
import 'widget/message_card.dart';

// final bool isServiceProvider = true;

class ConversationScreen extends ConsumerWidget {
  const ConversationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController messageController = TextEditingController();
    final messageNotifier = ref.read(messageProvider.notifier);
    final messagesProvider = ref.watch(messageProvider);

    ScrollController scrollController = ScrollController();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(radius: 15.r),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 8.r,
                    height: 8.r,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
            10.horizontalSpace,
            const Text("Jane Cooper"),
          ],
        ),
        actions: [
          // IconButton(icon: const Icon(Icons.video_call), onPressed: () {}),
          // IconButton(icon: const Icon(Icons.call), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(
          horizontal: const Dimensions().padding.p16.w,
        ),
        child: ListView.builder(
          reverse: true,
          controller: scrollController,
          itemCount: messageNotifier.messages.length,
          itemBuilder: (context, index) {
            final reversedIndex = messageNotifier.messages.length - 1 - index;
            final message = messageNotifier.messages[reversedIndex];
            return MessageCard(isMe: message.isMe, message: message.message);
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsetsGeometry.symmetric(
          horizontal: const Dimensions().padding.p16.w,
          vertical: const Dimensions().padding.p16.h,
        ),
        child: TextField(
          controller: messageController,
          decoration: InputDecoration(
            // prefixIcon: isServiceProvider
            //     ? IconButton(
            //         icon: Icon(Icons.add),
            //         onPressed: () {
            //           showModalBottomSheet(
            //             context: context,
            //             isScrollControlled: true,
            //             backgroundColor: Colors.transparent,
            //             builder: (context) {
            //               return CreateOfferBottomSheet();
            //             },
            //           );
            //         },
            //       )
            //     : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(const Dimensions().radius.r30.r),
            ),
            suffixIcon: Padding(
              padding: EdgeInsets.all(const Dimensions().padding.p4.r),
              child: CircleAvatar(
                backgroundColor: context.color.primary,
                child: IconButton(
                  icon: SvgPicture.asset(
                    AppIcons.send,
                    height: 20.h,
                    width: 20.w,
                  ),
                  onPressed: () {
                    messagesProvider.sendMessage(
                      MessageModel(
                        message: messageController.text.trim(),
                        isMe: true,
                        time: '10:00 AM',
                      ),
                    );
                    _scrollToBottom(scrollController);
                  },
                ),
              ),
            ),
            hintText: "Type a message",
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(const Dimensions().radius.r30.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(const Dimensions().radius.r30.r),
              borderSide: BorderSide(color: context.color.primary),
            ),
            fillColor: context.color.onPrimary,
            filled: true,
          ),
        ),
      ),
    );
  }

  void _scrollToBottom(
    ScrollController scrollController, {
    bool animate = true,
  }) {
    if (!scrollController.hasClients) return;

    if (animate) {
      scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 280),
        curve: Curves.easeOut,
      );
    } else {
      scrollController.jumpTo(0);
    }
  }
}
