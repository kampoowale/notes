import 'package:alert/core/entities/entity_list.dart';
import 'package:equatable/equatable.dart';

abstract class UIState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DefaultState extends UIState {}

class OnLoaded extends UIState {
  final EntityList richTextEntities;

  OnLoaded(this.richTextEntities);

  @override
  List<Object?> get props => [richTextEntities];
}

class OnSuccess extends UIState {}
class OnLoading extends UIState {}

class OnError extends UIState {
  final String message;

  OnError(this.message);

  @override
  List<Object?> get props => [message];
}