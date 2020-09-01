import 'package:flutter/material.dart';
import 'package:random_colors/models/history/color_history/color_history.dart';
import 'package:random_colors/services/generators/color_generator.dart';
import 'package:provider/provider.dart';

class MainView extends StatefulWidget {
  MainView({Key key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final String _titleText = 'Hey there';

  @override
  Widget build(BuildContext context) {
    final history = context.watch<ColorHistory>();
    final subTitleText = history.index != null
        ? '#${history.index + 1} in a list of ${history.colors.length} colors'
        : 'Tap on the screen';

    final backgroundColor = history.current ?? Colors.white;
    final textColor =
        ColorGenerator.getTextColorFromBackground(backgroundColor);

    final title = Text(
      _titleText,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 40,
        color: textColor,
      ),
    );

    final subTitle = Text(
      subTitleText,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 25,
        color: textColor,
      ),
    );

    return GestureDetector(
      onTap: () => addColor(),
      onHorizontalDragEnd: (details) => onHorizontalDrag(details),
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              title,
              subTitle,
            ],
          ),
        ),
      ),
    );
  }

  void onHorizontalDrag(DragEndDetails details) {
    if (details.primaryVelocity == 0) return;

    if (details.primaryVelocity.compareTo(0) == -1)
      toNextColor();
    else
      toPreviousColor();
  }

  void addColor() {
    context.read<ColorHistory>().add(ColorGenerator.getRandomPrimaryColor());
  }

  void toNextColor() {
    context.read<ColorHistory>().toNext();
  }

  void toPreviousColor() {
    context.read<ColorHistory>().toPrevious();
  }
}
