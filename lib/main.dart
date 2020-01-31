import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_x_flutter/presentation/routes/route_generator.dart';
import 'package:project_x_flutter/presentation/bloc/product/bloc.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ProductBloc>(
            create: (context) =>
                di.sl<ProductBloc>()..add(GetAllProductEntries()),
          ),
        ],
        child: MaterialApp(
          title: 'Number Trivia',
          theme: ThemeData(
            primaryColor: Colors.green.shade800,
            accentColor: Colors.green.shade600,
          ),
          initialRoute: '/',
          onGenerateRoute: RouteGenerator.generateRoute,
        ));
  }
}
