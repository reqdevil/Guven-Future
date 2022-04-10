// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guven_future/BLoC/NewsBloc.dart';
import 'package:guven_future/Models/News.dart';
import 'package:guven_future/Services/HiveService.dart';
import 'package:guven_future/Utilities/AppColors.dart';
import 'package:guven_future/Utilities/Constants.dart';
import 'package:guven_future/Utilities/Helpers.dart';
import 'package:guven_future/Widgets/CustomAppBar.dart';
import 'package:guven_future/Widgets/CustomDrawer.dart';
import 'package:guven_future/Widgets/LoadingPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final NewsBloc _newsBloc;
  final HiveService _hiveService = getIt<HiveService>();

  List<News> newsList = [];

  @override
  void initState() {
    super.initState();

    _newsBloc = NewsBloc();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: const CustomAppBar(
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder(
        bloc: _newsBloc,
        builder: (context, state) {
          if (state is NewsLoading) {
            return LoadingPage(
              body: Container(
                color: Colors.red,
              ),
            );
          } else if (state is NewsLoaded) {
            newsList = state.newsList;

            return _loadedBody();
          }

          // News Error
          return _errorBody();
        },
      ),
    );
  }

  Widget _loadedBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(top: 10, right: 15, bottom: 5),
          child: Text(
            'Toplam Kayıt: ' + newsList.length.toString(),
          ),
          decoration: BoxDecoration(
            color: AppColors.panel,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: newsList.length,
            itemBuilder: (context, index) {
              return _buildNewsCard(newsList[index], index);
            },
          ),
        ),
      ],
    );
  }

  Widget _errorBody() {
    return Container(
      color: Colors.blue,
    );
  }

  Widget _buildNewsCard(News news, int i) {
    return Dismissible(
      key: Key(news.title),
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        width: 315,
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: i % 2 == 0
                  ? AppColors.cardBackground1
                  : AppColors.cardBackground2,
            ),
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 20,
              top: 5,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  news.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: i % 2 == 0
                        ? AppColors.cardBackground2
                        : AppColors.white,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  news.description,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 15,
                    color: i % 2 == 0
                        ? AppColors.cardBackground2
                        : AppColors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      direction: DismissDirection.startToEnd,
      onDismissed: (_) {
        setState(() {
          newsList.removeAt(i);
          _hiveService.clearBoxes(NEWS_LIST);
          _hiveService.addBoxesFromList(newsList, NEWS_LIST);
        });
      },
    );
  }

  void getNews() async {
    _newsBloc.add(const GetNews("tesla"));
  }
}
