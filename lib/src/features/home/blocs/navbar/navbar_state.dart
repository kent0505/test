part of 'navbar_bloc.dart';

@immutable
sealed class NavbarState {}

final class NavbarFirst extends NavbarState {}

final class NavbarSecond extends NavbarState {}
