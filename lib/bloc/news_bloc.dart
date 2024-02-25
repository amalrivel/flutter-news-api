import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mini_project_2/models/news.dart';
import 'package:mini_project_2/services/news_services.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsServices _newsServices;
  NewsBloc(this._newsServices) : super(NewsInitial()) {
    on<LoadEvent>((event, emit) async {
      emit(LoadingState());
      try {
        final news = await _newsServices.getNews(event.search);
        emit(LoadedState(news));
      } catch (e) {
        emit(ErrorState(e.toString()));
      }
    });
  }
}
