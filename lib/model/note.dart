class Note {
  final String? document;
  final String content;
  final String userId;
  final int order;

  Note(
      {this.document,
      required this.content,
      required this.userId,
      required this.order});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Note &&
        other.document == document &&
        other.content == content &&
        other.userId == userId;
  }

  @override
  int get hashCode => document.hashCode ^ content.hashCode ^ userId.hashCode;
}
