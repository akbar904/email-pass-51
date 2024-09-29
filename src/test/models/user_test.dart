
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:your_package_name/models/user.dart';

void main() {
	group('User Model', () {
		test('User model should be instantiated correctly', () {
			final user = User(email: 'test@example.com', password: 'password123');

			expect(user.email, 'test@example.com');
			expect(user.password, 'password123');
		});

		test('User model should support serialization to JSON', () {
			final user = User(email: 'test@example.com', password: 'password123');
			final userJson = user.toJson();

			expect(userJson, {
				'email': 'test@example.com',
				'password': 'password123',
			});
		});

		test('User model should support deserialization from JSON', () {
			final userJson = {
				'email': 'test@example.com',
				'password': 'password123',
			};
			final user = User.fromJson(userJson);

			expect(user.email, 'test@example.com');
			expect(user.password, 'password123');
		});
	});
}
