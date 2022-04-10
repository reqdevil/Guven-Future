// ignore_for_file: file_names

part of 'NewsBloc.dart';

@immutable
abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {
  const NewsInitial();
}

class NewsLoading extends NewsState {
  const NewsLoading();
}

class NewsLoaded extends NewsState {
  final List<News> newsList;

  const NewsLoaded(this.newsList);
}

class NewsError extends NewsState {
  final AppException exception;

  const NewsError(this.exception);
}
