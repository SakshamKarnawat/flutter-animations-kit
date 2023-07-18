import 'package:flutter/material.dart';

import '../common.dart';
import '../constants.dart';
import '../main.dart';

class SlideAndScaleDrawer extends StatefulWidget {
  const SlideAndScaleDrawer({super.key});
  static const routeName = PathNames.slideAndScaleDrawer;

  @override
  State<SlideAndScaleDrawer> createState() => _SlideAndScaleDrawerState();
}

class _SlideAndScaleDrawerState extends State<SlideAndScaleDrawer>
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
            double slide = maxSlide * animationController.value;
            double scale = 1 - (animationController.value * 0.3);
            return Scaffold(
              // * Note: No AppBar since it doens't look good with the animation
              body: Stack(
                children: [
                  //Drawer
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: drawerColor,
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Saksham",
                              style: TextStyles.headline2(
                                color: ColorConstants.white,
                                fontWeight: BolrOrNot.notBold,
                              ),
                            ),
                            Text(
                              "Karnawat",
                              style: TextStyles.headline2(
                                color: ColorConstants.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //Background
                  Transform(
                    transform: Matrix4.identity()
                      ..translate(slide)
                      ..scale(scale),
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: backgroundColor,
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
                ],
              ),
              floatingActionButton: const BackHomeButton(),
            );
          },
        ),
      ),
    );
  }
}
