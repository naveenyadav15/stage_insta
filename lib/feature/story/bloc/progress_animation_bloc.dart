import 'dart:async';

class ProgressAnimationBloc {
  double _progressValue = 0.0;
  final Duration _animationDuration;

  late StreamController<double> _progressController;
  late Stream<double> progressStream;

  ProgressAnimationBloc(this._animationDuration) {
    _progressController = StreamController<double>();
    progressStream = _progressController.stream;
  }

  void startAnimation() async {
    _progressValue = 0.0;
    await Future.delayed(const Duration(milliseconds: 500));
    for (double i = 0.0; i <= 1.0; i += 0.01) {
      if (_progressValue >= 1.0) break;
      _progressValue = i;
      _progressController.add(_progressValue);
      await Future.delayed(
          Duration(milliseconds: _animationDuration.inMilliseconds ~/ 100));
    }
  }

  void stopAnimation() {
    _progressValue = 0.0;
    _progressController.add(_progressValue);
  }

  void completeAnimation() {
    _progressValue = 1;
    _progressController.add(_progressValue);
  }

  void dispose() {
    _progressController.close();
  }
}
