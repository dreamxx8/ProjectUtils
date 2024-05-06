import 'package:flutter/cupertino.dart';

class LoadingAnimate extends StatefulWidget {
  const LoadingAnimate({Key? key}) : super(key: key);

  @override
  State<LoadingAnimate> createState() => _LoadingAnimateState();
}

class _LoadingAnimateState extends State<LoadingAnimate>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;

  @override
  void initState() {
    _controller = new AnimationController(
        vsync: this, duration: const Duration(seconds: 1))
      ..repeat();
    _animation = new IntTween(begin: 0, end: 24).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      key: UniqueKey(),
      animation: _animation,
      builder: (BuildContext context, Widget? child){
        String frame = _animation.value.toString();
        return Image.asset(
          'packages/module_core/images/loading/refresh_ani_${frame}.png',
          gaplessPlayback: true,
        );
      }
    );
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();

  }
}
