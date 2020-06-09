//import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:testing/model/simple_alert_dto.dart';
import 'package:testing/modules/user_summary/user_summary_interactor.dart';
import 'package:testing/modules/user_summary/user_summary_presenter.dart';
import 'package:testing/ui/widgets/simple_alert.dart';
//import 'package:testing/ui/widgets/user_summary_bloc.dart';
import 'package:testing/ui/widgets/user_summary_view_with_bloc.dart';

abstract class UserSummaryRoutable {
  StatefulWidget createModule();
  void navigateTo(BuildContext context, String routerName);
  void showAlert(BuildContext context, SimpleAlertDTO simpleAlertDTO);
  void closeView(BuildContext context);
}

class UserSummaryRouter implements UserSummaryRoutable {
  @override
//  StatefulWidget createModule() {
//    return _instanceModule();
//
//    return BlocProvider(
//      blocs: [
//        Bloc((i) => UserSummaryBloc()),
//      ],
//      child: MaterialApp(
//        home: _instanceModule(),
//      ),
//    );
//  }

  StatefulWidget createModule() {
    UserSummaryInteractable userSummaryInteractable = UserSummaryInteractor();
    UserSummaryPresentable userSummaryPresentable = UserSummaryPresenter();
    UserSummaryViewable userSummaryViewable = UserSummaryViewWithBloC();

    userSummaryPresentable.userSummaryInteractable = userSummaryInteractable;
    userSummaryPresentable.userSummaryRoutable = this;
    userSummaryViewable.userSummaryPresenter = userSummaryPresentable;
    userSummaryInteractable.userSummaryPresentable = userSummaryPresentable;

    return userSummaryViewable;
  }

  @override
  void navigateTo(BuildContext context, String routerName) {
    Navigator.of(context).pushNamed(routerName);
  }

  @override
  void showAlert(BuildContext context, SimpleAlertDTO simpleAlertDTO) {
    SimpleAlert simpleAlert = SimpleAlert(simpleAlertDTO: simpleAlertDTO);
    simpleAlert.build(context);
  }

  @override
  void closeView(BuildContext context) {
    Navigator.of(context).pop();
  }
}