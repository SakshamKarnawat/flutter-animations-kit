import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../constants.dart';
import '../main.dart';

class Scaffold3DFlip extends StatefulWidget {
  const Scaffold3DFlip({super.key});
  static const routeName = PathNames.scaffold3dFlip;

  @override
  State<Scaffold3DFlip> createState() => _Scaffold3DFlipState();
}

class _Scaffold3DFlipState extends State<Scaffold3DFlip>
    with SingleTickerProviderStateMixin {
  final drawerColor = ColorConstants.primary;
  final backgroundColor = ColorConstants.white;
  final double maxSlide = 225.0;
  late AnimationController animationController;
  bool _canBeDragged = false;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void toggle() => animationController.isDismissed
      ? animationController.forward()
      : animationController.reverse();

  void _onDragStart(DragStartDetails details) {
    bool isDragOpenFromLeft =
        animationController.isDismissed && details.globalPosition.dx < maxSlide;
    bool isDragCloseFromRight =
        animationController.isCompleted && details.globalPosition.dx > maxSlide;
    _canBeDragged = isDragOpenFromLeft || isDragCloseFromRight;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (_canBeDragged) {
      double delta = details.primaryDelta! / maxSlide;
      animationController.value += delta;
    }
  }

  void _onDragEnd(DragEndDetails details) {
    if (animationController.isDismissed || animationController.isCompleted) {
      return;
    }
    if (details.velocity.pixelsPerSecond.dx.abs() >= 365.0) {
      double visualVelocity = details.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;
      animationController.fling(velocity: visualVelocity);
    } else if (animationController.value < 0.5) {
      close();
    } else {
      open();
    }
  }

  void close() => animationController.reverse();

  void open() => animationController.forward();

  @override
  Widget build(BuildContext context) {
    final animationBy =
        ModalRoute.of(context)!.settings.arguments as AnimationBy;
    print("run: ${animationBy.runtimeType}");
    print("Animation By: ${animationBy.name}");
    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        onHorizontalDragStart: _onDragStart,
        onHorizontalDragUpdate: _onDragUpdate,
        onHorizontalDragEnd: _onDragEnd,
        child: AnimatedBuilder(
          animation: animationController,
          builder: (context, _) {
            return Stack(
              children: [
                //Drawer
                Transform.translate(
                  offset: Offset(maxSlide * (animationController.value - 1), 0),
                  child: Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(math.pi / 2 * (1 - animationController.value)),
                    alignment: Alignment.centerRight,
                    child: Material(
                      child: Container(
                        width: maxSlide,
                        color: drawerColor,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Swipe Right to Left to see the animation",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                //Scaffold
                Transform.translate(
                  offset: Offset(maxSlide * animationController.value, 0),
                  child: Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(-math.pi * animationController.value / 2),
                    alignment: Alignment.centerLeft,
                    child: Scaffold(
                      appBar: AppBar(
                        leading: IconButton(
                          onPressed: toggle,
                          icon: const Icon(Icons.menu),
                        ),
                      ),
                      body: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.green,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Swipe Left to Right to see the animation",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],

              // floatingActionButton: const BackHomeButton(),
            );
          },
        ),
      ),
    );
  }
}
