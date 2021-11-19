import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:louzero/common/app_button.dart';
import 'package:louzero/common/app_card.dart';
import 'package:louzero/common/app_input_text.dart';
import 'package:louzero/common/app_step_progress.dart';
import 'package:louzero/common/app_text_body.dart';
import 'package:louzero/common/app_text_header.dart';
import 'package:louzero/controller/constant/colors.dart';
import 'package:louzero/ui/page/base_scaffold.dart';

class AccountStart extends StatefulWidget {
  const AccountStart({Key? key}) : super(key: key);

  @override
  _AccountStartState createState() => _AccountStartState();
}

class _AccountStartState extends State<AccountStart> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _controlTBD = TextEditingController();
    return BaseScaffold(
      child: Column(
        children: [
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  const AppTextHeader(
                    "To start, let’s get some basic info.",
                    mt: 32,
                    mb: 8,
                  ),
                  const AppTextBody(
                    'You can always make changes later in Settings',
                    mb: 32,
                    bold: true,
                  ),
                  AppStepProgress()
                ],
              )),
          Expanded(
            flex: 3,
            child: PageView(children: [
              _CompanyDetails(controlTBD: _controlTBD),
              _AccountCustomers(controlTBD: _controlTBD),
              _AccountJobTypes(controlTBD: _controlTBD),
            ]),
          )
        ],
      ),
    );
  }
}

class _AccountJobTypes extends StatelessWidget {
  const _AccountJobTypes({
    Key? key,
    required TextEditingController controlTBD,
  })  : _controlTBD = controlTBD,
        super(key: key);

  final TextEditingController _controlTBD;
  final jobTypeText =
      'Save time by profiling your common job types. Think about repairs, sales and recurring services. Later, you can build out full templates for each job type in Settings.';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 32),
      child: Column(
        children: [
          AppCard(
            children: [
              const AppTextHeader(
                "Job Types",
                alignLeft: true,
                icon: Icons.business_center_sharp,
                size: 24,
              ),
              AppTextBody(jobTypeText),
              AppInputText(
                  mt: 14,
                  controller: _controlTBD,
                  label: 'What Industries do you serve?'),
            ],
          ),
          const AppButtonSubmit(),
        ],
      ),
    );
  }
}

class _AccountCustomers extends StatelessWidget {
  const _AccountCustomers({
    Key? key,
    required TextEditingController controlTBD,
  })  : _controlTBD = controlTBD,
        super(key: key);

  final TextEditingController _controlTBD;
  final customerTypeText =
      'Customer Types allow for categorization of customers. Common options are residential and commercial. This categorization will be helpful in reporting on performance.';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 32),
      child: Column(
        children: [
          AppCard(
            children: [
              const AppTextHeader(
                "Customer Types",
                alignLeft: true,
                icon: Icons.people,
                size: 24,
              ),
              AppTextBody(customerTypeText),
              const Divider(
                color: AppColors.light_3,
              ),
              AppInputText(
                  mt: 14,
                  controller: _controlTBD,
                  label: 'What Industries do you serve?'),
            ],
          ),
          const AppButtonSubmit(),
        ],
      ),
    );
  }
}

class _CompanyDetails extends StatelessWidget {
  const _CompanyDetails({
    Key? key,
    required TextEditingController controlTBD,
  })  : _controlTBD = controlTBD,
        super(key: key);

  final TextEditingController _controlTBD;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 32),
      child: Column(
        children: [
          AppCard(
            children: [
              const AppTextHeader(
                "Company Details",
                alignLeft: true,
                icon: Icons.home_work_sharp,
                size: 24,
              ),
              AppFlexRow(
                children: [
                  AppFlexColumn(children: [
                    AppInputText(
                      required: true,
                      controller: _controlTBD,
                      label: 'Company Name',
                    ),
                    AppInputText(
                      controller: _controlTBD,
                      label: 'Website',
                    ),
                  ]),
                  AppFlexColumn(ml: 16, children: [
                    AppInputText(
                      controller: _controlTBD,
                      required: true,
                      label: 'Phone Number',
                    ),
                    AppInputText(
                      controller: _controlTBD,
                      label: 'Email Address',
                    )
                  ])
                ],
              ),
              const Divider(
                color: AppColors.light_3,
              ),
              AppInputText(
                  mt: 14,
                  controller: _controlTBD,
                  label: 'What Industries do you serve?'),
            ],
          ),
          AppCard(mt: 24, children: [
            const AppTextHeader(
              "Company Address",
              alignLeft: true,
              icon: Icons.location_on,
              size: 24,
            ),
            AppInputText(
              controller: _controlTBD,
              label: 'Country',
            ),
            AppInputText(
              controller: _controlTBD,
              label: 'Street Address',
            ),
            AppInputText(
              controller: _controlTBD,
              label: 'Apt / Suite / Other',
              colorBg: AppColors.light_1,
            ),
            AppFlexRow(
              children: [
                AppFlexColumn(flex: 2, children: [
                  AppInputText(
                    controller: _controlTBD,
                    label: 'City',
                    colorBg: AppColors.light_1,
                  ),
                ]),
                AppFlexColumn(ml: 16, children: [
                  AppInputText(
                    controller: _controlTBD,
                    label: 'State',
                    colorBg: AppColors.light_1,
                  ),
                ]),
                AppFlexColumn(ml: 16, children: [
                  AppInputText(
                    controller: _controlTBD,
                    label: 'Zip',
                    colorBg: AppColors.light_1,
                  ),
                ]),
              ],
            ),
          ]),
          const AppButtonSubmit(),
        ],
      ),
    );
  }
}

class AppButtonSubmit extends StatelessWidget {
  const AppButtonSubmit({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppDivider(ml: 24, mr: 24, mb: 24),
        Row(
          children: const [
            AppButton(
              ml: 24,
              mb: 48,
              label: 'Save & Continue',
              color: AppColors.dark_2,
            )
          ],
        )
      ],
    );
  }
}

class AppDivider extends StatelessWidget {
  const AppDivider({
    Key? key,
    this.mt = 0,
    this.mb = 24,
    this.ml = 0,
    this.mr = 0,
    this.color = AppColors.light_3,
    this.size = 2,
  }) : super(key: key);

  final double mt;
  final double mb;
  final double ml;
  final double mr;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: mt,
        bottom: mb,
        left: ml,
        right: mr,
      ),
      child: Divider(
        color: color,
        thickness: size,
        height: size,
      ),
    );
  }
}

class AppFlexRow extends StatelessWidget {
  const AppFlexRow({
    Key? key,
    required this.children,
    this.mt = 0,
    this.mb = 0,
  }) : super(key: key);

  final List<Widget> children;
  final double mt;
  final double mb;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }
}

class AppFlexColumn extends StatelessWidget {
  const AppFlexColumn({
    Key? key,
    required this.children,
    this.ml = 0,
    this.mr = 0,
    this.flex = 1,
  }) : super(key: key);

  final List<Widget> children;
  final double ml;
  final double mr;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: flex,
      child: Padding(
        padding: EdgeInsets.only(left: ml, right: mr),
        child: Column(
          children: [
            ...children,
          ],
        ),
      ),
    );
  }
}
