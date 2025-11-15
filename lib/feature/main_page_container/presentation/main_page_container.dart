import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_task/di/di.dart';
import 'package:form_task/feature/main_page_container/domain/cubit/main_page_cubit.dart';
import 'package:form_task/feature/main_page_container/domain/cubit/main_page_state.dart';

class MainPageContainer extends StatefulWidget {
  final Widget child;
  const MainPageContainer({super.key, required this.child});

  @override
  State<MainPageContainer> createState() => _MainPageContainerState();
}

class _MainPageContainerState extends State<MainPageContainer> {
  late final MainPageCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = getIt<MainPageCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              top: kToolbarHeight,
              child: BlocBuilder<MainPageCubit, MainPageState>(
                bloc: _cubit,
                builder: (context, state) {
                  if (state is MainPageStateInitial) {
                    return widget.child;
                  } else if (state is MainPageStateLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is MainPageStateReady) {
                    return Center(
                      child: Text('Page ready', style: TextStyle(color: Colors.white)),
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
