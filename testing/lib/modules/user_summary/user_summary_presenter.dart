import 'package:flutter/cupertino.dart';
import 'package:testing/model/simple_alert_dto.dart';
import 'package:testing/model/user.dart';
import 'package:testing/modules/user_summary/user_summary_interactor.dart';
import 'package:testing/modules/user_summary/user_summary_router.dart';
import 'package:testing/ui/widgets/user_summary_bloc.dart';

abstract class UserSummaryPresentable {
  UserSummaryBlocable userSummaryBlocable;
  UserSummaryInteractable userSummaryInteractable;
  UserSummaryRoutable userSummaryRoutable;
  void didRetrieveUserSummary({List<User> users});
  void selectedCell(BuildContext context);
  void showAlert(BuildContext context, SimpleAlertDTO simpleAlertDTO);
  void closeView(BuildContext context);
}

abstract class UserSummaryShowScreen {
  void viewWillAppear();
}

abstract class UserSummaryPresenterControllable implements UserSummaryPresentable, UserSummaryShowScreen {}

class UserSummaryPresenter implements UserSummaryPresenterControllable {//UserSummaryPresentable, UserSummaryShowScreen {
  @override
  UserSummaryBlocable userSummaryBlocable;
  @override
  UserSummaryInteractable userSummaryInteractable;
  @override
  UserSummaryRoutable userSummaryRoutable;

  @override
  void didRetrieveUserSummary({List<User> users}) {
    if (users == null) {
      return;
    }
    userSummaryBlocable.onChangeValue(users: users);
  }

  @override
  void viewWillAppear() {
    userSummaryInteractable.retrieveUsers();
  }

  @override
  void selectedCell(BuildContext context) {
    userSummaryRoutable.navigateTo(context, 'routerName');
  }

  @override
  void showAlert(BuildContext context, SimpleAlertDTO simpleAlertDTO) {
    userSummaryRoutable.showAlert(context, simpleAlertDTO);
  }

  @override
  void closeView(BuildContext context) {
    userSummaryRoutable.closeView(context);
  }
}