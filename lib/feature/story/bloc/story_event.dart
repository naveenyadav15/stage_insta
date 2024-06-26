import 'package:flutter/cupertino.dart';
import 'package:stage_insta/feature/story/modal/story_model.dart';

@immutable
abstract class StoryEvent {}

class LoadStories extends StoryEvent {}

class NextImage extends StoryEvent {}

class PreviousImage extends StoryEvent {}

class NextStory extends StoryEvent {}

class PreviousStory extends StoryEvent {}

class SelectStory extends StoryEvent {
  final int storyIndex;
  final List<Story> stories;

  SelectStory(this.storyIndex, {required this.stories});
}
