/**
 * Songs Controller
 * 
 * This controller handles getting the data from hive database and new data on refresh from the api and also handles the search functionality of the app.
 * and Maintains the favorite songs list.
 */

import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:lyricly/models/song_model.dart';
import 'package:http/http.dart' as http;

class SongsController {
  late Box<Song> _songsBox;

  Future<void> init() async {
    await Hive.openBox<Song>('songs');
    _songsBox = Hive.box<Song>('songs');
  }

  Future<List<Song>> getAllSongs() async {
    return _songsBox.values.toList();
  }

  Future<void> addSong(Song song) async {
    await _songsBox.add(song);
  }

  Future<void> updateSong(Song song) async {
    await _songsBox.put(song.id, song);
  }

  Future<void> deleteSong(Song song) async {
    await _songsBox.delete(song.id);
  }

  Future<void> clearAllSongs() async {
    await _songsBox.clear();
  }

  Future<List<Song>> searchSongs(String query) async {
    return _songsBox.values
        .where((song) =>
            song.title.toLowerCase().contains(query.toLowerCase()) ||
            song.artist.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  Future<List<Song>> getFavoriteSongs() async {
    return _songsBox.values.where((song) => song.isFavorite).toList();
  }

  Future<void> toggleFavorite(Song song) async {
    await _songsBox.put(song.id, song.copyWith(isFavorite: !song.isFavorite));
  }

  Future<void> refreshSongs(List<Song> songs) async {
    // Clear all the songs from the database
    await clearAllSongs();

    ///
    /// Get the songs from the api and add them to the database
    /// API_URL: https://script.google.com/macros/s/AKfycbzsBPrt_4oEtjRq0AuEFGXIt5-ZrHgXRDSFMo6FDExGGcAwzFmPymwNCBXT0_E4WsLLPg/exec
    ///
    final result = await http.get(Uri.parse(
        'https://script.google.com/macros/s/AKfycbzsBPrt_4oEtjRq0AuEFGXIt5-ZrHgXRDSFMo6FDExGGcAwzFmPymwNCBXT0_E4WsLLPg/exec'));
    final songs = jsonDecode(result.body);
    for (final song in songs) {
      final newSong = Song.fromMap(song);
      if (newSong != null) {
        await addSong(newSong); // Add the song to the database
      }
    }
  }
}
