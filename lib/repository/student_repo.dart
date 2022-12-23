import 'package:batch_student_starter/data_source/local_data_source/student_data_source.dart';

import '../model/student.dart';

abstract class StudentRepository {
  Future<List<Student>> getStudent();
  Future<int> addStudent(Student student);
}

class StudentRepositoryImpl extends StudentRepository {
  @override
  Future<int> addStudent(Student student) async{
    return StudentDataSource().addStudent(student);
  }

  @override
  Future<List<Student>> getStudent() async {
    return StudentDataSource().getStudent();
  }
}
