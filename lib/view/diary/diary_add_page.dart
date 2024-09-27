import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workout_app/textstyle.dart';
class DiaryAddPage extends ConsumerWidget {
  const DiaryAddPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DateTime now = DateTime.now();
    String formattedDate = "${now.month}月${now.day}日";
    var diaryController = TextEditingController();
    String diary;
    List<Map<String,String>> contents=[];
    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: EdgeInsets.all(12),
              child: GestureDetector(
              child: Container(
                height: 30,
                width: 80,
                decoration: BoxDecoration(color: Colors.orange,borderRadius: BorderRadius.circular(20)),
                child: Center(child: Text('追加する',style: MyTextStyles.body.bold.white)),
              ),
              onTap: (){
                diary = diaryController.text;
                contents.add({formattedDate:diary});
                 Navigator.pop(context);
                 print(contents);
              },
                ),
            )
          ],
        ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Text(formattedDate,style: MyTextStyles.title.large.bold),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 15,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: '今日の筋トレはどうでしたか？',
                  ),
                  controller: diaryController,
                  autofocus: true,
                )
              ),
        ]),
      ),
    );
  }
}
