part of 'email_bloc.dart';

@immutable
abstract class EmailState {}

class EmailInitial extends EmailState {}

class Success extends EmailState {}

class Sending extends EmailState {}

class Failure extends EmailState {}
