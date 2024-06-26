import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stage_insta/feature/story/bloc/story_bloc.dart';
import 'package:stage_insta/feature/story/bloc/story_event.dart';
import 'package:stage_insta/feature/story/bloc/story_state.dart';
import 'package:stage_insta/feature/story/ui/widgets/cached_image.dart';
import 'package:stage_insta/feature/story/ui/widgets/progress_bar.dart';

class StoryView extends StatefulWidget {
  final StoriesLoaded storyState;

  const StoryView({super.key, required this.storyState});

  @override
  State<StoryView> createState() => _StoryViewState();
}

class _StoryViewState extends State<StoryView>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  final CarouselController _carouselController = CarouselController();
  final int _duration = 1; // Default duration in seconds per image

  @override
  void initState() {
    super.initState();
    context.read<StoryBloc>().add(
          SelectStory(
            widget.storyState.currentIndex,
            stories: widget.storyState.stories,
          ),
        );

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: _duration),
    )..addListener(() {});

    // Start animation when page changes
    _animationController!.forward();

    // Listen for changes in image index and update animation duration accordingly
    _animationController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Move to next image when animation completes
        if (widget.storyState.currentImageIndex <
            widget.storyState.stories[widget.storyState.currentIndex].imageUrls
                    .length -
                1) {
          // _animationController!.duration = Duration(seconds: _duration);
          _animationController!.reset();
          _animationController!.forward();
        } else {
          // Move to next story if available
          if (widget.storyState.currentIndex <
              widget.storyState.stories.length - 1) {
            _animationController!.duration = Duration(seconds: _duration);
            _animationController!.reset();
            _animationController!.forward();
          } else {
            // Go back if no more stories
            Navigator.of(context).pop();
          }
        }
      }
    });
  }

  @override
  void didUpdateWidget(covariant StoryView oldWidget) {
    super.didUpdateWidget(oldWidget);
    context.read<StoryBloc>().add(
          SelectStory(
            widget.storyState.currentIndex,
            stories: widget.storyState.stories,
          ),
        );
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<StoryBloc, StoryState>(
          builder: (context, state) {
            if (state is StoriesLoaded) {
              final currentStory = state.stories[state.currentIndex];
              // _duration = currentStory.imageUrls.length *
              //     5; // Adjust duration based on number of images

              return GestureDetector(
                // onTapDown: (details) {
                //   // Pause animation on tap
                //   _animationController?.stop();
                // },
                // onTapUp: (details) {
                //   // Resume animation on release
                //   _animationController?.forward();
                // },
                // onTapRight: () {
                //   context.read<StoryBloc>().add(NextImage());
                // },
                // onTapLeft: () {
                //   context.read<StoryBloc>().add(PreviousImage());
                // },
                onTapUp: (details) {
                  final width = MediaQuery.of(context).size.width;
                  if (details.globalPosition.dx < width / 2) {
                    context.read<StoryBloc>().add(PreviousImage());
                  } else {
                    context.read<StoryBloc>().add(NextImage());
                  }
                },
                child: Column(
                  children: [
                    Container(
                      color: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                '${state.currentImageIndex + 1} / ${currentStory.imageUrls.length}',
                                style: const TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: List.generate(
                              currentStory.imageUrls.length,
                              (index) => Expanded(
                                child: Container(
                                  height: 5,
                                  padding: const EdgeInsets.only(left: 2),
                                  child: ColorAnimatedLinearProgressDemo(
                                    startNow: index == state.currentImageIndex,
                                    isFinished: index < state.currentImageIndex,
                                    animationDuration:
                                        Duration(seconds: _duration),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          CarouselSlider.builder(
                            carouselController: _carouselController,
                            itemCount: currentStory.imageUrls.length,
                            itemBuilder: (context, index, realIndex) {
                              return getCachedImage(
                                url: currentStory
                                    .imageUrls[state.currentImageIndex],
                              );
                            },
                            options: CarouselOptions(
                              height: double.infinity,
                              viewportFraction: 1.0,
                              enableInfiniteScroll: false,
                              autoPlay: false,
                              autoPlayInterval: Duration(
                                  milliseconds: (_duration * 1000) + 500),
                              onPageChanged: (index, reason) {
                                if ((index > state.currentImageIndex)) {
                                  context.read<StoryBloc>().add(NextImage());
                                } else {
                                  context
                                      .read<StoryBloc>()
                                      .add(PreviousImage());
                                }
                                _carouselController.animateToPage(index);
                                _animationController!.reset();
                                // _animationController!.duration =
                                //     Duration(seconds: _duration);
                                _animationController!.forward();
                              },
                            ),
                          ),
                          Positioned(
                            top: 40,
                            left: 20,
                            child: Text(
                              currentStory.title,
                              style: const TextStyle(
                                fontSize: 24,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
