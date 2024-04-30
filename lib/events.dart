import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class PostEvent extends Equatable {
  const PostEvent();
}

class LoadPostEvent extends PostEvent {
  @override
  List<Object> get props => [];
}
