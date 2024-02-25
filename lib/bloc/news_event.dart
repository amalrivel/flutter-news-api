part of 'news_bloc.dart';

sealed class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

final class LoadEvent extends NewsEvent {
  final String search;

  const LoadEvent({required this.search});

  @override
  List<Object> get props => [search];
}
