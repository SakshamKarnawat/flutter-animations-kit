import 'animation_model.dart';
import 'constants.dart';
import 'main.dart';

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
    gifPath: GifPaths.slideAndScaleDrawer,
  ),
  AnimationModel(
    name: AnimationNames.scaffold3dFlip,
    description: AnimationDescriptions.scaffold3dFlip,
    route: PathNames.scaffold3dFlip,
    animationBy: AnimationBy(
      name: "Marcin Szałek",
      organization: "Flutter Europe",
      referenceName:
          "Implementing complex UI with Flutter - Marcin Szałek | Flutter Europe",
      referenceUrl: "https://www.youtube.com/watch?v=FCyoHclCqc8",
    ),
    gifPath: GifPaths.scaffold3dFlip,
  ),
];
