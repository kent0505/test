import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/album_bloc.dart';
import '../loading_widget.dart';
import '../../widgets/custom_scaffold.dart';
import '../../widgets/texts/text_widget.dart';

class AlbumsPage extends StatefulWidget {
  const AlbumsPage({super.key});

  @override
  State<AlbumsPage> createState() => _AlbumsPageState();
}

class _AlbumsPageState extends State<AlbumsPage> {
  final controller3 = TextEditingController();
  final controller4 = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<AlbumBloc>().add(GetAlbums());
  }

  @override
  void dispose() {
    controller3.dispose();
    controller4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: BlocBuilder<AlbumBloc, AlbumState>(
        builder: (context, state) {
          if (state is AlbumLoading) {
            return const LoadingWidget();
          }

          if (state is AlbumLoaded) {
            return ListView.builder(
              itemCount: state.albums.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextWidget(
                    state.albums[index].title,
                    fontSize: 12,
                    maxLines: 2,
                  ),
                );
              },
            );
          }

          return Container();
        },
      ),
    );
  }
}