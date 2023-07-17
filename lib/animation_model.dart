import 'package:animations_kit/main.dart';

class AnimationModel {
  final String name;
  final String description;
  final String route;
  final AnimationBy? animationBy;
  final String? gifPath;

  AnimationModel({
    required this.name,
    required this.description,
    required this.route,
    this.animationBy,
    this.gifPath,
  });
}
