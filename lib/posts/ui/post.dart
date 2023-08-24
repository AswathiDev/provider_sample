import 'package:bloc_provider_sample/colors/bloc/colors_bloc.dart';
import 'package:bloc_provider_sample/posts/bloc/posts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  State<Posts> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Posts> {
  late final PostsBloc _postBloc = BlocProvider.of<PostsBloc>(context);
  late final ColorsBloc _colorBloc =
      BlocProvider.of<ColorsBloc>(context); //
  @override
  void initState() {
    super.initState();
    _postBloc.add(PostInitialFetchEvent()); // Trigger initial fetch
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {
           final colorsBloc = context.read<ColorsBloc>(); // Assuming you have access to the bloc

    // Accessing the current color state outside of the builder
    final currentState = colorsBloc.state;
        final currentColor = currentState.color;

        final passColor = currentColor==Colors.blue?Colors.yellow:Colors.blue;

    print('current ${currentColor}');
        print('going to pass ${passColor}');

            _colorBloc.add(ChangeBackgroundEvent(passColor));
          }, icon:  BlocBuilder<ColorsBloc, ColorsState>(
            builder: (context, state) {
                            final successState = state as ColorsChanged;
        print('passd ${successState.color}');

              return Icon(
                Icons.refresh,
                color: successState.color,
              );
            },
          ))
        ],
        title: const Text('Bloc provider '),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<PostsBloc, PostsState>(
              builder: (context, state) {
                if (state is PostLoadingState) {
                  return const CircularProgressIndicator();
                } else if (state is PostsLoadingSuccessState) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.posts.length,
                      itemBuilder: (context, index) => Container(
                          margin: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 239, 154, 131)),
                          child:
                              ListTile(title: Text(state.posts[index].title))),
                    ),
                  );
                } else if (state is PostFetchErrorState) {
                  return const Text('Error');
                }
                return const Text('Unhandled state.');
              },
            ),
            // BlocBuilder<ColorsBloc, ColorsState>(
            //   builder: (context, state) {
            //                   final successState = state as ChangeBackgroundEvent;

            //     return FloatingActionButton(backgroundColor:successState.,
            //       onPressed: () {
            //         _colorBloc.add(ChangeBackgroundEvent(Colors.blue));
            //       },
            //       child: const Icon(Icons.color_lens),
            //     );
            //   },
            // ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
