import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stage_insta/feature/story/bloc/story_bloc.dart';
import 'package:stage_insta/feature/story/bloc/story_event.dart';
import 'package:stage_insta/feature/story/bloc/story_state.dart';
import 'package:stage_insta/feature/story/ui/pages/story_view.dart';

class StoryList extends StatelessWidget {
  const StoryList({super.key});

  final double radius = 75;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Instagram Stories',
        ),
      ),
      body: BlocBuilder<StoryBloc, StoryState>(
        builder: (context, state) {
          if (state is StoryInitial) {
            context.read<StoryBloc>().add(LoadStories());
            return const Center(child: CircularProgressIndicator());
          } else if (state is StoriesLoaded) {
            return SizedBox(
              height: 90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.stories.length,
                itemBuilder: (context, index) {
                  final story = state.stories[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StoryView(
                            storyState: state,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 75,
                      width: 75,
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            story.imageUrls.first,
                          ),
                          // Replace with your image
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else if (state is StoryError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
