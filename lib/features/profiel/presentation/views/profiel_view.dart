import 'package:flutter/material.dart';
import 'package:pet_pass/features/Profiel/presentation/views/widgets/profiel_view_body.dart';

class ProfielView extends StatelessWidget {
  const ProfielView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: ProfielViewBody()));
  }
}
