import 'package:batch_student_starter/helper/objectbox.dart';
import 'package:batch_student_starter/model/course.dart';
import 'package:batch_student_starter/state/objectbox_state.dart';

class CourseDataSource {
  ObjectBoxInstance get objectBoxInstance => ObjectBoxState.objectBoxInstance!;

  Future<int> addCourse(Course course) async {
    try {
      return objectBoxInstance.addCourse(course);
    } catch (e) {
      return Future.value(0);
    }
  }

  Future<List<Course>> getCourse() async {
    try {
      return objectBoxInstance.getAllCourse();
    } catch (e) {
      return Future.value([]);
    }
  }
}
