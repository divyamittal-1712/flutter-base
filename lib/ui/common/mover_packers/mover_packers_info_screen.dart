import 'package:base_flutter/base/base_state.dart';
import 'package:base_flutter/helpers/page_identifier.dart';
import 'package:base_flutter/ui/common/app_bar_widget.dart';
import 'package:base_flutter/ui/common/dialogs/success_dialog_widget.dart';
import 'package:base_flutter/ui/common/mover_packers/navigator/mover_packers_info_navigator.dart';
import 'package:base_flutter/ui/common/mover_packers/vm/mover_packers_info_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MoverPackersInfoScreen extends StatefulWidget {
  const MoverPackersInfoScreen({Key? key}) : super(key: key);

  @override
  State<MoverPackersInfoScreen> createState() => _MoverPackersInfoScreenState();
}

class _MoverPackersInfoScreenState
    extends BaseState<MoverPackersInfoScreen, MoverPackersInfoViewModel>
    implements MoverPackersInfoNavigator {
  var key = GlobalKey<FormState>();

  @override
  AppBarWidget buildAppBar() {
    return AppBarWidget(
      scaffoldKey,
      title: "TITLE",
    );
  }

  @override
  Widget buildBody() {
    var key = GlobalKey<FormState>();

    return LayoutBuilder(
      builder: (context, constraints) => SizedBox(
        width: constraints.maxWidth,
        height: constraints.maxHeight,
        child: Consumer<MoverPackersInfoViewModel>(
          builder: (_, __, ___) => Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: key,
            child: Column(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: SingleChildScrollView(
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Form(
                          key: key,
                          autovalidateMode: AutovalidateMode.always,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // children: [
                            //   const TextView(
                            //     text: enterDetailsBelow,
                            //     size: 20,
                            //     typeFace: TypeFace.medium,
                            //     weight: FontWeight.w500,
                            //     textAlign: TextAlign.start,
                            //   ),
                            //   const SizedBox(
                            //     height: 30,
                            //   ),
                            //   const Padding(
                            //     padding: EdgeInsets.symmetric(horizontal: 8.0),
                            //     child: TextView(
                            //       text: fullName,
                            //       weight: FontWeight.w500,
                            //     ),
                            //   ),
                            //   InputField(
                            //       onTextChange: (value) {
                            //         viewModel.name = value ?? "";
                            //       },
                            //       labelText: "",
                            //       fillColor: Colors.white,
                            //       validator: (value) {
                            //         if (value == null || value.isEmpty) {
                            //           return emptyNameError;
                            //         }
                            //       }),
                            //   const SizedBox(
                            //     height: 10,
                            //   ),
                            //   const Padding(
                            //     padding: EdgeInsets.symmetric(horizontal: 8.0),
                            //     child: TextView(
                            //       text: phoneNumber,
                            //       weight: FontWeight.w500,
                            //     ),
                            //   ),
                            //   InputField(
                            //       onTextChange: (value) {
                            //         viewModel.phone = value ?? "";
                            //       },
                            //       labelText: "",
                            //       isNumber: true,
                            //       maxLength: 10,
                            //       fillColor: Colors.white,
                            //       validator: (value) {
                            //         if (value == null || value.isEmpty) {
                            //           return emptyPhone;
                            //         } else if (!value.isValidPhone()) {
                            //           return invalidPhone;
                            //         }
                            //       }),
                            //   const SizedBox(
                            //     height: 10,
                            //   ),
                            //   const Padding(
                            //     padding: EdgeInsets.symmetric(horizontal: 8.0),
                            //     child: TextView(
                            //       text: yourAddress,
                            //       weight: FontWeight.w500,
                            //     ),
                            //   ),
                            //   InputField(
                            //       onTextChange: (value) {
                            //         viewModel.address = value;
                            //       },
                            //       labelText: "",
                            //       fillColor: Colors.white,
                            //       validator: (value) {
                            //         if (value == null || value.isEmpty) {
                            //           return emptyAddress;
                            //         }
                            //       }),
                            //   const SizedBox(
                            //     height: 10,
                            //   ),
                            //   const Padding(
                            //     padding: EdgeInsets.symmetric(horizontal: 8.0),
                            //     child: TextView(
                            //       text: email,
                            //       weight: FontWeight.w500,
                            //     ),
                            //   ),
                            //   InputField(
                            //       onTextChange: (value) {
                            //         viewModel.email = value;
                            //       },
                            //       labelText: "",
                            //       fillColor: Colors.white,
                            //       validator: (value) {
                            //         if (value == null || value.isEmpty) {
                            //           return emptyEmail;
                            //         } else if (!value.isValidEmail()) {
                            //           return invalidEmail;
                            //         }
                            //       }),
                            //   const SizedBox(
                            //     height: 10,
                            //   ),
                            // ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // viewModel.moversResponse.status == Status.LOADING
                //     ? const ProgressBar()
                //     : Button(
                //         title: getFreeQuote,
                //         onClick: () {
                //           if (key.currentState!.validate()) {
                //             viewModel.sendMoverRequest();
                //           }
                //         })
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  getNavigator() => this;

  @override
  PageIdentifier getPageIdentifier() => PageIdentifier.moversPackersInfo;

  @override
  void loadPageData({value}) {}

  @override
  Future<bool> provideOnWillPopScopeCallBack() => Future.value(true);

  @override
  void onRequestSuccess() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => const SuccessDialog());
  }
}
