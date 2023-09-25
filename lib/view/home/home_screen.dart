import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_get_x/constants/colors.dart';
import 'package:student_get_x/constants/space.dart';
import 'package:student_get_x/controllers/getx/student_list_controller.dart';
import 'package:student_get_x/view/add_and_edit/student_add_and_edit_screen.dart';
import 'package:student_get_x/view/home/widget/card.dart';

final listController = Get.put(StudentListController());

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    listController.getStudents('');
    return Scaffold(
      backgroundColor: kgreenAccent,
      appBar: AppBar(
        backgroundColor: kgreenAccent,
        elevation: 0,
        title: const Text('Student Register'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              kheight5,
              Padding(
                padding: const EdgeInsets.only(left: 3, right: 3),
                child: SizedBox(
                  height: 45,
                  child: CupertinoSearchTextField(
                    style: const TextStyle(color: kblack),
                    controller: searchController,
                    onChanged: (value) async {
                      await listController.getStudents(value);
                    },
                  ),
                ),
              ),
              kheight5,
              Expanded(
                child: GetX<StudentListController>(
                  builder: (listController) {
                    return GridView.builder(
                      itemCount: listController.studentList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 1,
                              crossAxisSpacing: 1),
                      itemBuilder: (context, index) {
                        return CardWidget(
                          studentModel: listController.studentList[index],
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          clear();
          Get.to(StudentAddAndEdit(action: ActionType.add));
        },
        child: const Icon(CupertinoIcons.person_add),
      ),
    );
  }
}
