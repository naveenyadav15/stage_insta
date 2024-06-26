import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stage_insta/core/data/story_repository.dart';
import 'package:stage_insta/feature/story/bloc/story_event.dart';
import 'package:stage_insta/feature/story/bloc/story_state.dart';
import 'package:stage_insta/feature/story/modal/story_model.dart';

class StoryBloc extends Bloc<StoryEvent, StoryState> {
  final StoryRepository storyRepository;

  StoryBloc({required this.storyRepository}) : super(StoryInitial()) {
    on<LoadStories>((event, emit) async {
      try {
        final stories = await storyRepository.fetchStories();
        emit(StoriesLoaded(stories: stories, currentIndex: 0));
      } catch (e) {
        emit(StoryError('Failed to load stories'));
      }
    });
    on<SelectStory>((event, emit) async {
      emit(StoriesLoaded(
          stories: event.stories, currentIndex: event.storyIndex));
    });
    on<NextImage>((event, emit) async {
      final currentState = state;
      if (currentState is StoriesLoaded) {
        final currentIndex = currentState.currentIndex;
        final currentStory = currentState.stories[currentIndex];
        if (_hasNextImage(currentStory, currentState)) {
          emit(StoryLoading());
          emit(currentState.copyWith(
              currentIndex: currentIndex,
              currentImageIndex: currentState.currentImageIndex + 1));
        } else {
          if (_hasNextStory(currentState)) {
            emit(StoryLoading());

            emit(StoriesLoaded(
                stories: currentState.stories,
                currentIndex: currentIndex + 1,
                currentImageIndex: 0));
          } else {
            emit(currentState); // No more stories to navigate
          }
        }
      }
    });

    on<PreviousImage>((event, emit) async {
      final currentState = state;
      if (currentState is StoriesLoaded) {
        final currentIndex = currentState.currentIndex;
        final currentStory = currentState.stories[currentIndex];
        if (_hasPreviousImage(currentStory, currentState)) {
          emit(StoryLoading());
          emit(currentState.copyWith(
              currentIndex: currentIndex,
              currentImageIndex: currentState.currentImageIndex - 1));
        } else {
          if (_hasPreviousStory(currentState)) {
            final previousStory = currentState.stories[currentIndex - 1];
            emit(StoryLoading());
            emit(StoriesLoaded(
                stories: currentState.stories,
                currentIndex: currentIndex - 1,
                currentImageIndex: previousStory.imageUrls.length - 1));
          } else {
            emit(currentState); // No previous stories to navigate
          }
        }
      }
    });
  }

  bool _hasNextImage(Story story, StoriesLoaded storiesLoadedState) {
    return story.imageUrls.length > 1 &&
        storiesLoadedState.currentImageIndex < story.imageUrls.length - 1;
  }

  bool _hasPreviousImage(Story story, StoriesLoaded storiesLoadedState) {
    return story.imageUrls.length > 1 &&
        storiesLoadedState.currentImageIndex > 0;
  }

  bool _hasNextStory(StoriesLoaded currentState) {
    return currentState.currentIndex < currentState.stories.length - 1;
  }

  bool _hasPreviousStory(StoriesLoaded currentState) {
    return currentState.currentIndex > 0;
  }
}
