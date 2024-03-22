import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// * View Models
import '/src/app/home/view/provider/ui/count_tortillas.view_model.dart';

class CountInputWidget extends StatelessWidget {
  const CountInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final countTortillasViewModel =
        Provider.of<CountTortillasViewModel>(context);

    return SizedBox(
      height: 150,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            'Count of tortillas:',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            '${countTortillasViewModel.count}',
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
