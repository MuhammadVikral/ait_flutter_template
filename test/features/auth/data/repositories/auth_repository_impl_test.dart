import 'package:ait_flutter_template/features/auth/data/datasources/auth_data_source.dart';
import 'package:ait_flutter_template/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDataSource extends Mock implements AuthDataSource {}

void main() {
  late AuthRepositoryImpl sut;
  late MockDataSource mockDataSource;
  setUp(
    () {
      mockDataSource = MockDataSource();
    },
  );
  group('login', () {
    test('login Failed', () {});
  });
}
