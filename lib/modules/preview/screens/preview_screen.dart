import 'package:board_game_friends/main.dart';
import 'package:board_game_friends/modules/auth/signup/screen/registration_screen.dart';
import 'package:flutter/material.dart';

class PreviewScreen extends StatefulWidget {
  const PreviewScreen({super.key});

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  int _initialIndex = 0;

  final _pages = <Widget>[
    HomeScreen(),
    RegistrationScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final pagesController = PageController(
      initialPage: _initialIndex,
    );
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: pagesController,
            itemCount: _pages.length,
            itemBuilder: (context, index) => _pages[index],
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Row(
              children: [
                IconButton(
                  onPressed: () => setState(() {
                    if (_initialIndex == 0) return;
                    _initialIndex -= 1;
                    pagesController.jumpToPage(_initialIndex);
                  }),
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.blue,
                  ),
                ),
                IconButton(
                  onPressed: () => setState(() {
                    if (_initialIndex == _pages.length - 1) return;
                    _initialIndex += 1;
                    pagesController.jumpToPage(_initialIndex);
                  }),
                  color: Colors.blue,
                  icon: Icon(
                    Icons.arrow_forward,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      drawerEnableOpenDragGesture: true,
    );
  }
}
