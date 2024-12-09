import 'package:board_game_friends/shared/components/expandable_bottom_sheet.dart';
import 'package:board_game_friends/shared/utils/constants.dart';
import 'package:board_game_friends/shared/utils/extensions/int_to_gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong2/latlong.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: SvgPicture.asset(
            key: Key('logo'),
            //'assets/${Constants.kLogoBGFHorizontal}'
            Constants.kLogoBGFHorizontal,
            height: 30,
            fit: BoxFit.contain,
          ),
        ),
        actions: [
          IconButton(
            key: Key('notifications'),
            icon: Badge.count(
              count: 3,
              child: const Icon(Icons.notifications),
            ),
            onPressed: () {},
          ),
          20.toHorizontalGap,
          InkWell(
            hoverColor: Colors.transparent,
            overlayColor: WidgetStatePropertyAll<Color>(Colors.transparent),
            onTap: () {},
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage(
                'https://avatars.githubusercontent.com/u/139426',
              ),
            ),
          ),
          20.toHorizontalGap,
        ],
      ),
      drawer: Drawer(),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter: const LatLng(51.5, -0.09),
              initialZoom: 5,
              cameraConstraint: CameraConstraint.contain(
                bounds: LatLngBounds(
                  const LatLng(-90, -180),
                  const LatLng(90, 180),
                ),
              ),
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.TechSolutions.board_game_friends',
              ),
            ],
          ),
          ExpandableBottomSheet(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      drawerEnableOpenDragGesture: true,
    );
  }
}
