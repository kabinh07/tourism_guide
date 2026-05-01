import 'package:flutter_test/flutter_test.dart';
import 'package:tourism_guide/features/recommendation/domain/entities/user_preferences.dart';

void main() {
  group('UserPreferences', () {
    test('creates instance with correct values', () {
      final prefs = UserPreferences(
        maxBudget: 10000.0,
        tripDays: 5,
        peopleCount: 3,
        preferredTags: ['beach', 'nature'],
      );

      expect(prefs.maxBudget, equals(10000.0));
      expect(prefs.tripDays, equals(5));
      expect(prefs.peopleCount, equals(3));
      expect(prefs.preferredTags, equals(['beach', 'nature']));
    });

    test('equality works correctly', () {
      final prefs1 = UserPreferences(
        maxBudget: 10000.0,
        tripDays: 5,
        peopleCount: 3,
        preferredTags: ['beach', 'nature'],
      );

      final prefs2 = UserPreferences(
        maxBudget: 10000.0,
        tripDays: 5,
        peopleCount: 3,
        preferredTags: ['beach', 'nature'],
      );

      expect(prefs1, equals(prefs2));
    });

    test('inequality works correctly', () {
      final prefs1 = UserPreferences(
        maxBudget: 10000.0,
        tripDays: 5,
        peopleCount: 3,
        preferredTags: ['beach', 'nature'],
      );

      final prefs2 = UserPreferences(
        maxBudget: 12000.0,
        tripDays: 5,
        peopleCount: 3,
        preferredTags: ['beach', 'nature'],
      );

      expect(prefs1, isNot(equals(prefs2)));
    });

    test('hashCode is consistent', () {
      final prefs = UserPreferences(
        maxBudget: 10000.0,
        tripDays: 5,
        peopleCount: 3,
        preferredTags: ['beach', 'nature'],
      );

      final hash1 = prefs.hashCode;
      final hash2 = prefs.hashCode;
      expect(hash1, equals(hash2));
    });

    test('toJson returns correct map', () {
      final prefs = UserPreferences(
        maxBudget: 10000.0,
        tripDays: 5,
        peopleCount: 3,
        preferredTags: ['beach', 'nature'],
      );

      final json = prefs.toJson();

      expect(json['maxBudget'], equals(10000.0));
      expect(json['tripDays'], equals(5));
      expect(json['peopleCount'], equals(3));
      expect(json['preferredTags'], equals(['beach', 'nature']));
    });

    test('fromJson creates correct instance', () {
      final json = {
        'maxBudget': 10000.0,
        'tripDays': 5,
        'peopleCount': 3,
        'preferredTags': ['beach', 'nature'],
      };

      final prefs = UserPreferences.fromJson(json);

      expect(prefs.maxBudget, equals(10000.0));
      expect(prefs.tripDays, equals(5));
      expect(prefs.peopleCount, equals(3));
      expect(prefs.preferredTags, equals(['beach', 'nature']));
    });

    test('fromJson and toJson are reversible', () {
      final original = UserPreferences(
        maxBudget: 8500.5,
        tripDays: 4,
        peopleCount: 2,
        preferredTags: ['tea', 'hills', 'nature'],
      );

      final json = original.toJson();
      final reconstructed = UserPreferences.fromJson(json);

      expect(reconstructed, equals(original));
    });

    test('fromJson handles empty preferredTags', () {
      final json = {
        'maxBudget': 5000.0,
        'tripDays': 2,
        'peopleCount': 1,
        'preferredTags': [],
      };

      final prefs = UserPreferences.fromJson(json);

      expect(prefs.preferredTags, isEmpty);
    });

    test('fromJson handles single tag', () {
      final json = {
        'maxBudget': 5000.0,
        'tripDays': 2,
        'peopleCount': 1,
        'preferredTags': ['beach'],
      };

      final prefs = UserPreferences.fromJson(json);

      expect(prefs.preferredTags, equals(['beach']));
    });

    test('toString is defined', () {
      final prefs = UserPreferences(
        maxBudget: 10000.0,
        tripDays: 5,
        peopleCount: 3,
        preferredTags: ['beach', 'nature'],
      );

      final string = prefs.toString();
      expect(string, isNotEmpty);
    });

    test('copy constructor maintains all fields', () {
      final prefs = UserPreferences(
        maxBudget: 10000.0,
        tripDays: 5,
        peopleCount: 3,
        preferredTags: ['beach', 'nature'],
      );

      final copy = prefs.copyWith();

      expect(copy.maxBudget, equals(prefs.maxBudget));
      expect(copy.tripDays, equals(prefs.tripDays));
      expect(copy.peopleCount, equals(prefs.peopleCount));
      expect(copy.preferredTags, equals(prefs.preferredTags));
    });

    test('copyWith can update budget', () {
      final prefs = UserPreferences(
        maxBudget: 10000.0,
        tripDays: 5,
        peopleCount: 3,
        preferredTags: ['beach', 'nature'],
      );

      final updated = prefs.copyWith(maxBudget: 15000.0);

      expect(updated.maxBudget, equals(15000.0));
      expect(updated.tripDays, equals(5));
    });

    test('copyWith can update tripDays', () {
      final prefs = UserPreferences(
        maxBudget: 10000.0,
        tripDays: 5,
        peopleCount: 3,
        preferredTags: ['beach', 'nature'],
      );

      final updated = prefs.copyWith(tripDays: 7);

      expect(updated.tripDays, equals(7));
      expect(updated.maxBudget, equals(10000.0));
    });

    test('copyWith can update preferredTags', () {
      final prefs = UserPreferences(
        maxBudget: 10000.0,
        tripDays: 5,
        peopleCount: 3,
        preferredTags: ['beach', 'nature'],
      );

      final updated = prefs.copyWith(preferredTags: ['mountain', 'forest']);

      expect(updated.preferredTags, equals(['mountain', 'forest']));
      expect(updated.maxBudget, equals(10000.0));
    });
  });
}
