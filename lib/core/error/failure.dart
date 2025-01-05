import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final List? properties;

  const Failure([this.properties]);

  @override
  List<Object?> get props => [properties];
}

class CacheFailure extends Failure{}