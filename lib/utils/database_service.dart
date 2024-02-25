import 'package:firebase_database/firebase_database.dart';

class DatabaseService {
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref();

  /// 데이터 생성 (Create)
  Future<void> createData(String path, Map<String, dynamic> data) async {
    try {
      await _dbRef.child(path).set(data);
      print('Data created successfully at $path');
    } catch (e) {
      print('Failed to create data: $e');
    }
  }

  /// 데이터 읽기 (Read)
  Future<dynamic> readData(String path) async {
    try {
      final snapshot = await _dbRef.child(path).get();
      if (snapshot.exists) {
        print('Data at $path: ${snapshot.value}'); // 콘솔에 데이터 출력
        return snapshot.value; // 데이터 반환
      } else {
        print('No data available at $path');
        return null; // 데이터가 없는 경우 null 반환
      }
    } catch (e) {
      print('Failed to read data: $e');
      return null; // 예외 발생 시 null 반환
    }
  }

  /// 데이터 업데이트 (Update)
  Future<void> updateData(String path, Map<String, dynamic> updates) async {
    try {
      await _dbRef.child(path).update(updates);
      print('Data updated successfully at $path');
    } catch (e) {
      print('Failed to update data: $e');
    }
  }

  /// 데이터 삭제 (Delete)
  Future<void> deleteData(String path) async {
    try {
      await _dbRef.child(path).remove();
      print('Data deleted successfully at $path');
    } catch (e) {
      print('Failed to delete data: $e');
    }
  }
}
