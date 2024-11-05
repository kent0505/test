part of 'album_bloc.dart';

@immutable
sealed class AlbumEvent {}

class GetAlbums extends AlbumEvent {}
