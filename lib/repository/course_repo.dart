import 'package:batch_student_starter/data_source/local_data_source/course_data_source.dart';
import 'package:batch_student_starter/model/course.dart';

abstract class CourseRepository {
  Future<List<Course>> getCourse();
  Future<int> addCourse(course);
}

class CourseRepositoryImpl extends CourseRepository {
  @override
  Future<int> addCourse(course) {
    return CourseDataSource().addCourse(course);
  }

  @override
  Future<List<Course>> getCourse() {
    return CourseDataSource().getCourse();
  }
}
