import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tutorial/features/pagination/cubit/cubit_state.dart';
import 'package:tutorial/features/pagination/repository/pagination_repository.dart';

class PaginationCubit extends Cubit<PaginationState> {
  PaginationCubit(super.initialState);

  final PaginationRepository _paginationRepo = PaginationRepository();

  Future<void> LoadData(List<dynamic> posts, int page) async {
    emit(
      PaginationLoading(
        const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );

    var res = await _paginationRepo.firstLoad(page);
    if (res.statusCode == 200) {
      posts.addAll(res.data);
      emit(PaginationSuccess(posts, page));
    } else {
      emit(PaginationError());
    }
    print("Response: " + res.statusCode);
  }
}
