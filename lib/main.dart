import 'package:bloc_provider_sample/colors/bloc/colors_bloc.dart';
import 'package:bloc_provider_sample/posts/bloc/posts_bloc.dart';
import 'package:bloc_provider_sample/posts/ui/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
            // home: BlocProvider(create: (context)=>PostsBloc(),child:const Posts(),),

      home: MultiBlocProvider(providers: [
        BlocProvider<PostsBloc>(create: (context) => PostsBloc()),
        BlocProvider<ColorsBloc>(create: (context) => ColorsBloc()),
      ], child: const Posts()),
    );
  }
}

