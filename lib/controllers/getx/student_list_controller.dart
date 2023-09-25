import 'package:get/state_manager.dart';
import 'package:student_get_x/controllers/database/db_functions.dart';
import 'package:student_get_x/models/student_model.dart';

class StudentListController extends GetxController {
  DB sql = DB();

  RxList<Student> studentList = <Student>[].obs;

  Future<void> getStudents(String name) async {
    List<Student> tempList = await sql.getData();
    studentList.clear();
    studentList.addAll(
      tempList
          .where(
              (model) => model.name.toLowerCase().contains(name.toLowerCase()))
          .toList()
          .reversed,
    );
  }

  Future<void> deleteStudent(int id) async {
    await sql.deleteData(id);
    await getStudents('');
  }
}
