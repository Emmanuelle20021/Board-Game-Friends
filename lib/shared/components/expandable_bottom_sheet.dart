import 'package:board_game_friends/shared/utils/extensions/int_to_gap.dart';
import 'package:flutter/material.dart';

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
