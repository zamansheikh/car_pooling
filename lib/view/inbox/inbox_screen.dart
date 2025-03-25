import 'package:car_pooling/core/components/custom_app_bar.dart';
import 'package:flutter/material.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: customAppBar1(
          "Inbox",
          hasBack: false,
          hasTabBar: true,
          tabs: [Tab(text: "Chats"), Tab(text: "Invitations")],
        ),
      ),
    );
  }
    Widget buildTabView(List<CarpoolModel> carpools) {
    return carpools.isEmpty
        ? WelcomeScreen2()
        : ListView.builder(
          itemCount: carpools.length,
          itemBuilder: (context, index) {
            final item = carpools[index];
            return CarpoolCard(
              date: item.date,
              eventName: item.eventName,
              fromLocation: item.fromLocation,
              image: item.image,
              time: item.time,
              toLocation: item.toLocation,
            );
          },
        );
  }
}
