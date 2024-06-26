import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stage_insta/core/data/story_repository.dart';
import 'package:stage_insta/feature/story/bloc/story_bloc.dart';
import 'package:stage_insta/feature/story/ui/pages/story_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<StoryBloc>(
          create: (_) => StoryBloc(
            storyRepository: StoryRepository(),
          ),
        ),
      ],
      child: const MaterialApp(
        title: 'Flutter Stories',
        home: StoryList(),
      ),
    );
  }
}
