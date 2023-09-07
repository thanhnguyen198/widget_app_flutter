import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:widget_app/BLoc/Home/home_bloc.dart';
import 'package:widget_app/BLoc/Home/home_event.dart';
import 'package:widget_app/BLoc/Home/home_state.dart';
import 'package:widget_app/Models/News/ResponseNews.dart';
import 'package:widget_app/colors/hexColor.dart';
import '../components/home/detailNew.dart';
import '../components/home/newItem.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
  }

  Future<Void> _refreshNews() {
    return Future.delayed(Duration.zero);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(const GetNewsEvent(page: 1)),
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "What's New",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            backgroundColor: HexColor.redNav,
          ),
          backgroundColor: HexColor.bgDark,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "assets/homeImage.png",
                fit: BoxFit.fitWidth,
              ),
              Expanded(
                child: SizedBox(
                  child: BlocConsumer<HomeBloc, HomeState>(
                    listener: (context, state) {
                      if (_refreshController.isRefresh) {
                        _refreshController.refreshCompleted();
                      }
                    },
                    builder: (context, state) {
                      if (state is NewsState) {
                        return SmartRefresher(
                          enablePullDown: true,
                          controller: _refreshController,
                          onRefresh: () {
                            context
                                .read<HomeBloc>()
                                .add(const RefreshNewsEvent());
                          },
                          child: ListView.builder(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            itemCount: state.news.length,
                            itemBuilder: (context, index) => NewItem(
                              title: state.news[index].title,
                              typeNew: state.news[index].categoryName,
                              date: state.news[index].createdAt,
                              isNew: state.news[index].isNew(),
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  backgroundColor: Colors.transparent,
                                  builder: (context) {
                                    return DetailNew(
                                      detailNew: state.news[index],
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        );
                      }
                      return Container();
                    },
                  ),
                ),
              )
            ],
          )),
    );
  }
}
