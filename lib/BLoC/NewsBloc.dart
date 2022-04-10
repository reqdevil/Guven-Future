// ignore_for_file: file_names

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:guven_future/Models/AppException.dart';
import 'package:guven_future/Models/News.dart';
import 'package:guven_future/Services/Manager/ServerManager.dart';
import 'package:guven_future/Utilities/Helpers.dart';
import 'package:equatable/equatable.dart';

part 'NewsEvent.dart';
part 'NewsState.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final ServerManager _serverManager = getIt<ServerManager>();

  NewsBloc() : super(const NewsInitial()) {
    on<GetNews>(
      (event, emit) => getNews(event, emit),
    );
  }

  void getNews(GetNews event, Emitter<NewsState> emit) async {
    try {
      emit(const NewsLoading());

      final _newsResponse = await _serverManager.getData(
        params: {
          "q": event.companyName,
          "from": "2022-03-10",
          "sortBy": "publishedAt"
        },
        parseFunction: (data) => newsFromJson(data),
      );

      emit(NewsLoaded(
        newsFromCache(_newsResponse.data!),
      ));
    } on AppException catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }

      emit(NewsError(e));
    }
  }
}
