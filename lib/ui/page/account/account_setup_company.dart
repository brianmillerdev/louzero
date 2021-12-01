import 'package:flutter/material.dart';
import 'package:louzero/common/app_card.dart';
import 'package:louzero/common/app_dropdown_multiple.dart';
import 'package:louzero/common/app_input_text.dart';
import 'package:louzero/common/app_row_flex.dart';
import 'package:louzero/common/app_text_header.dart';
import 'package:louzero/controller/constant/colors.dart';

class AccountSetupCompany extends StatelessWidget {
  AccountSetupCompany({
    Key? key,
  }) : super(key: key);

  final TextEditingController _controlTBD = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppCard(
          children: [
            const AppTextHeader(
              "Company Details",
              alignLeft: true,
              icon: Icons.home_work_sharp,
              size: 24,
            ),
            AppRowFlex(children: [
              AppInputText(
                required: true,
                controller: _controlTBD,
                label: 'Company Name',
              ),
              AppInputText(
                controller: _controlTBD,
                required: true,
                label: 'Phone Number',
              ),
            ]),
            AppRowFlex(children: [
              AppInputText(
                controller: _controlTBD,
                label: 'Website',
              ),
              AppInputText(
                controller: _controlTBD,
                label: 'Email Address',
              ),
            ]),
            const Divider(
              color: AppColors.light_3,
            ),
            AppDropdownMultiple(
                controller: _controlTBD,
                label: 'What Industries do you serve?'),
          ],
        ),
        AppCard(
          mt: 24,
          children: [
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
            AppRowFlex(flex: [
              2,
              1,
              1,
            ], children: [
              AppInputText(
                controller: _controlTBD,
                label: 'City',
                colorBg: AppColors.light_1,
              ),
              AppInputText(
                controller: _controlTBD,
                label: 'State',
                colorBg: AppColors.light_1,
              ),
              AppInputText(
                controller: _controlTBD,
                label: 'Zip',
                colorBg: AppColors.light_1,
              ),
            ])
          ],
        ),
      ],
    );
  }
}