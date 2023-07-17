import 'package:flutter/material.dart';

abstract class PaginationState {}

class PaginationInitial extends PaginationState {}

class PaginationSuccess extends PaginationState {
  PaginationSuccess(List posts,int page);
}

class PaginationError extends PaginationState {}

class PaginationLoading extends PaginationState {
  PaginationLoading(this.widget);
  Widget widget;
}
