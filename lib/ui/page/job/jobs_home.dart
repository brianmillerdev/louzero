import 'package:flutter/material.dart';
import 'package:louzero/common/app_billing_lines.dart';
import 'package:louzero/common/app_billing_total.dart';
import 'package:louzero/common/app_button.dart';
import 'package:louzero/common/app_card_expandable.dart';
import 'package:louzero/common/app_card_tabs.dart';
import 'package:louzero/common/app_divider.dart';
import 'package:louzero/common/app_icon_button.dart';
import 'package:louzero/common/app_pop_menu.dart';
import 'package:louzero/controller/constant/colors.dart';
import 'package:louzero/ui/page/app_base_scaffold.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class JobsHome extends StatelessWidget {
  JobsHome({Key? key}) : super(key: key);

  List<LineItem> rowData = <LineItem>[
    const LineItem(
        description: 'Clean Pool', count: 1, price: 50.00, subtotal: 50.00),
    const LineItem(
      description: 'Replace Valve Seals',
      count: 4,
      price: 5.00,
      subtotal: 20.00,
      note:
          'Adding in an interesting comment about what this is and why it’s here. If I need to add more than one line of text, this input grows vertically as needed!',
    ),
    const LineItem(
        description: 'Replace Valve Seals',
        count: 1,
        price: 16.48,
        subtotal: 16.48),
  ];

  @override
  Widget build(BuildContext context) {
    return AppBaseScaffold(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _locationCard(),
            _tabs(),
          ],
        ),
      ),
      subheader: 'Repair',
      footerEnd: const [
        AppButton(
          fontSize: 16,
          label: 'Job Status',
          icon: MdiIcons.calculator,
          color: AppColors.secondary_20,
          colorIcon: AppColors.accent_1,
        )
      ],
    );
  }

  Widget _locationCard() {
    return AppCardExpandable(
      title: const AppHeaderIcon('Archwood House'),
      subtitle: _locationSubtitle(),
      children: const [
        Icon(
          MdiIcons.beer,
          color: AppColors.primary_60,
          size: 150,
        ),
      ],
    );
  }

  Widget _locationSubtitle() {
    return AppSplitRow(
      pt: 8,
      start: [
        const Icon(
          MdiIcons.mapMarker,
          color: AppColors.primary_60,
          size: 16,
        ),
        Text("3486 Archwood house st. vancover, WA 98522",
            style: AppStyles.labelRegular.copyWith(fontSize: 14))
      ],
      end: [
        Text("Acct. Balance:",
            style: AppStyles.labelRegular.copyWith(fontSize: 14)),
        const SizedBox(
          width: 8,
        ),
        Text("\$768.00", style: AppStyles.labelBold.copyWith(fontSize: 14)),
      ],
    );
  }

  Widget _tabs() {
    return Container(
      height: 800,
      child: AppCardTabs(
          radius: 24,
          children: [
            _tabBilling(),
            _tabDetails(),
            _tabSchedule(),
          ],
          length: 3,
          tabNames: const ['Job Details', 'Schedule', 'Billing']),
    );
  }

  Widget _tabSchedule() {
    return const AppTabPanel(children: [
      Text('Job Schedule', style: AppStyles.headerRegular),
    ]);
  }

  Widget _tabDetails() {
    return const AppTabPanel(children: [
      Text('Job Details', style: AppStyles.headerRegular),
    ]);
  }

  Widget _tabBilling() {
    return AppTabPanel(
      children: [
        const Text('Billing Line Items', style: AppStyles.headerRegular),
        AppBillingLines(data: rowData),
        // AppPlaceholder(
        //   title: 'Empty State Illustration',
        //   subtitle: 'Add some billing line items to start.',
        // ),

        const AppPopMenu(
          button: [
            AppButtons.iconOutline(
              'Add New Line',
              isMenu: true,
            )
          ],
          items: [
            PopMenuItem(label: 'Inventory Line', icon: MdiIcons.clipboardText),
            PopMenuItem(
                label: 'Misc. Billing Line', icon: MdiIcons.currencyUsd),
          ],
        ),
        const AppDivider(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            AppButtons.iconFlat('Add Note', icon: MdiIcons.note),
            Expanded(
              child: AppBillingTotal(
                subtotal: 1246.57,
                tax: 7.32,
              ),
            )
          ],
        ),
      ],
    );
  }
  // End Class
}

class AppSplitRow extends StatelessWidget {
  final List<Widget> start;
  final List<Widget> end;
  final double pt;
  final double pb;
  final double pr;
  final double pl;

  const AppSplitRow({
    Key? key,
    this.start = const [],
    this.end = const [],
    this.pt = 0,
    this.pb = 0,
    this.pr = 0,
    this.pl = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: pt, left: pl, right: pr, bottom: pb),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: start,
            ),
          ),
          Row(
            children: end,
          )
        ],
      ),
    );
  }
}

class AppHeaderIcon extends StatelessWidget {
  final IconData icon;
  final String title;

  const AppHeaderIcon(
    this.title, {
    Key? key,
    this.icon = MdiIcons.arrowTopRight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: AppStyles.headerRegular,
        ),
        AppIconButton(
          pl: 8,
          icon: icon,
          onTap: () {},
        ),
      ],
    );
  }
}
