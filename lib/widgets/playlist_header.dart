import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spotify_clone/data/data.dart';

class PlaylistHeader extends StatelessWidget {
  final Playlist playlist;

  const PlaylistHeader({super.key, required this.playlist});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              playlist.imageURL,
              height: 200.0,
              width: 200.0,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'PLAYLIST',
                      style: Theme.of(context).textTheme.overline!.copyWith(
                            fontSize: 12.0,
                          ),
                    ),
                    const SizedBox(height: 12.0),
                    Text(
                      playlist.name,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      playlist.description,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      'Created by ${playlist.creator} • ${playlist.songs.length} songs, ${playlist.duration}',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ]),
            )
          ],
        ),
        const SizedBox(height: 20.0),
        _PlaylistButtons(
          followers: playlist.followers,
        )
      ],
    );
  }
}

class _PlaylistButtons extends StatelessWidget {
  final String followers;
  const _PlaylistButtons({super.key, required this.followers});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 48.0,
              vertical: 20.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            backgroundColor: Theme.of(context).colorScheme.secondary,
            foregroundColor: Theme.of(context).iconTheme.color,
            textStyle: Theme.of(context).textTheme.caption!.copyWith(
                  fontSize: 12.0,
                  letterSpacing: 2.0,
                ),
          ),
          child: const Text('PLAY'),
          onPressed: () {},
        ),
        const SizedBox(width: 8.0),
        IconButton(
          icon: const Icon(Icons.favorite_border),
          iconSize: 30.0,
          onPressed: () {},
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_horiz),
          iconSize: 30.0,
        ),
        const Spacer(),
        Text(
          'FOLLOWERS\n $followers',
          style: Theme.of(context).textTheme.caption!.copyWith(
                fontSize: 12.0,
              ),
          textAlign: TextAlign.right,
        )
      ],
    );
  }
}
