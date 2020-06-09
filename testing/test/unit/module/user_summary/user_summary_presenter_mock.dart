import 'package:flutter/src/widgets/framework.dart';
import 'package:testing/model/simple_alert_dto.dart';
import 'package:testing/model/user.dart';
import 'package:testing/modules/user_summary/user_summary_interactor.dart';
import 'package:testing/modules/user_summary/user_summary_presenter.dart';
import 'package:testing/modules/user_summary/user_summary_router.dart';
import 'package:testing/ui/widgets/user_summary_bloc.dart';

class UserSummaryPresenterMock implements UserSummaryPresenterControllable {
  int callsToAvailableCloseView = 0;
  int callsToAvailableDidRetrieveUserSummary = 0;
  int callsToAvailableSelectedCell = 0;
  int callsToAvailableShowAlert = 0;
  int callsToAvailableViewWillAppear = 0;

  @override
  UserSummaryBlocable userSummaryBlocable;
  @override
  UserSummaryInteractable userSummaryInteractable;
  @override
  UserSummaryRoutable userSummaryRoutable;

  @override
  void closeView(BuildContext context) {
    callsToAvailableCloseView += 1;
    userSummaryRoutable.closeView(context);
  }

  @override
  void didRetrieveUserSummary({List<User> users}) {
    callsToAvailableDidRetrieveUserSummary += 1;
    userSummaryBlocable.onChangeValue(users: users);
  }

  @override
  void selectedCell(BuildContext context) {
    callsToAvailableSelectedCell += 1;
    userSummaryRoutable.navigateTo(context, 'routerName');
  }

  @override
  void showAlert(BuildContext context, SimpleAlertDTO simpleAlertDTO) {
    callsToAvailableShowAlert += 1;
    userSummaryRoutable.showAlert(context, simpleAlertDTO);
  }

  @override
  void viewWillAppear() {
    callsToAvailableViewWillAppear += 1;
    userSummaryInteractable.retrieveUsers();
  }
}