import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:instagram_flutter/providers/user_provider.dart';
import 'package:instagram_flutter/utils/global_variables.dart';
import 'package:provider/provider.dart';

class ResponsiveLayout extends StatefulWidget {
  final Widget mobileScreenLayout;
  final Widget webScreenLayout;
  const ResponsiveLayout(
      {Key? key,
      required this.mobileScreenLayout,
      required this.webScreenLayout});

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  void initState() {
    super.initState();
    addData();
  }

  addData() async {
    //we can access the provider here because it is set globally on the main.dart
    UserProvider userProvider = Provider.of(context, listen: false);

    ///I have to study more about listeners and providers
    /// we are calling the refereshUser method on UserProvider
    await userProvider.refreshUser();
  }

  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > webScreenSize) {
        return widget.webScreenLayout;
      }
      return widget.mobileScreenLayout;
    });
  }
}
