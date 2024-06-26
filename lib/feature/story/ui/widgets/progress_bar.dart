import 'package:flutter/material.dart';
import 'package:stage_insta/feature/story/bloc/progress_animation_bloc.dart';

class ColorAnimatedLinearProgressDemo extends StatefulWidget {
  final bool startNow;
  final Duration animationDuration;
  final bool isFinished;

  const ColorAnimatedLinearProgressDemo({
    super.key,
    required this.startNow,
    required this.animationDuration,
    required this.isFinished,
  });

  @override
  State<ColorAnimatedLinearProgressDemo> createState() =>
      _ColorAnimatedLinearProgressDemoState();
}

class _ColorAnimatedLinearProgressDemoState
    extends State<ColorAnimatedLinearProgressDemo> {
  late ProgressAnimationBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = ProgressAnimationBloc(widget.animationDuration);

    if (widget.isFinished) {
      _bloc.completeAnimation();
    } else if (widget.startNow) {
      _bloc.startAnimation();
    } else {
      _bloc.stopAnimation();
    }
  }

  @override
  void didUpdateWidget(ColorAnimatedLinearProgressDemo oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.startNow != oldWidget.startNow) {
      if (widget.startNow) {
        _bloc.startAnimation();
      } else {
        _bloc.stopAnimation();
      }
    }
    if (widget.isFinished) {
      _bloc.completeAnimation();
    }
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder<double>(
        stream: _bloc.progressStream,
        initialData: 0.0,
        builder: (context, snapshot) {
          double progressValue = snapshot.data!;
          return AnimatedContainer(
            duration: widget.animationDuration,
            height: 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: LinearProgressIndicator(
                value: progressValue,
                backgroundColor: Colors.grey,
                valueColor: const AlwaysStoppedAnimation<Color>(
                  Colors.white,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
