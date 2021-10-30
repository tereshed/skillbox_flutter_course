import 'package:flutter/material.dart';

List<Widget> tabList = [const HomeTab(), const ChatTab(), const ProfileTab()];

class HomeTab extends StatefulWidget {
  const HomeTab({
    Key? key,
  }) : super(key: key);
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Text('Home Tab'),
    );
  }
}

class ChatTab extends StatefulWidget {
  const ChatTab({
    Key? key,
  }) : super(key: key);
  @override
  State<ChatTab> createState() => _ChatTabState();
}

class _ChatTabState extends State<ChatTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Text('Chat Tab'),
    );
  }
}

class ProfileTab extends StatefulWidget {
  const ProfileTab({
    Key? key,
  }) : super(key: key);
  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Text('Profile Tab'),
    );
  }
}
