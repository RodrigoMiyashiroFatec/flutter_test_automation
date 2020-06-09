import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:testing/model/simple_alert_dto.dart';
import 'package:testing/model/user.dart';
import 'package:testing/modules/user_summary/user_summary_presenter.dart';
import 'package:testing/ui/views/stream_builder_for_simple_user_list.dart';
import 'package:testing/ui/widgets/simple_alert.dart';
import 'package:testing/ui/widgets/user_summary_view_with_bloc.dart';

import 'user_summary_bloc_mock.dart';

class UserSummaryViewWithBlocMock extends StatefulWidget implements UserSummaryViewable {
  @override
  UserSummaryPresenterControllable userSummaryPresenter;

  @override
  _UserSummaryViewWithBlocMockState createState() =>
      _UserSummaryViewWithBlocMockState();
}

class _UserSummaryViewWithBlocMockState extends State<UserSummaryViewWithBlocMock>
    implements ClickableCell, DismissableView {
  int callsToAvailableInitState = 0;
  int callsToAvailableBuild = 0;
  int callsToAvailableDidTapCell = 0;
  int callsToAvailableDismiss = 0;

  static UserSummaryBlocMock userSummaryBloc = BlocProvider.getBloc<UserSummaryBlocMock>();

  @override
  void initState() {
    super.initState();
    callsToAvailableInitState += 1;
    widget.userSummaryPresenter.userSummaryBlocable = userSummaryBloc;
    widget.userSummaryPresenter.viewWillAppear();
  }

  @override
  Widget build(BuildContext context) {
    callsToAvailableBuild += 1;
    return BlocProvider(
      blocs: [
        Bloc((i) => UserSummaryBlocMock()),
      ],
      child: MaterialApp(
        home: Container()
        ),
    );
  }

  @override
  void didTapCell(BuildContext context, object) {
    SimpleAlertDTO simpleAlertDTO = SimpleAlertDTO(
        title: 'Error',
        description: 'Sorry...',
        buttonTitle: 'Ok',
        removeAlert: this);

    if (object is User) {
      simpleAlertDTO = SimpleAlertDTO(
          title: object.name,
          description: object.email,
          buttonTitle: 'Ok',
          removeAlert: this);
    }

    callsToAvailableDidTapCell += 1;
    widget.userSummaryPresenter.showAlert(context, simpleAlertDTO);
  }

  @override
  void dismiss(BuildContext context) {
    callsToAvailableDismiss += 1;
    widget.userSummaryPresenter.closeView(context);
  }
}