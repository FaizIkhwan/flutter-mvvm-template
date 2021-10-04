import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:mvvm_template/business_logic/view_models/second_screen_view_model.dart';
import 'package:mvvm_template/services/navigation/navigation_service.dart';
import 'package:mvvm_template/services/service_locator.dart';
import 'package:provider/provider.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {

  SecondScreenViewModel viewModel = serviceLocator<SecondScreenViewModel>();
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

  Widget buildUi(SecondScreenViewModel viewModel) {
    return ChangeNotifierProvider<SecondScreenViewModel>.value(
      value: viewModel,
      child: Consumer<SecondScreenViewModel>(
        builder: (context, model, child) {
          return Center(
            child: Text("Second Screen"),
          );
        },
      ),
    );
  }
}
