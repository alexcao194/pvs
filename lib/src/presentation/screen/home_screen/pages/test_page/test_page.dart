import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pvs/src/presentation/screen/home_screen/pages/test_page/bloc/test_bloc/test_bloc.dart';
import 'package:pvs/src/service/app_router.dart';

import 'bloc/test_infor_bloc/test_infor_bloc.dart';


class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestInforBloc, TestInforState>(
      builder: (context, testInforState) {
        return BlocBuilder<TestBloc, TestState>(
          builder: (context, testState) {
            if(testInforState.test.name == null) return const CircularProgressIndicator();
            return SizedBox(
              width: double.infinity,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(testInforState.test.name!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 27, color: Colors.red)),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Thời gian ", style: TextStyle(fontSize: 17, color: Colors.black)),
                        const Icon(Icons.access_alarms_sharp),
                        Text(testInforState.test.time!.toString(), style: const TextStyle(fontSize: 17, color: Colors.black))
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Số câu hỏi ", style: TextStyle(fontSize: 17, color: Colors.black)),
                        const Icon(Icons.book_outlined),
                        Text(testInforState.test.totalTest!.toString(), style: const TextStyle(fontSize: 17, color: Colors.black)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Trạng thái ", style: TextStyle(fontSize: 17, color: Colors.black)),
                        (testInforState.test.hasDone!
                            ? const Icon(Icons.check_circle_outline, color: Colors.green)
                            : const Icon(Icons.cancel_outlined, color: Colors.red)),
                        (testInforState.test.hasDone!
                            ? const Text('xong', style: TextStyle(color: Colors.green))
                            : const Text('chưa hoàn thành', style: TextStyle(color: Colors.red)))
                      ],
                    ),
                    const SizedBox(height: 30),
                    TextButton(
                      onPressed: testInforState.test.hasDone!
                          ? () {}
                          : () {
                        BlocProvider.of<TestBloc>(context).add(const TestEventGet(lesson: 'lesson_1'));
                        AppRouter.navigatorKey.currentState?.pushNamed(AppRoutes.test);
                      },
                      child: Container(
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Text("Bắt đầu", style: TextStyle(fontSize: 17, color: Colors.white)),
                        ),
                      ),
                    )
                  ]),
            );
          },
        );
      },
    );
  }
}
