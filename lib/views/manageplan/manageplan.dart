import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Provider/currency_Provider.dart';
import 'package:sub_tracker/Provider/plan_provider.dart';
import 'package:sub_tracker/utils/flutter_toast.dart';
import 'package:sub_tracker/views/payment_method/payment_screen.dart';
import 'package:sub_tracker/views/personaldata/personaldata.dart';
import '../../theme/theme.dart';
import '../../utils/app_Images.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_constant.dart';
import '../../utils/my_size.dart';
import '../base/text_widgets.dart';
import '../settings/settings.dart';
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
    Future.microtask(() => Provider.of<PlanProvider>(context,listen: false).getPlanes());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(MySize.size72),
            child: Padding(
              padding: EdgeInsets.only(left: 8, top: MySize.size25),
              child: AppBar(
                scrolledUnderElevation: 0,
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                title:  Text('Manage Plan',style: TextStyle(color: const Color(0XFFA2A2B5),fontSize: MySize.size16, fontWeight: FontWeight.w400),),
                leading:GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Transform.scale(
                         scale: 0.5,
                        child: Image.asset(AppImages.backArrow,color: const Color(0XFFA2A2B5),))),
              ),
            ),
          ),
      // backgroundColor: AppColors.black00,
          backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode
              ? const Color(0XFF1C1C23)
              : Colors.white,
      body: SingleChildScrollView(
        child: Consumer<PlanProvider>(builder: (context, planProvider, child) {
            return planProvider.isPlan ?
            const Center(child: CircularProgressIndicator(color: Colors.blueAccent,)): Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: ListView.builder(
                    itemCount: planProvider.planData.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var finalData = planProvider.planData[index];
                      return Container(
                        margin: EdgeInsets.only(bottom: MySize.size14,top: index ==0 ?MySize.size35 : MySize.size14),
                        height: MySize.scaleFactorHeight * 80,
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: MySize.size10,
                                ),
                                Center( // Centering the main container
                                  child: InkWell(
                                    onTap: () {
                                      planProvider.updateIndex(index: index,selectData: finalData);
                                    },
                                    child: Container(
                                      height: MySize.scaleFactorHeight * 68,
                                      width: MySize.scaleFactorWidth * 288,
                                      decoration: BoxDecoration(
                                        color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                            ? const Color(0XFF4E4E61).withOpacity(.2)
                                            : const Color(0XFFF1F1FF).withOpacity(.8),
                                        borderRadius: BorderRadius.circular(16),
                                        border: planProvider.selectIndex == index ?  Border.all(
                                          color: AppColors.purpleFF,
                                          width: 2,
                                        ): null,
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
                                        return   TextWidgetInterMedium(
                                            title: '${currencyProvider.selectedCurrencySymbol} ${finalData['price']}',
                                            fontSize: MySize.size14,
                                            fontWeight: FontWeight.w600,
                                            color: Provider.of<ThemeChanger>(context).themeData ==
                                                darkMode
                                                ? const Color(0XFFFFFFFF):Colors.black
                                        );
                                      },),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            index == 0
                                ? StackPercentageWidget(percentValue: "~20%")
                                : const SizedBox.shrink(),
                           index==0
                               ? MonthlyPercentWidget(packageTitle: "1 Month Free Trial")
                               : MonthlyPercentWidget(packageTitle: "1 Year Free Trial"),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: MySize.size10,
                ),

                Padding(
                  padding: EdgeInsets.only(left: MySize.size32),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: TextWidgetInterBold(
                      title: 'Features',
                      // color: AppColors.whiteFF,
                      align: TextAlign.start,
                      fontSize: MySize.size14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: MySize.size8,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MySize.size20, vertical: MySize.size16),
                  height: MySize.scaleFactorHeight * 245,
                  width: MySize.scaleFactorWidth * 328,
                  decoration: BoxDecoration(
                    // color: AppColors.grey61.withOpacity(.20), F1F1FF
                    color: Provider.of<ThemeChanger>(context).themeData ==
                        darkMode
                        ? const Color(0XFF4E4E61).withOpacity(.2)
                        : const Color(0XFFF1F1FF),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      width: MySize.size2,
                      color: AppColors.whiteFc.withOpacity(0.10),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      manageplanrowlist(
                        imageIcon: Image.asset(AppImages.plan,height: 20,),
                        text: 'Subscription Tracking',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      manageplanrowlist(
                        imageIcon: Image.asset(AppImages.notify,height: 20,),
                        text: 'Alerts and Notifications',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      manageplanrowlist(
                        imageIcon: Image.asset(AppImages.chart,height: 20,),
                        text: 'Financial Overview',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      manageplanrowlist(
                        imageIcon: Image.asset(AppImages.analytics,height: 20,),
                        text: 'Spending Analytics',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      manageplanrowlist(
                        imageIcon: Image.asset(AppImages.contsupport,height: 20,),
                        text: 'Customer Support',
                      ),
                    ],
                  ),
                ),


              ],
            );
        },),
      ),
          bottomNavigationBar: Consumer<PlanProvider>(builder: (context, planProvider, child) {
            return CustomSaveButton(
              loading: planProvider.isUpdatePlan,
              onTap: (){
                if(planProvider.selectIndex != -1){
                  planProvider.subscribePlan( context: context);
                }else{
                  FlutterToast.toastMessage(message: "Please select plan ",isError: true);
                }
              },
              titleText: 'Next',
            );
          },),
    )
    );
  }
}
