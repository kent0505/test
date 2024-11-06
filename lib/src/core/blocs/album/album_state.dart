part of 'album_bloc.dart';

@immutable
sealed class AlbumState {}

class AlbumInitial extends AlbumState {}

class AlbumLoading extends AlbumState {}

class AlbumLoaded extends AlbumState {
  AlbumLoaded({required this.albums});

  final List<Album> albums;
}

class AlbumError extends AlbumState {}
