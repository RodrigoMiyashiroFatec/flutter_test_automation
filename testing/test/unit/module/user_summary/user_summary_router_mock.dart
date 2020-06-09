import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testing/model/simple_alert_dto.dart';
import 'package:testing/modules/user_summary/user_summary_router.dart';

import 'user_summary_view_with_bloc_mock.dart';

class UserSummaryRouterMock implements UserSummaryRoutable {
  int callsToAvailableCloseView = 0;
  int callsToAvailableCreateModule = 0;
  int callsToAvailableNavigateTo = 0;
  int callsToAvailableShowAlert = 0;

  @override
  void closeView(BuildContext context) {
    callsToAvailableCloseView += 1;
  }

  @override
  StatefulWidget createModule() {
    callsToAvailableCreateModule += 1;

    return UserSummaryViewWithBlocMock();
  }

  @override
  void navigateTo(BuildContext context, String routerName) {
    callsToAvailableNavigateTo += 1;
  }

  @override
  void showAlert(BuildContext context, SimpleAlertDTO simpleAlertDTO) {
    callsToAvailableShowAlert += 1;
  }
}