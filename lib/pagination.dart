import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:http/http.dart' as http;
import 'package:tutorial/env.dart';
import 'package:tutorial/features/pagination/cubit/cubit.dart';
import 'package:tutorial/features/pagination/cubit/cubit_state.dart';

class CustomPagination extends StatefulWidget {
  const CustomPagination({super.key});

  @override
  State<CustomPagination> createState() => _CustomPaginationState();
}

class _CustomPaginationState extends State<CustomPagination> {
  final baseUrl = AppEnvironment.baseAPiUrl;
  int page = 0;
  final int _limit = 20;
  bool _isFirstLoadRunning = false;
  bool _hasNextPage = true;
  bool _isLoadMoreRunning = false;
  bool _isScrollFull = false;
  List _posts = [];
  late ScrollController _controller;
  PaginationCubit? _paginationCubit;

  void _firstLoad() async {
    setState(() {
      _isFirstLoadRunning = true;
    });
    try {
      final res =
          await http.get(Uri.parse("$baseUrl?_page=$page&_limit=$_limit"));
      setState(() {
        _posts = json.decode(res.body);
      });
    } catch (err) {
      if (kDebugMode) {
        print("Something went wrong..");
      }
    }

    setState(() {
      _isFirstLoadRunning = false;
    });
  }

  void _loadmore() async {
    if (_hasNextPage == true &&
        _isFirstLoadRunning == false &&
        _isLoadMoreRunning == false &&
        _controller.position.extentAfter < 300) {
      setState(() {
        _isLoadMoreRunning = true;
      });
      page += 1;
      try {
        final res = await http.get(
          Uri.parse("$baseUrl?_page=$page&_limit=$_limit"),
        );

        final List fetchedPosts = json.decode(res.body);
        if (fetchedPosts.isNotEmpty) {
          setState(() {
            _posts.addAll(fetchedPosts);
          });
        } else {
          setState(() {
            _hasNextPage = false;
            _isLoadMoreRunning = false;
            _isScrollFull = true;
          });
        }
      } catch (err) {
        if (kDebugMode) {
          print("Something went wrong.");
        }
      }
      setState(() {
        _isLoadMoreRunning = false;
      });
    }
  }

  Widget getWidget(int index) {
    return Card(
      color: Colors.black45,
      margin: const EdgeInsets.all(10),
      child: ListTile(
        selectedColor: Colors.amber,
        leading: Text('${index + 1}'),
        title: Text(_posts[index]['title']),
        contentPadding: const EdgeInsets.all(10),
        subtitle: Text(
          _posts[index]['body'],
          textAlign: TextAlign.left,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  @override
  void initState() {
    _paginationCubit = BlocProvider.of<PaginationCubit>(context);
    _controller = ScrollController()
      ..addListener(() {
        _loadmore();
      });
    _firstLoad();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaginationCubit, PaginationState>(
        builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Pagination'),
        ),
        body: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: _posts.length,
                  controller: _controller,
                  itemBuilder: (context, index) {
                    if (_posts.length == index + 1) {
                      if (_isLoadMoreRunning == true) {
                        return const Center(
                            child: SizedBox(
                                width: 15,
                                height: 15,
                                child: CircularProgressIndicator()));
                      } else {
                        return getWidget(index);
                      }
                    } else {
                      return getWidget(index);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
