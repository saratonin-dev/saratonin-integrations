import 'package:integrations_client/integrations_client.dart';
import 'package:test/test.dart';

void main() {
  group('Machine models', () {
    test('Machine.fromJson parses correctly', () {
      final json = {
        'id': 'pm_123',
        'name': 'Medieval Madness',
        'manufacturer': 'Williams',
        'year': 1997,
        'features': ['multiball', 'video_mode'],
      };

      final machine = Machine.fromJson(json);

      expect(machine.id, equals('pm_123'));
      expect(machine.name, equals('Medieval Madness'));
      expect(machine.manufacturer, equals('Williams'));
      expect(machine.year, equals(1997));
      expect(machine.features, contains('multiball'));
    });

    test('Machine.toJson serializes correctly', () {
      const machine = Machine(
        id: 'pm_456',
        name: 'Attack from Mars',
        manufacturer: 'Bally',
        year: 1995,
      );

      final json = machine.toJson();

      expect(json['id'], equals('pm_456'));
      expect(json['name'], equals('Attack from Mars'));
    });

    test('MachinesResponse.fromJson parses correctly', () {
      final json = {
        'machines': [
          {'id': 'pm_1', 'name': 'Machine 1'},
          {'id': 'pm_2', 'name': 'Machine 2'},
        ],
        'machineCount': 2,
      };

      final response = MachinesResponse.fromJson(json);

      expect(response.machines.length, equals(2));
      expect(response.machineCount, equals(2));
    });
  });

  group('League models', () {
    test('Tournament.fromJson parses correctly', () {
      final json = {
        'id': 42,
        'name': 'Monday Night League',
        'status': 'active',
        'playerCount': 16,
      };

      final tournament = Tournament.fromJson(json);

      expect(tournament.id, equals(42));
      expect(tournament.name, equals('Monday Night League'));
      expect(tournament.status, equals('active'));
      expect(tournament.playerCount, equals(16));
    });

    test('Standing.fromJson parses correctly', () {
      final json = {
        'rank': 1,
        'playerId': 123,
        'playerName': 'John Doe',
        'points': 100.5,
        'wins': 10,
        'losses': 2,
      };

      final standing = Standing.fromJson(json);

      expect(standing.rank, equals(1));
      expect(standing.playerId, equals(123));
      expect(standing.playerName, equals('John Doe'));
      expect(standing.points, equals(100.5));
    });
  });

  group('Auth models', () {
    test('AuthTokens.fromJson parses correctly', () {
      final json = {
        'accessToken': 'abc123',
        'refreshToken': 'xyz789',
        'expiresIn': 900,
        'tokenType': 'Bearer',
      };

      final tokens = AuthTokens.fromJson(json);

      expect(tokens.accessToken, equals('abc123'));
      expect(tokens.refreshToken, equals('xyz789'));
      expect(tokens.expiresIn, equals(900));
      expect(tokens.tokenType, equals('Bearer'));
    });

    test('User.fromJson parses correctly', () {
      final json = {
        'id': 'user-123',
        'phone': '+15551234567',
        'isAdmin': false,
        'createdAt': '2024-01-15T10:30:00.000Z',
      };

      final user = User.fromJson(json);

      expect(user.id, equals('user-123'));
      expect(user.phone, equals('+15551234567'));
      expect(user.isAdmin, isFalse);
    });
  });

  group('Score models', () {
    test('LocalScore.fromJson parses correctly', () {
      final json = {
        'id': 'score-123',
        'machineId': 'pm_456',
        'playerName': 'Player One',
        'score': 1000000,
        'timestamp': '2024-01-15T10:30:00.000Z',
      };

      final score = LocalScore.fromJson(json);

      expect(score.id, equals('score-123'));
      expect(score.machineId, equals('pm_456'));
      expect(score.playerName, equals('Player One'));
      expect(score.score, equals(1000000));
    });
  });
}
