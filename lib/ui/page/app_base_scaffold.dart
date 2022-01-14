import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:louzero/common/common.dart';
import 'package:louzero/controller/api/auth/auth_api.dart';
import 'package:louzero/controller/constant/colors.dart';
import 'package:louzero/controller/constant/constants.dart';
import 'package:louzero/controller/get/bindings/company_binding.dart';
import 'package:louzero/controller/page_navigation/navigation_controller.dart';
import 'package:louzero/controller/state/auth_manager.dart';
import 'package:louzero/ui/widget/appbar/app_bar_page_header.dart';
import 'package:louzero/ui/widget/side_menu/side_menu.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'account/account.dart';

class AppBaseScaffold extends StatefulWidget {
  final Widget? child;
  final bool hasKeyboard;
  final bool logoOnly;
  final List<Widget>? footerStart;
  final List<Widget>? footerEnd;
  final String? subheader;
  const AppBaseScaffold({
    Key? key,
    this.child,
    this.footerStart,
    this.footerEnd,
    this.subheader,
    this.hasKeyboard = false,
    this.logoOnly = false,
  }) : super(key: key);

  @override
  _AppBaseScaffoldState createState() => _AppBaseScaffoldState();
}

class _AppBaseScaffoldState extends State<AppBaseScaffold> {
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  final navigatorKey = GlobalKey<NavigatorState>();

  void _logout(BuildContext context) async {
    GetStorage().write(GSKey.isAuthUser, false);
    await AuthAPI(auth: Backendless.userService).logout();
    NavigationController().popToFirst(context);
    AuthManager().loggedIn.value = false;
  }

  void _toggleDrawer() {
    _key.currentState?.openDrawer();
  }

  void _menuChange(String val) {
    if (val == 'logout') {
      _logout(context);
    }
  }

  List<Widget> _getHeader() {
    return [
      if (widget.subheader != null)
        Text(widget.subheader!, style: AppStyles.headerAppBar),
      if (widget.footerStart != null) ...widget.footerStart!,
    ];
  }

  Widget _appBackground({required Widget child}) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Color(0xFF465D66), Color(0xFF182933)],
            begin: Alignment.topLeft,
            end: Alignment.topRight),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: NavigationController().notifierInitLoading,
      builder: (ctx, isLoading, child) {
        return ValueListenableBuilder<bool>(
          valueListenable: AuthManager().loggedIn,
          builder: (ctx, loggedIn, child) {
            return _appBackground(
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    child: Scaffold(
                      key: _key,
                      drawer: loggedIn ? const SideMenuView() : null,
                      appBar: widget.logoOnly ? AppBaseAppBarBrand() : null,
                      body: widget.logoOnly
                          ? Container(
                              color: AppColors.secondary_99,
                              // ignore: unnecessary_null_in_if_null_operators
                              child: widget.child ?? null,
                            )
                          : AppBaseShell(
                              footerStart: _getHeader(),
                              footerEnd: widget.footerEnd,
                              actions: [
                                if (loggedIn)
                                  AppBaseUserMenu(onChange: _menuChange)
                              ],
                              onMenuPress: _toggleDrawer,
                              child: widget.child ?? null,
                            ),
                      drawerScrimColor: Colors.black.withOpacity(0),
                      resizeToAvoidBottomInset: widget.hasKeyboard,
                      backgroundColor: Colors.transparent,
                      drawerEnableOpenDragGesture: false,
                    ),
                  ),
                  if (isLoading) _spinner()
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _spinner() {
    return Positioned.fill(
      child: Container(
        alignment: Alignment.center,
        color: AppColors.secondary_95.withOpacity(0.6),
        child: const AppSpinner(
          size: 160,
          width: 8,
        ),
      ),
    );
  }
}

class AppBaseUserMenu extends StatelessWidget {
  final void Function(String val)? onChange;

  const AppBaseUserMenu({Key? key, this.onChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, left: 0, right: 8, bottom: 0),
      child: AppPopMenu(
        items: [
          PopMenuItem(
            label: 'My Account',
            icon: Icons.person_rounded,
            onTap: () {
              Future.delayed(const Duration(milliseconds: 100)).then((value) =>
                  Get.to(() => MyAccountPage(AuthManager.userModel!),
                      binding: CompanyBinding()));
            },
          ),
          PopMenuItem(
            label: 'Settings',
            icon: Icons.settings,
            onTap: () {},
          ),
          PopMenuItem(
            label: 'Account Setup',
            icon: MdiIcons.briefcase,
            onTap: () {},
          ),
          PopMenuItem(
            label: 'Log Out',
            icon: Icons.exit_to_app,
            onTap: () {
              if (onChange != null) {
                onChange!('logout');
              }
            },
          )
        ],
        button: [
          AppAvatar(
            url: AuthManager.userModel!.avatar,
            size: 40,
            text: AuthManager.userModel!.initials,
            borderColor: AppColors.lightest,
          ),
          const Icon(Icons.arrow_drop_down, color: AppColors.lightest)
        ],
      ),
    );
  }
}

class AppBaseAppBarBrand extends StatefulWidget implements PreferredSizeWidget {
  const AppBaseAppBarBrand({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  State<AppBaseAppBarBrand> createState() => _AppBaseAppBarBrandState();
}

class _AppBaseAppBarBrandState extends State<AppBaseAppBarBrand> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(100.0),
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: Center(
          child: Image.asset("assets/icons/general/logo_icon.png"),
        ),
      ),
    );
  }
}

class AppBaseShell extends StatelessWidget {
  final Widget? child;
  final bool hasKeyboard;
  final bool logoOnly;
  final bool loggedIn;
  void Function()? onMenuPress;
  List<Widget>? actions;
  final List<Widget>? footerStart;
  final List<Widget>? footerEnd;
  final String? subheader;

  AppBaseShell(
      {Key? key,
      this.child,
      this.footerStart,
      this.footerEnd,
      this.subheader,
      this.actions,
      this.onMenuPress,
      this.hasKeyboard = false,
      this.logoOnly = false,
      this.loggedIn = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      physics: AppBasePhysics(),
      floatHeaderSlivers: true,
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        AppBarPageHeader(
            context: context,
            title: SizedBox(
              height: 80,
              child: Image.asset("assets/icons/general/logo_icon.png"),
            ),
            footerStart: footerStart,
            footerEnd: footerEnd,
            actions: actions,
            onMenuPress: onMenuPress)
      ],
      body: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
              minWidth: double.infinity,
            ),
            color: AppColors.secondary_99,
            // ignore: unnecessary_null_in_if_null_operators
            child: child ?? null,
          ),
        ),
      ),
    );
  }
}

class AppBasePhysics extends ClampingScrollPhysics {
  AppBasePhysics({ScrollPhysics? parent}) : super(parent: parent);

  @override
  double get minFlingVelocity => double.infinity;

  @override
  double get maxFlingVelocity => double.infinity;

  @override
  double get minFlingDistance => double.infinity;

  @override
  SpringDescription spring =
      SpringDescription.withDampingRatio(mass: 300, stiffness: 80);

  @override
  AppBasePhysics applyTo(ScrollPhysics? ancestor) {
    return AppBasePhysics(parent: buildParent(ancestor)!);
  }
}
