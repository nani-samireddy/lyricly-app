/// Song Model
///
/// This model is used to store the song data and also to convert the data to and from json.
///
/// The model has the following properties:
///
/// - title: The title of the song
/// - artist: The artist of the song
/// - album: The album of the song
/// - albumArt: The album art of the song
/// - url: The url of the song
/// - lyrics: The lyrics of the song
/// - englishLyrics: The english lyrics of the song
/// - englishTitle: The english title of the song
/// - id: The id of the song
/// - isFavorite: The favorite status of the song
///
class Song {
  final String title;
  final String artist;
  final String album;
  final String albumArt;
  final String url;
  final String lyrics;
  final String englishLyrics;
  final String englishTitle;
  final String id;
  final bool isFavorite;

  Song({
    required this.title,
    required this.artist,
    required this.album,
    required this.albumArt,
    required this.url,
    required this.lyrics,
    required this.englishLyrics,
    required this.englishTitle,
    required this.id,
    this.isFavorite = false,
  });

  Song copyWith({
    String? title,
    String? artist,
    String? album,
    String? albumArt,
    String? url,
    String? lyrics,
    String? englishLyrics,
    String? englishTitle,
    String? id,
    bool? isFavorite,
  }) {
    return Song(
      title: title ?? this.title,
      artist: artist ?? this.artist,
      album: album ?? this.album,
      albumArt: albumArt ?? this.albumArt,
      url: url ?? this.url,
      lyrics: lyrics ?? this.lyrics,
      englishLyrics: englishLyrics ?? this.englishLyrics,
      englishTitle: englishTitle ?? this.englishTitle,
      id: id ?? this.id,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'artist': artist,
      'album': album,
      'albumArt': albumArt,
      'url': url,
      'lyrics': lyrics,
      'englishLyrics': englishLyrics,
      'englishTitle': englishTitle,
      'id': id,
      'isFavorite': isFavorite,
    };
  }

  factory Song.fromMap(Map<String, dynamic> map) {
    return Song(
      title: map['title'] as String,
      artist: map['artist'] as String,
      album: map['album'] as String,
      albumArt: map['albumArt'] as String,
      url: map['url'] as String,
      lyrics: map['lyrics'] as String,
      englishLyrics: map['englishLyrics'] as String,
      englishTitle: map['englishTitle'] as String,
      id: map['id'] as String,
      isFavorite: map['isFavorite'] as bool? ?? false,
    );
  }

  @override
  String toString() {
    return 'Song(title: $title, artist: $artist, album: $album, albumArt: $albumArt, url: $url, lyrics: $lyrics, englishLyrics: $englishLyrics, englishTitle: $englishTitle, id: $id, isFavorite: $isFavorite)';
  }
}
