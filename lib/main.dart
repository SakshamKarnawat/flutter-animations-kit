import 'package:animations_kit/constants.dart';
import 'package:flutter/material.dart';

import 'animation_gallery.dart';
import 'animation_model.dart';
import 'common.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ColorConstants.primary),
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

class WelcomeWidget extends StatefulWidget {
  const WelcomeWidget({super.key});

  @override
  State<WelcomeWidget> createState() => _WelcomeWidgetState();
}

class _WelcomeWidgetState extends State<WelcomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      color: ColorConstants.primary,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.defaultPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    AppConstants.appName.split(" ")[0],
                    style: TextStyles.headline2(
                      color: ColorConstants.white,
                      fontWeight: boldOrNot.bold,
                    ),
                  ),
                  Text(
                    " ${AppConstants.appName.split(" ")[1]}",
                    style: TextStyles.headline2(
                      color: ColorConstants.white,
                    ),
                  ),
                ],
              ),
              Text(
                "A collection of animations built using Flutter.",
                style: TextStyles.caption(color: ColorConstants.white),
              ),
              const Expanded(
                child: AnimationGallery(),
              ),
              Text(
                "by ${AppConstants.myName}",
                style: TextStyles.headline6(color: ColorConstants.white),
              ),
              const SizedBox(height: Sizes.defaultPadding),
            ],
          ),
        ),
      ),
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
    return const Scaffold(
      body: Column(
        children: [
          WelcomeWidget(),
          Expanded(
            child: AnimationList(),
          ),
        ],
      ),
    );
  }
}

final List<AnimationModel> animationList = [
  AnimationModel(
    name: AnimationNames.slideAndScaleDrawer,
    description: AnimationDescriptions.slideAndScaleDrawer,
    route: PathNames.slideAndScaleDrawer,
    animationBy: AnimationBy(
      name: "Marcin Szałek",
      organization: "Flutter Europe",
      referenceName:
          "Implementing complex UI with Flutter - Marcin Szałek | Flutter Europe",
      referenceUrl: "https://www.youtube.com/watch?v=FCyoHclCqc8",
    ),
    gifPath:
        "https://media3.giphy.com/media/v1.Y2lkPTc5MGI3NjExdzh4Y3c2MHplYXlsamljNmg2dHgyODFpYmR2bWxqanNrZW82dXAzNSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/BfbUe877N4xsUhpcPc/giphy.gif",
  ),
  AnimationModel(
    name: "XYZZZZ",
    description: "XSFDSFDSGDSGDGDSG DSG DSG DSG DS D S",
    route: PathNames.slideAndScaleDrawer,
    animationBy: AnimationBy(
      name: "Marcin Szałek",
      organization: "Flutter Europe",
      referenceName:
          "Implementing complex UI with Flutter - Marcin Szałek | Flutter Europe",
      referenceUrl: "https://www.youtube.com/watch?v=FCyoHclCqc8",
    ),
    gifPath:
        "https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExM2s1NXNmOXM3cHVlNHkyeGszbDBnY3dtcTkxenhtNGRlYTNjYmhneiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/3o85xAuO9kQ9c4mBFK/giphy.gif",
  ),
];

class AnimationList extends StatefulWidget {
  const AnimationList({super.key});

  @override
  State<AnimationList> createState() => _AnimationListState();
}

class _AnimationListState extends State<AnimationList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return AnimationTile(
          name: animationList[index].name,
          subtitle: animationList[index].description,
          route: animationList[index].route,
        );
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
      itemCount: animationList.length,
    );
  }
}

class AnimationBy {
  final String? name;
  final String? organization;
  final String? referenceName;
  final String? referenceUrl;
  final List<String>? socialMediaLinks;

  AnimationBy({
    this.name,
    this.organization,
    this.referenceName,
    this.referenceUrl,
    this.socialMediaLinks,
  });
}

class AnimationTile extends StatefulWidget {
  final String name;
  final String subtitle;
  final String route;
  final AnimationBy? animationBy;

  const AnimationTile({
    super.key,
    required this.name,
    required this.subtitle,
    required this.route,
    this.animationBy,
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
        Navigator.of(context)
            .pushNamed(widget.route, arguments: widget.animationBy);
      },
    );
  }
}

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
              backgroundColor: ColorConstants.white,
              appBar: AppBar(
                backgroundColor: ColorConstants.white,
                leading: IconButton(
                  onPressed: toggle,
                  icon: const Icon(Icons.menu),
                  splashRadius: 10,
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
                            Text(
                              "Saksham",
                              style: TextStyles.headline2(
                                color: ColorConstants.white,
                                fontWeight: boldOrNot.notBold,
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
                          // TODO: Add animation demo GIF
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            child: Placeholder(),
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
