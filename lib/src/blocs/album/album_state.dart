part of 'album_bloc.dart';

@immutable
sealed class AlbumState {}

final class AlbumInitial extends AlbumState {}

final class AlbumLoading extends AlbumState {}

final class AlbumLoaded extends AlbumState {
  AlbumLoaded({required this.albums});
  final List<Album> albums;
}

final class AlbumError extends AlbumState {}
