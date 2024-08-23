import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Provider/currency_Provider.dart';
import 'package:sub_tracker/Provider/plan_provider.dart';
import 'package:sub_tracker/utils/flutter_toast.dart';
import 'package:sub_tracker/views/payment_method/payment_screen.dart';
import 'package:sub_tracker/views/personaldata/personaldata.dart';
import '../../theme/theme.dart';
import '../../utils/app_Images.dart';
import '../../utils/app_colors.dart';
import '../../utils/my_size.dart';
import '../base/text_widgets.dart';
import 'base/manageplanrowlist.dart';
import 'base/monthlypercentwidget.dart';
import 'base/stackpercentagewidget.dart';

class ManagePlan extends StatefulWidget {
  const ManagePlan({super.key});

  @override
  State<ManagePlan> createState() => _ManagePlanState();
}

class _ManagePlanState extends State<ManagePlan> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<PlanProvider>(context, listen: false).getPlanes());
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeChanger>(context);
    final planProvider = Provider.of<PlanProvider>(context);

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        backgroundColor: themeProvider.themeData == darkMode
            ? const Color(0XFF1C1C23)
            : Colors.white,
        body: _buildBody(planProvider, themeProvider),
        bottomNavigationBar: _buildBottomNavigationBar(planProvider),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(MySize.size72),
      child: Padding(
        padding: EdgeInsets.only(left: 8, top: MySize.size25),
        child: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Manage Plan',
            style: TextStyle(
              color: const Color(0XFFA2A2B5),
              fontSize: MySize.size16,
              fontWeight: FontWeight.w400,
            ),
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Transform.scale(
              scale: 0.5,
              child: Image.asset(AppImages.backArrow, color: const Color(0XFFA2A2B5)),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(PlanProvider planProvider, ThemeChanger themeProvider) {
    if (planProvider.isPlan) {
      return const Center(child: CircularProgressIndicator(color: Colors.blueAccent));
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildPlanList(planProvider, themeProvider),
          SizedBox(height: MySize.size10),
          _buildFeaturesSection(themeProvider),
        ],
      ),
    );
  }

  Widget _buildPlanList(PlanProvider planProvider, ThemeChanger themeProvider) {
    return ListView.builder(
      itemCount: planProvider.planData.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        var finalData = planProvider.planData[index];
        return _buildPlanItem(context, planProvider, themeProvider, finalData, index);
      },
    );
  }

  Widget _buildPlanItem(BuildContext context, PlanProvider planProvider, ThemeChanger themeProvider, dynamic finalData, int index) {
    return Container(
      margin: EdgeInsets.only(bottom: MySize.size14, top: index == 0 ? MySize.size35 : MySize.size14),
      height:  MySize.scaleFactorHeight * 85,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MySize.size10),
              _buildMainContainer(context, planProvider, themeProvider, finalData, index),
            ],
          ),
          if (index == 0) StackPercentageWidget(percentValue: "~20%"),
          MonthlyPercentWidget(packageTitle: index == 0 ? "1 Month Free Trial" : "1 Year Free Trial"),
        ],
      ),
    );
  }

  Widget _buildMainContainer(BuildContext context, PlanProvider planProvider, ThemeChanger themeProvider, dynamic finalData, int index) {
    return Center(
      child: InkWell(
        onTap: () {
          planProvider.updateIndex(index: index, selectData: finalData);
        },
        child: Container(
          height: MySize.scaleFactorHeight * 68,
          width: MySize.scaleFactorWidth * 288,
          decoration: BoxDecoration(
            color: themeProvider.themeData == darkMode
                ? const Color(0XFF4E4E61).withOpacity(.2)
                : const Color(0XFFF1F1FF).withOpacity(.8),
            borderRadius: BorderRadius.circular(16),
            border: planProvider.selectIndex == index
                ? Border.all(color: AppColors.purpleFF, width: 2)
                : null,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                finalData['type'],
                style: const TextStyle(
                  color: Color(0XFF83839C),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Consumer<CurrencyProvider>(builder: (context, currencyProvider, child) {
                return TextWidgetInterMedium(
                  title: '${currencyProvider.selectedCurrencySymbol} ${finalData['price']}',
                  fontSize: MySize.size14,
                  fontWeight: FontWeight.w600,
                  color: themeProvider.themeData == darkMode ? const Color(0XFFFFFFFF) : Colors.black,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeaturesSection(ThemeChanger themeProvider) {
    return Padding(
      padding: EdgeInsets.only(left: MySize.size32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidgetInterBold(
            title: 'Features',
            fontSize: MySize.size14,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: MySize.size8),
          Container(
            padding: EdgeInsets.symmetric(horizontal: MySize.size20, vertical: MySize.size16),
            height: MySize.scaleFactorHeight * 245,
            width: MySize.scaleFactorWidth * 328,
            decoration: BoxDecoration(
              color: themeProvider.themeData == darkMode
                  ? const Color(0XFF4E4E61).withOpacity(.2)
                  : const Color(0XFFF1F1FF),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(width: MySize.size2, color: AppColors.whiteFc.withOpacity(0.10)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                manageplanrowlist(
                  imageIcon: Image.asset(AppImages.plan, height: 20),
                  text: 'Subscription Tracking',
                ),
                SizedBox(height: MySize.size20),
                manageplanrowlist(
                  imageIcon: Image.asset(AppImages.notify, height: 20),
                  text: 'Alerts and Notifications',
                ),
                SizedBox(height: MySize.size20),
                manageplanrowlist(
                  imageIcon: Image.asset(AppImages.chart, height: 20),
                  text: 'Financial Overview',
                ),
                SizedBox(height: MySize.size20),
                manageplanrowlist(
                  imageIcon: Image.asset(AppImages.analytics, height: 20),
                  text: 'Spending Analytics',
                ),
                SizedBox(height: MySize.size20),
                manageplanrowlist(
                  imageIcon: Image.asset(AppImages.contsupport, height: 20),
                  text: 'Customer Support',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar(PlanProvider planProvider) {
    return CustomSaveButton(
      loading: planProvider.isUpdatePlan,
      onTap: () {
        if (planProvider.selectIndex != -1) {
          planProvider.subscribePlan(context: context);
        } else {
          FlutterToast.toastMessage(message: "Please select a plan", isError: true);
        }
      },
      titleText: 'Next',
    );
  }
}