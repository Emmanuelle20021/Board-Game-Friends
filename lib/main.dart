import 'package:board_game_friends/modules/preview/screens/preview_screen.dart';
import 'package:board_game_friends/shared/utils/constants.dart';
import 'package:board_game_friends/shared/utils/extensions/int_to_gap.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import 'keys/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.kAppName,
      theme: Constants.kThemeData,
      home: PreviewScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}

class ExpandableBottomSheet extends StatefulWidget {
  const ExpandableBottomSheet({super.key});

  @override
  State<ExpandableBottomSheet> createState() => _ExpandableBottomSheetState();
}

class _ExpandableBottomSheetState extends State<ExpandableBottomSheet> {
  double _dragStart = 0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final sheetHeight = screenHeight * .6;
    return Positioned(
      bottom: _dragStart,
      left: 0,
      right: 0,
      child: GestureDetector(
        onDoubleTap: () {
          if (_dragStart == 0) {
            setState(() {
              _dragStart = -(sheetHeight - 50);
            });
          } else {
            setState(() {
              _dragStart = 0;
            });
          }
        },
        onPanUpdate: (details) {
          if (_dragStart - details.delta.dy > 0) return;
          setState(() {
            _dragStart -= details.delta.dy;
          });
        },
        onPanEnd: (details) {
          if (_dragStart < -200) {
            setState(() {
              _dragStart = -(sheetHeight - 50);
            });
          } else {
            setState(() {
              _dragStart = 0;
            });
          }
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(40),
            ),
          ),
          height: sheetHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Divider(
                color: const Color.fromARGB(121, 158, 158, 158),
                thickness: 4,
                indent: 140,
                endIndent: 140,
              ),
              10.toVerticalGap,
              Text(
                'Hay eventos cerca ¡Unete!',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
