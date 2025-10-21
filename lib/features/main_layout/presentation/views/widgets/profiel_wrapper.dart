import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_pass/features/auth/presentation/manger/auth_cubit/auth_cubit.dart';

class ProfileWrapper extends StatefulWidget {
  final Widget child;

  const ProfileWrapper({super.key, required this.child});

  @override
  State<ProfileWrapper> createState() => _ProfileWrapperState();
}

class _ProfileWrapperState extends State<ProfileWrapper> {
  @override
  void initState() {
    super.initState();

    final currentState = context.read<AuthCubit>().state;
    if (currentState is! ProfileLoaded) {
      context.read<AuthCubit>().getUserProfile();
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
