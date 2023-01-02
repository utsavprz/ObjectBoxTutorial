import 'package:batch_student_starter/model/batch.dart';
import 'package:batch_student_starter/model/course.dart';
import 'package:batch_student_starter/model/student.dart';
import 'package:path_provider/path_provider.dart';

import '../objectbox.g.dart';

//this is a database
class ObjectBoxInstance {
  late final Store _store;
  late final Box<Batch> _batch;
  late final Box<Student> _student;
  late final Box<Course> _course;

  //constructors
  ObjectBoxInstance(this._store) {
    _batch = Box<Batch>(_store);
    _student = Box<Student>(_store);
    _course = Box<Course>(_store);

    insertBatches();
    insertCourses();
  }
//initalization of object box

  static Future<ObjectBoxInstance> init() async {
    var dir = await getApplicationDocumentsDirectory();
    final store = Store(
      //tells what entities the model has
      getObjectBoxModel(),
      directory: '${dir.path}.student_course',
    );

    return ObjectBoxInstance(store);
  }

  //--------Batch Queries--------
  int addBatch(Batch batch) {
    return _batch.put(batch);
  }

  List<Batch> getAllBatch() {
    return _batch.getAll();
  }

  void insertBatches() {
    List<Batch> lstBatches = getAllBatch();
    if (lstBatches.isEmpty) {
      addBatch(Batch('29-A'));
      addBatch(Batch('29-B'));
      addBatch(Batch('28-A'));
      addBatch(Batch('28-B'));
    }
  }
  //--------Student Queries--------

  int addStudent(Student student) {
    return _student.put(student);
  }

  List<Student> getAllStudent() {
    return _student.getAll();
  }

  //--------Course Queries--------
  int addCourse(Course course) {
    return _course.put(course);
  }

  List<Course> getAllCourse() {
    return _course.getAll();
  }

  void insertCourses() {
    List<Course> lstCourses = getAllCourse();
    if (lstCourses.isEmpty) {
      addCourse(Course('Mobile Development'));
      addCourse(Course('Web API'));
      addCourse(Course('Design Thinking'));
      addCourse(Course('Data Analysis'));
    }
  }
}
