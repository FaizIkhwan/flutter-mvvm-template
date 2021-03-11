import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:mvvm_template/business_logic/view_models/test_view_model.dart';
import 'package:mvvm_template/services/service_locator.dart';
import 'package:provider/provider.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {

  TestViewModel viewModel = serviceLocator<TestViewModel>();
  bool _callingApi = false;

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
    return ChangeNotifierProvider<TestViewModel>(
      create: (context) => viewModel,
      child: Consumer<TestViewModel>(
        builder: (context, model, child) {
          return Container(
            child: Text("Test Screen"),
          );
        },
      ),
    );
  }
}
