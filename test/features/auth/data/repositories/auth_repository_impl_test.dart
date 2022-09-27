import 'package:ait_flutter_template/core/exception/failure.dart';
import 'package:ait_flutter_template/features/auth/data/datasources/auth_data_source.dart';
import 'package:ait_flutter_template/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDataSource extends Mock implements AuthDataSource {}

void main() {
  late AuthRepository sut;
  late MockDataSource mockDataSource;
  setUp(
    () {
      mockDataSource = MockDataSource();
      sut = AuthRepository(mockDataSource);
    },
  );
  group(
    'login',
    () {
      test('should return Network Failure when no Internet', () async {
        when(() => mockDataSource.login()).thenThrow(
          NetworkFailure(),
        );
        final result = await sut.login();
        expect(result, equals(Left(NetworkFailure())));
      });
    },
  );
}
