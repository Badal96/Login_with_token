import 'package:apricotspace_task/view/pages/home/cubit/home_cubit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final homeCubit = context.read<HomeCubit>();
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  homeCubit.logout();
                  context.router.back();
                },
                icon: const Icon(Icons.login)),
          ),
          body: const Center(
            child: Text(
              'Home',
              style: TextStyle(color: Colors.red),
            ),
          ),
        );
      },
    );
  }
}
