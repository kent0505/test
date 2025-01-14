import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/album/album.dart';
import '../../features/album/album_api.dart';

part 'album_event.dart';
part 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final _api = AlbumApi();

  AlbumBloc() : super(AlbumInitial()) {
    on<AlbumEvent>(
      (event, emit) => switch (event) {
        GetAlbums() => _getAlbums(event, emit),
      },
    );
  }

  Future<void> _getAlbums(
    GetAlbums event,
    Emitter<AlbumState> emit,
  ) async {
    emit(AlbumLoading());
    try {
      List<Album> albums = await _api.fetchAlbums();
      emit(AlbumLoaded(albums: albums));
    } on Object catch (_) {
      emit(AlbumError());
    }
  }
}
