class UserPreferences {
  final double maxBudget;
  final int tripDays;
  final int peopleCount;
  final List<String> preferredTags;
  final String? lastVisitedDestinationId;

  const UserPreferences({
    this.maxBudget = 10000.0,
    this.tripDays = 3,
    this.peopleCount = 2,
    this.preferredTags = const [],
    this.lastVisitedDestinationId,
  });

  UserPreferences copyWith({
    double? maxBudget,
    int? tripDays,
    int? peopleCount,
    List<String>? preferredTags,
    String? lastVisitedDestinationId,
  }) {
    return UserPreferences(
      maxBudget: maxBudget ?? this.maxBudget,
      tripDays: tripDays ?? this.tripDays,
      peopleCount: peopleCount ?? this.peopleCount,
      preferredTags: preferredTags ?? this.preferredTags,
      lastVisitedDestinationId: lastVisitedDestinationId ?? this.lastVisitedDestinationId,
    );
  }

  Map<String, dynamic> toJson() => {
        'maxBudget': maxBudget,
        'tripDays': tripDays,
        'peopleCount': peopleCount,
        'preferredTags': preferredTags,
        'lastVisitedDestinationId': lastVisitedDestinationId,
      };

  factory UserPreferences.fromJson(Map<String, dynamic> json) {
    return UserPreferences(
      maxBudget: (json['maxBudget'] as num?)?.toDouble() ?? 10000.0,
      tripDays: json['tripDays'] as int? ?? 3,
      peopleCount: json['peopleCount'] as int? ?? 2,
      preferredTags: List<String>.from(json['preferredTags'] ?? []),
      lastVisitedDestinationId: json['lastVisitedDestinationId'] as String?,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserPreferences &&
          maxBudget == other.maxBudget &&
          tripDays == other.tripDays &&
          peopleCount == other.peopleCount &&
          const ListEquality().equals(preferredTags, other.preferredTags) &&
          lastVisitedDestinationId == other.lastVisitedDestinationId;

  @override
  int get hashCode =>
      Object.hash(maxBudget, tripDays, peopleCount, preferredTags, lastVisitedDestinationId);
}

// For ListEquality
class ListEquality<E> {
  const ListEquality();

  bool equals(List<E>? list1, List<E>? list2) {
    if (identical(list1, list2)) return true;
    if (list1 == null || list2 == null) return false;
    if (list1.length != list2.length) return false;
    for (int i = 0; i < list1.length; i++) {
      if (list1[i] != list2[i]) return false;
    }
    return true;
  }
}
