import 'package:animations_kit/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.kAppName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const HomeScreen(),
        PathNames.slideAndScaleDrawer: (context) => const SlideAndScaleDrawer(),
      },
      initialRoute: '/',
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
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: const AnimationList(),
    );
  }
}

class AnimationList extends StatefulWidget {
  const AnimationList({super.key});

  @override
  State<AnimationList> createState() => _AnimationListState();
}

class _AnimationListState extends State<AnimationList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        AnimationTile(
          name: AnimationNames.slideAndScaleDrawer,
          subtitle: AnimationDescriptions.slideAndScaleDrawer,
          route: PathNames.slideAndScaleDrawer,
        ),
      ],
    );
  }
}

class AnimationTile extends StatefulWidget {
  final String name;
  final String subtitle;
  final String route;

  const AnimationTile({
    super.key,
    required this.name,
    required this.subtitle,
    required this.route,
  });

  @override
  State<AnimationTile> createState() => _AnimationTileState();
}

class _AnimationTileState extends State<AnimationTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.name),
      subtitle: Text(widget.subtitle),
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
      onTap: () {
        Navigator.of(context).pushNamed(widget.route);
      },
    );
  }
}

class SlideAndScaleDrawer extends StatefulWidget {
  const SlideAndScaleDrawer({super.key});

  @override
  State<SlideAndScaleDrawer> createState() => _SlideAndScaleDrawerState();
}

class _SlideAndScaleDrawerState extends State<SlideAndScaleDrawer>
    with SingleTickerProviderStateMixin {
  final drawerColor = Colors.blue;
  final backgroundColor = Colors.white;
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
    return WillPopScope(
      onWillPop: () async => true,
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
                backgroundColor: ColorConstants.white,
                appBar: AppBar(
                  backgroundColor: ColorConstants.white,
                  leading: GestureDetector(
                    onTap: toggle,
                    child: const Icon(Icons.menu),
                  ),
                  title: const Text(AnimationNames.slideAndScaleDrawer),
                ),
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
                              Text("Saksham",
                                  style: TextStyles.headline2(
                                    color: ColorConstants.white,
                                    fontWeight: FontWeight.normal,
                                  )),
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
                            // TODO: Add animation demo GIF
                            Placeholder(),
                            BackButton(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ));
          },
        ),
      ),
    );
  }
}
