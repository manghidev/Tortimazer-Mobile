import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// * Providers
import '/src/app/home/view/provider/model/socket_io.provider.dart';

// * View Models
import '/src/app/home/view/provider/ui/count_tortillas.view_model.dart';

class ManageCountWidget extends StatelessWidget {
  const ManageCountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final count = Provider.of<CountTortillasViewModel>(context);
    final socket = Provider.of<SocketIOProvider>(context);

    late Timer timer = Timer(const Duration(seconds: 0), () {});

    if (timer.isActive) timer.cancel();

    if (count.isSending) {
      socket.emitEvent({'p': count.count});

      timer = Timer(const Duration(seconds: 15), () {
        count.isSending = false;
        SharedPreferences.getInstance().then((preferences) {
          count.count = preferences.getInt('count') ?? 30;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Tormimazer not responding, try again later'),
            ),
          );
        });
      });
    }

    socket.connection.on('server_to_clients_ok', (data) {
      count.isSending = false;
      SharedPreferences.getInstance().then((preferences) {
        preferences.setInt('count', count.count);
      });
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        if (!count.isSending)
          GestureDetector(
            onTap: () {
              count.decrement();
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: count.isSending ? Colors.grey : Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.remove,
                color: Colors.black,
              ),
            ),
          ),
        Column(
          children: [
            if (count.isSending)
              const Text('Send new number of tortillas to Tortimazer'),
            const SizedBox(height: 10),
            if (count.isSending)
              const CircularProgressIndicator.adaptive(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF90CC76)),
              ),
          ],
        ),
        if (!count.isSending)
          GestureDetector(
            onTap: () {
              count.increment();
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: count.isSending ? Colors.grey : const Color(0xFFA2BD6A),
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
