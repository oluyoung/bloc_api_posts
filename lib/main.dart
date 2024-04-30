import 'package:bloc_api/events.dart';
import 'package:bloc_api/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './repo.dart';
import './bloc.dart';
import './state.dart';

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
      home: RepositoryProvider(
          create: (context) => PostRepository(), child: const Home()),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc(
        RepositoryProvider.of<PostRepository>(context),
      )..add(LoadPostEvent()),
      child: Scaffold(
          appBar: AppBar(title: const Text('The bloc app')),
          body: BlocBuilder<PostBloc, PostState>(
            builder: (context, state) {
              if (state is PostLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is PostLoadedState) {
                List<PostModel> posts = state.posts;
                return ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (_, index) {
                    PostModel _post = posts[index];
                    return Card(
                        color: Colors.amber[800],
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          title: Text(_post.post['title']),
                          subtitle: Text(_post.post['body']),
                        ));
                  },
                );
                // const Center(child: Text('The second state'));
              }

              return Container();
            },
          )),
    );
  }
}

/*
 const Center(child: CircularProgressIndicator());
   cBuilder<PostBloc, PostState>(builder: (context, state) {
        if (state is PostLoadingState) {
          return     }
        if (state is PostLoadedState) {
          List<PostModel> postList = state.posts;
          return ListView.builder(
            itemCount: postList.length,
            itemBuilder: (_, index) {
              return Card(
                color: Colors.yellow[600],
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  title: Text(postList[index].title),
                subtitle: Text(postList[index].body                                                                                                      4)
                ),
                );
            },
          )
        }
  })
  */
  