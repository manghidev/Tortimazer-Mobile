import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
          if (!count.isNotifiedError) {
            count.isNotifiedError = true;
            count.errorConnection = true;
          }
        });

        socket.connection.on('connect', (data) {
          count.errorConnection = false;
          count.isNotifiedError = false;
        });

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  SharedPreferences.getInstance().then((preferences) {
                    preferences
                        .setBool('isLogged', false)
                        .then((value) => Navigator.pushNamed(context, '/login'))
                        .catchError(
                          (_) => ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('An error occurred'),
                            ),
                          ),
                        );
                  });
                },
                icon: const Icon(Icons.logout),
              ),
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextWidget(),
              if (count.errorConnection)
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        'Error connecting to service',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'The service is not available at the moment or the connection is unstable',
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Text('Trying to reconnect in a few moments...'),
                      SizedBox(height: 10),
                      CircularProgressIndicator.adaptive(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Color(0xFF90CC76)),
                      )
                    ],
                  ),
                ),
              if (!count.errorConnection) const CountInputWidget(),
              if (!count.errorConnection) const ManageCountWidget(),
            ],
          ),
        );
      },
    );
  }
}
