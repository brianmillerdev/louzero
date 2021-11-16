import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:louzero/controller/constant/colors.dart';
import 'package:louzero/controller/page_navigation/navigation_controller.dart';
import 'package:louzero/ui/page/base_scaffold.dart';
import 'package:louzero/ui/page/customer/add_customer.dart';
import 'package:louzero/ui/page/customer/customer.dart';
import 'package:louzero/ui/widget/appbar_action.dart';
import 'package:louzero/ui/widget/widget.dart';

class CustomerListPage extends StatefulWidget {
  const CustomerListPage({Key? key}) : super(key: key);

  @override
  _CustomerListPageState createState() => _CustomerListPageState();
}

class _CustomerListPageState extends State<CustomerListPage> {
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _parentAccountNameController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _companyNameController.dispose();
    _parentAccountNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      child: Scaffold(
        appBar: SubAppBar(
          title: "Customers",
          context: context,
          leadingTxt: "Home",
          actions: [
            AppBarAction(
                label: 'Add New',
                onPressed: () => NavigationController()
                    .pushTo(context, child: const AddCustomerPage()))
          ],
        ),
        backgroundColor: AppColors.light_1,
        body: _body(),
      ),
    );
  }

  Widget _body() {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DashboardCell(
                title: "Customer ${index + 1}",
                description: "Description...",
                count: 0,
                buttonTitleLeft: "3486 Archwood Ave., Vancouver, Washington 98665",
                buttonTitleRight: "",
                onPressed: () => NavigationController()
                    .pushTo(context, child: const CustomerProfilePage()),
                onPressedLeft: () {},
                onPressedRight: () {},
              ),
              const SizedBox(height: 24),
            ],
          );
        });
  }
}