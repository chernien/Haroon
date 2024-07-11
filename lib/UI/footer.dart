import 'package:flutter/material.dart';


class AppFooter extends StatelessWidget {
  final VoidCallback onHomePressed;
  final VoidCallback onDiscoverPressed;
  final VoidCallback onMediaImportPressed;
  final VoidCallback onInboxPressed;
  final VoidCallback onProfilePressed;

  AppFooter({
    required this.onHomePressed,
    required this.onDiscoverPressed,
    required this.onMediaImportPressed,
    required this.onInboxPressed,
    required this.onProfilePressed,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: onHomePressed,
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: onDiscoverPressed,
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: onMediaImportPressed,
          ),
          IconButton(
            icon: Icon(Icons.mail),
            onPressed: onInboxPressed,
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed:() {
              Navigator.pushNamed(context, '/profile');
            }

          ),
        ],
      ),
    );
  }
}
