part of 'news_bloc.dart';

sealed class NewsState extends Equatable {
  const NewsState();
  
  @override
  List<Object> get props => [];
}

final class NewsInitial extends NewsState {}

final class LoadingState extends NewsState {
  @override
  List<Object> get props => [];
}

final class LoadedState extends NewsState {
  final List<NewsModel> news;
  const LoadedState(this.news);

  @override
  List<Object> get props => [];
}

final class ErrorState extends NewsState {
  final String error;
  const ErrorState(this.error);

  @override
  List<Object> get props => [];
}
