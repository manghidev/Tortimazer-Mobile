import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// * View Models
import '/src/app/home/view/provider/ui/count_tortillas.view_model.dart';

// * Widgets
import '/src/app/home/view/widget/text.widget.dart';
import '/src/app/home/view/widget/count_input.widget.dart';
import '/src/app/home/view/widget/manage_count.widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CountTortillasViewModel()),
        ],
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget(),
            CountInputWidget(),
            ManageCountWidget(),
          ],
        ),
      ),
    );
  }
}
