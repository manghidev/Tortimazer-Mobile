import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// * View Models
import '/src/app/home/view/provider/ui/count_tortillas.view_model.dart';

class ManageCountWidget extends StatelessWidget {
  const ManageCountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final countTortillasViewModel =
        Provider.of<CountTortillasViewModel>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {
            countTortillasViewModel.decrement();
          },
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.remove,
              color: Colors.black,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            countTortillasViewModel.increment();
          },
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: const Color(0xFFA2BD6A),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
