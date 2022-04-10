// ignore_for_file: file_names

part of 'NewsBloc.dart';

@immutable
abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class GetNews extends NewsEvent {
  final String companyName;

  const GetNews(this.companyName);
}
