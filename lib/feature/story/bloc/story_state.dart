import 'package:flutter/material.dart';
import 'package:stage_insta/feature/story/modal/story_model.dart';

@immutable
abstract class StoryState {}

class StoryInitial extends StoryState {}

class StoryLoading extends StoryState {}

class StoriesLoaded extends StoryState {
  final List<Story> stories;
  final int currentIndex;
  final int currentImageIndex;

  StoriesLoaded({
    required this.stories,
    required this.currentIndex,
    this.currentImageIndex = 0,
  });

  StoriesLoaded copyWith({int? currentIndex, int? currentImageIndex}) {
    return StoriesLoaded(
      stories: stories,
      currentIndex: currentIndex ?? this.currentIndex,
      currentImageIndex: currentImageIndex ?? this.currentImageIndex,
    );
  }
}

class StoryError extends StoryState {
  final String message;

  StoryError(this.message);
}
