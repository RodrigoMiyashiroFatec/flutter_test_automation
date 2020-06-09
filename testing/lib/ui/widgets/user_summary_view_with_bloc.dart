import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:testing/model/simple_alert_dto.dart';
import 'package:testing/model/user.dart';
import 'package:testing/modules/user_summary/user_summary_presenter.dart';
import 'package:testing/ui/views/stream_builder_for_simple_user_list.dart';
import 'package:testing/ui/widgets/simple_alert.dart';
import 'package:testing/ui/widgets/user_summary_bloc.dart';

abstract class UserSummaryViewable extends StatefulWidget {
  UserSummaryPresenterControllable userSummaryPresenter;
}

class UserSummaryViewWithBloC extends StatefulWidget
    implements UserSummaryViewable {
  @override
  UserSummaryPresenterControllable userSummaryPresenter;

  @override
  _UserSummaryViewWithBloCState createState() =>
      _UserSummaryViewWithBloCState();
}

class _UserSummaryViewWithBloCState extends State<UserSummaryViewWithBloC>
    implements ClickableCell, DismissableView {
  final String _titleTemporary = 'Temporary View (BloC)';
  static UserSummaryBloc userSummaryBloc =
      BlocProvider.getBloc<UserSummaryBloc>();

  @override
  void initState() {
    super.initState();
    widget.userSummaryPresenter.userSummaryBlocable = userSummaryBloc;
    widget.userSummaryPresenter.viewWillAppear();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilderForSimpleUserList(clickableCell: this)
        .generateStreamBuilder(userSummaryBloc);
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(_titleTemporary),
//      ),
//      body: StreamBuilderForSimpleUserList(clickableCell: this).generateStreamBuilder(userSummaryBloc),
//    );
  }

  @override
  void didTapCell(BuildContext context, dynamic object) {
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

    widget.userSummaryPresenter.showAlert(context, simpleAlertDTO);
  }

  @override
  void dismiss(BuildContext context) {
    widget.userSummaryPresenter.closeView(context);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
