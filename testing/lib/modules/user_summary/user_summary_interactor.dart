import 'package:testing/infrastructure/remote/default_http_client.dart';
import 'package:testing/model/user.dart';
import 'package:testing/modules/user_summary/user_summary_presenter.dart';
import 'package:testing/provider/user/user_provider_executor.dart';

abstract class UserSummaryInteractable {
  UserSummaryPresentable userSummaryPresentable;

  void retrieveUsers();
}

class UserSummaryInteractor implements UserSummaryInteractable {
  @override
  UserSummaryPresentable userSummaryPresentable;

  @override
  void retrieveUsers() async {
    DefaultHTTPClient client = DefaultHTTPClient();
    UserProviderExecutor executor = UserProviderExecutor(client: client);

    try {
      List<User> users = await executor.obtainUsers();

      userSummaryPresentable.didRetrieveUserSummary(users: users);
    } catch (error) {
      // throw error
      print('Error interactor...');
    }
  }

}