import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_get_x/constants/colors.dart';
import 'package:student_get_x/constants/style.dart';
import 'package:student_get_x/models/student_model.dart';
import 'package:student_get_x/view/add_and_edit/student_add_and_edit_screen.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key, required this.studentModel});
  final Student studentModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(StudentAddAndEdit(action: ActionType.edit, model: studentModel));
        setData(studentModel);
      },
      child: Card(
        color: kblack12,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: kwhite,
              radius: 50,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image: FileImage(studentModel.image!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                  child: Text(
                overflow: TextOverflow.ellipsis,
                "Name : ${studentModel.name}",
                style: text14BlackBold,
              )),
            ),
          ],
        ),
      ),
    );
  }
}
