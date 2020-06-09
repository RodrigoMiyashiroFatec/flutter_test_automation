import 'package:testing/modules/user_summary/user_summary_interactor.dart';
import 'package:testing/modules/user_summary/user_summary_presenter.dart';

import '../../mock/json_parser.dart';

class UserSummaryInteractorMock implements UserSummaryInteractable {
  int callToAvailableRetrieveUsers = 0;

  @override
  UserSummaryPresentable userSummaryPresentable;

  @override
  void retrieveUsers() {
    callToAvailableRetrieveUsers += 1;
    userSummaryPresentable.didRetrieveUserSummary();
  }
}