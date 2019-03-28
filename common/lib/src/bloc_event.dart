import 'package:equatable/equatable.dart';

abstract class BlocEvent extends Equatable {
  BlocEvent([List props = const []]) : super(props);
}