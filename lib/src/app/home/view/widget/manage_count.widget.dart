import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

    if (count.isSending) socket.emitEvent({'p': count.count});

    socket.connection.on('server_to_clients_ok', (data) {
      count.isSending = false;
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        if (!count.isSending)
          GestureDetector(
            onTap: count.isSending
                ? null
                : () {
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
              const CircularProgressIndicator(
                color: Color(0xFF90CC76),
              ),
          ],
        ),
        if (!count.isSending)
          GestureDetector(
            onTap: count.isSending
                ? null
                : () {
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
