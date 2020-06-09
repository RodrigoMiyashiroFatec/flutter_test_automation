import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing/ui/widgets/user_summary_view_with_bloc.dart';

void main() {
  testWidgets('User Summary BloC', (WidgetTester tester) async {
    await tester.pumpWidget(UserSummaryViewWithBloC());
    
    await tester.tap(find.byType(ListView));
  });
}