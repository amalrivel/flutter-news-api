import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mini_project_2/models/news.dart';

class DetailScreen extends StatelessWidget {
  final NewsModel? object;

  const DetailScreen({super.key, this.object});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News Details"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(object!.urlToImage.toString()),
              const SizedBox(height: 8.0),
              Text(
                object!.title.toString(),
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                DateFormat('dd MMMM yyyy').format(
                  DateTime.parse(object!.publishedAt.toString()).toLocal()),
                style: const TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w300
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                object!.content.toString(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
