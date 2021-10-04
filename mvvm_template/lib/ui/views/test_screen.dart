import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:mvvm_template/business_logic/view_models/test_view_model.dart';
import 'package:mvvm_template/services/navigation/navigation_service.dart';
import 'package:mvvm_template/services/service_locator.dart';
import 'package:provider/provider.dart';

class TestScreen extends StatefulWidget {

  const TestScreen({Key? key}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {

  TestViewModel viewModel = serviceLocator<TestViewModel>();
  bool _callingApi = false;

  @override
  void initState() {
    viewModel.testing();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _callingApi,
      child: Scaffold(
        body: buildUi(viewModel),
      ),
    );
  }

  Widget buildUi(TestViewModel viewModel) {
    return ChangeNotifierProvider<TestViewModel>.value(
      value: viewModel,
      child: Consumer<TestViewModel>(
        builder: (context, model, child) {
          return Center(
            child: Column(
              children: [

                Text("Test Screen"),

                ElevatedButton(
                  onPressed: () {
                    serviceLocator<NavigationService>().navigateTo(routeName: "second_screen");
                  },
                  child: Text(
                    "Next screen"
                  ),
                ),

              ],
            ),
          );
        },
      ),
    );
  }
}
