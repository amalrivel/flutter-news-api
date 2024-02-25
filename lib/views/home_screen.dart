import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_project_2/bloc/news_bloc.dart';
import 'package:mini_project_2/models/news.dart';
import 'package:mini_project_2/services/news_services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Portal'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Ketika ikon pencarian ditekan, lakukan tindakan pencarian di sini
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
          ),
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "News API",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 48.0,
                fontWeight: FontWeight.bold
              ),
            ),
            Text("Please search for news"),
            Text('Powered by NewsAPI')
          ],
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    // Actions for AppBar while searching
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          // Clear the search query
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Leading icon on the left of the AppBar
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        // Close the search page and go back
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NewsBloc(NewsServices())..add(LoadEvent(search: query)),
      child: BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
        if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ErrorState) {
          return Center(
            child: Text(state.error),
          );
        } else if (state is LoadedState) {
          List<NewsModel> newsModel = state.news.take(5).toList();
          return ListView.builder(
              itemCount: newsModel.length,
              itemBuilder: (context, index) {
                var data = newsModel[index];
                return InkWell(
                  onTap: () => context.goNamed('details',extra:data),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 2.0, horizontal: 16.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Text(
                              data.title.toString(),
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Image.network(data.urlToImage != null
                                ? data.urlToImage.toString()
                                : 'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg'),
                            Text(data.description.toString()),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
        }
        return Container();
      }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBloc(NewsServices())
        ..add(const LoadEvent(search: "apple")),
      child: BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
        if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ErrorState) {
          return Center(
            child: Text(state.error),
          );
        } else if (state is LoadedState) {
          List<NewsModel> newsModel = state.news.take(3).toList();
          return ListView.builder(
              itemCount: newsModel.length,
              itemBuilder: (context, index) {
                var data = newsModel[index];
                return InkWell(
                  onTap: () => context.goNamed('details',extra:data),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 2.0, horizontal: 16.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Text(
                              data.title.toString(),
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Image.network(data.urlToImage != null
                                ? data.urlToImage.toString()
                                : 'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg'),
                            Text(data.description.toString()),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
        }
        return Container();
      }),
    );
  }
}
