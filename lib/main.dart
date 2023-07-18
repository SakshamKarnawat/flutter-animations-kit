import 'package:animations_kit/animations/slide_and_scale_drawer.dart';
import 'package:animations_kit/constants.dart';
import 'package:flutter/material.dart';

import 'animation_gallery.dart';
import 'animation_list.dart';
import 'animation_model.dart';
import 'animations/3d_flip_scaffold.dart';

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
        SlideAndScaleDrawer.routeName: (context) => const SlideAndScaleDrawer(),
        Scaffold3DFlip.routeName: (context) => const Scaffold3DFlip(),
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
      height: MediaQuery.of(context).size.height * 0.75,
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
                      fontWeight: BolrOrNot.bold,
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
              Sizes.defaultVerticalSpacer(),
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

class AnimationList extends StatefulWidget {
  const AnimationList({super.key});

  @override
  State<AnimationList> createState() => _AnimationListState();
}

class _AnimationListState extends State<AnimationList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(Sizes.defaultPadding),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return AnimationTile(animationList[index]);
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
  final AnimationModel animationModel;

  const AnimationTile(this.animationModel, {super.key});

  @override
  State<AnimationTile> createState() => _AnimationTileState();
}

class _AnimationTileState extends State<AnimationTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.animationModel.name),
      subtitle: Text(widget.animationModel.description),
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
      onTap: () {
        Navigator.of(context).pushNamed(widget.animationModel.route,
            arguments: widget.animationModel.animationBy);
      },
    );
  }
}
