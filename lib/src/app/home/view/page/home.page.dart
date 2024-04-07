import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// * Providers
import '/src/app/home/view/provider/model/socket_io.provider.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountTortillasViewModel()),
        ChangeNotifierProvider(create: (_) => SocketIOProvider()),
      ],
      builder: (context, child) {
        final socket = Provider.of<SocketIOProvider>(context);
        final count = Provider.of<CountTortillasViewModel>(context);

        socket.connection.on('connect_error', (data) {
          count.error = true;
        });

        socket.connection.on('connect', (data) {
          count.error = false;
        });

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextWidget(),
              if (count.error)
                const Column(
                  children: [
                    Text(
                      'Error connecting to service',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text('Please check your internet connection'),
                    Text('Trying to reconnect'),
                    SizedBox(height: 10),
                    CircularProgressIndicator(
                      color: Color(0xFF90CC76),
                    )
                  ],
                ),
              if (!count.error) const CountInputWidget(),
              if (!count.error) const ManageCountWidget(),
            ],
          ),
        );
      },
    );
  }
}
