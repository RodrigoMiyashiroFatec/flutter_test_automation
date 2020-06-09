import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:testing/modules/base_for_application/base_component_page.dart';
import 'package:testing/ui/widgets/user_summary_bloc.dart';

class BaseForApplicationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;

    return BlocProvider(
      blocs: [
        Bloc((i) => UserSummaryBloc()),
      ],
      child: MaterialApp(
        home: BaseComponentPage(
          platform: platform,
        ),
      ),
    );

//    return MaterialApp(
//      theme: ThemeData(
//        primaryColor: Colors.indigo
//      ),
//      home: BaseComponentPage(
//        platform: platform,
//      ),
//    );
  }
}
