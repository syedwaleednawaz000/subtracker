import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Provider/spending_budget_provider.dart';
import 'package:sub_tracker/utils/app_Images.dart';
import 'package:sub_tracker/utils/app_colors.dart';
import 'package:sub_tracker/utils/flutter_toast.dart';
import 'package:sub_tracker/views/home_screen/Component/linear_progress.dart';
import 'package:sub_tracker/views/spending_budgets/component/add_provider_dialog.dart';
import 'package:sub_tracker/views/spending_budgets/component/set_budget_dialog.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../../Provider/category_provider.dart';
import '../../notification_screen/notification_screen.dart';
import '../../theme/theme.dart';
import '../../utils/my_size.dart';
import '../base/custom_dottContainer.dart';
import '../base/linear_colorBar.dart';
import '../base/round_progressBar.dart';
import '../base/settingIcon_screen.dart';
import '../base/text_widgets.dart';

class SpendingBudgets extends StatefulWidget {
  const SpendingBudgets({super.key});

  @override
  State<SpendingBudgets> createState() => _SpendingBudgetsState();
}

class _SpendingBudgetsState extends State<SpendingBudgets> {
  List<Color> generateRandomColors(int count) {
    Random random = Random();
    List<Color> colors = [];
    for (int i = 0; i < count; i++) {
      colors.add(Color.fromARGB(
        255,
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
      ));
    }
    return colors;
  }

  List<Color> randomColors = [];


  @override
  void initState() {
    // TODO: implement initState
    Future.microtask(() => Provider.of<SpendingBudgetProvider>(context,listen: false).getSpendingBudget());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(MySize.size72),
          child: Padding(
            padding: EdgeInsets.only(left: MySize.size8, top: MySize.size24),
            child: AppBar(
              automaticallyImplyLeading: false,
              scrolledUnderElevation: 0,
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text(
                'Spending & Budgets',
                style: TextStyle(
                    color: const Color(0xFF424252),
                    fontSize: MySize.size16,
                    fontWeight: FontWeight.w400),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: MySize.size25),
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                const NotificationsScreen()));
                      },
                      child: Image.asset(
                        AppImages.notificationIcon,
                        height: MySize.size25,
                        width: MySize.size25,
                        color: Provider.of<ThemeChanger>(context).themeData ==
                            darkMode
                            ? const Color(0XFFA2A2B5)
                            : const Color(0XFF424252),
                      )),
                )
              ],
            ),
          ),
        ),
        backgroundColor:
        Provider.of<ThemeChanger>(context).themeData == darkMode
            ? const Color(0XFF1C1C23)
            : const Color(0XFFF7F7FF),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MySize.scaleFactorHeight * 43,
              ),
              Consumer<SpendingBudgetProvider>(builder: (context, spendingBudgetProvider, child) {
                return               SizedBox(
                  height: MySize.scaleFactorHeight * 160,
                  child: SfRadialGauge(
                    axes: <RadialAxis>[
                      RadialAxis(
                        startAngle: 180,
                        endAngle: 360,
                        radiusFactor: 01.2,
                        showLabels: false,
                        showTicks: false,
                        axisLineStyle: const AxisLineStyle(
                          thickness: 0.07,
                          cornerStyle: CornerStyle.bothCurve,
                          color: Colors.black,
                          thicknessUnit: GaugeSizeUnit.factor,
                        ),
                        pointers: const <GaugePointer>[
                          RangePointer(
                            value: 75,
                            cornerStyle: CornerStyle.bothCurve,
                            width: 0.15,
                            sizeUnit: GaugeSizeUnit.factor,
                            color: Color(0xFFDB23FD),
                          ),
                          RangePointer(
                            value: 42,
                            cornerStyle: CornerStyle.endCurve,
                            width: 0.15,
                            sizeUnit: GaugeSizeUnit.factor,
                            color: Colors.black,
                          ),
                          RangePointer(
                            value: 40,
                            cornerStyle: CornerStyle.bothCurve,
                            width: 0.15,
                            sizeUnit: GaugeSizeUnit.factor,
                            color: Color(0xFF7689FF),
                          ),
                          RangePointer(
                            value: 22,
                            cornerStyle: CornerStyle.bothCurve,
                            width: 0.15,
                            sizeUnit: GaugeSizeUnit.factor,
                            color: Colors.black,
                          ),
                          RangePointer(
                            value: 20,
                            cornerStyle: CornerStyle.endCurve,
                            width: 0.15,
                            sizeUnit: GaugeSizeUnit.factor,
                            color: Color(0xFF02E3E5),
                          ),
                          RangePointer(
                            value: 00,
                            cornerStyle: CornerStyle.bothCurve,
                            width: 0.15,
                            sizeUnit: GaugeSizeUnit.factor,
                            color: Colors.black,
                          ),
                        ],
                        annotations: <GaugeAnnotation>[
                          GaugeAnnotation(
                            angle: 90,
                            positionFactor: 00,
                            widget: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  '\$${spendingBudgetProvider.totalSpendBudget}',
                                  style: TextStyle(
                                      fontSize: MySize.size24,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xFF424252)),
                                ),
                                SizedBox(height: MySize.size4),
                                Text(
                                  'of \$${spendingBudgetProvider.totalBudget}',
                                  style: TextStyle(
                                    fontSize: MySize.size12,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFFA2A2B5),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },),
              Container(
                height: MySize.size60,
                width: MySize.scaleFactorWidth * 326,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.transparent,
                  border: Border.all(
                      color: Provider.of<ThemeChanger>(context).themeData ==
                          darkMode
                          ? const Color(0XFF4E4E61)
                          : const Color(0XFF4E4E61).withOpacity(.20),
                      width: 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    TextWidgetInterMedium(
                      title: 'Your budgets are on track',
                      fontSize: MySize.size16,
                      fontWeight: FontWeight.w600,
                      color: Provider.of<ThemeChanger>(context)
                          .themeData ==
                          darkMode
                          ? const Color(0XFFFFFFFF)
                          : const Color(0XFF424252),),
                    SizedBox(
                      width: MySize.size8,
                    ),
                    Image.asset(AppImages.handIcon,
                        width: MySize.size14, height: MySize.size16)
                  ],
                ),
              ),
              SizedBox(
                height: MySize.size16,
              ),
              Consumer<SpendingBudgetProvider>(builder: (context, spendingBudgetProvider, child) {
                return spendingBudgetProvider.isLoading ?const Center(child: CircularProgressIndicator(color: Colors.green,),)
                    : spendingBudgetProvider.spendingBudgetData.isEmpty ? const Center(child: Text("Error please try again"),)
                    : spendingBudgetProvider.spendingBudgetData['data'].length ==0  ?  const Center(child: Text("Data not found"),)   :           ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: spendingBudgetProvider.spendingBudgetData['data'].length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var finalData = spendingBudgetProvider.spendingBudgetData['data'][index];
                    double totalBudget = finalData['total_budget'] != null? double.parse(finalData['total_budget'].toString()) : 1.0; // Avoid division by zero
                    double spentBudget = finalData['price']!= null? double.parse(finalData['price'].toString()) : 0.0;
                    double progressPercentage = (spentBudget / totalBudget) * 1;
                    randomColors = generateRandomColors(spendingBudgetProvider.spendingBudgetData['data'].length);

                    return GestureDetector(
                      onTap: (){
                        if(finalData['user_id'] == null){
                          if(finalData['total_budget'] == null){
                            showBudgetDialog(context: context , categoryName: finalData['name'],categoryID: finalData['id'].toString());
                          }else{
                            FlutterToast.toastMessage(message: "Budget is already set");
                          }
                        }else{
                          addProvider(context: context , categoryName: finalData['name'],categoryID: finalData['id'].toString());
                          // open dialog box for add provider
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.only(bottom: MySize.size8),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                              EdgeInsets.symmetric(horizontal: MySize.size24),
                              child: Container(
                                height: MySize.scaleFactorHeight * 96,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(MySize.size16),
                                    color: Provider.of<ThemeChanger>(context)
                                        .themeData ==
                                        darkMode
                                        ? const Color(0XFF4E4E61).withOpacity(0.2)
                                        : const Color(0XFFF1F1FF),
                                    border: Border.all(
                                      color: Provider.of<ThemeChanger>(context)
                                          .themeData ==
                                          darkMode
                                          ? const Color(0XFFCFCFFC)
                                          .withOpacity(0.15)
                                          : const Color(0XFFCFCFFC)
                                          .withOpacity(0.15),
                                    )),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ListTile(
                                      title: Text(
                                        finalData['name'] ??"",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: MySize.size16,
                                          fontWeight: FontWeight.w600,
                                          color: Provider.of<ThemeChanger>(context)
                                              .themeData ==
                                              darkMode
                                              ? const Color(0XFFFFFFFF)
                                              : const Color(0XFF424252),
                                        ),
                                      ),
                                      subtitle: Text(
                                        "\$${finalData['left_to_spend']??"0"} left to spend",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: MySize.size12,
                                          fontWeight: FontWeight.w500,
                                          color: Provider.of<ThemeChanger>(context)
                                              .themeData ==
                                              darkMode
                                              ? const Color(0xFFA2A2B5)
                                              : const Color(0xFFA2A2B5),
                                        ),
                                      ),

                                      leading:     Image.asset(
                                        AppImages.carIcon,
                                        width: MySize.size32,
                                        height: MySize.size32,
                                      ),
                                      trailing: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(" ${finalData['user_id'] == null ? finalData['total_budget'] == null?"Set Budget": "":"Add Provider"}",style: TextStyle(
                                            fontSize: MySize.size14,
                                            fontWeight: FontWeight.w600,
                                            color:
                                            Provider.of<ThemeChanger>(context)
                                                .themeData ==
                                                darkMode
                                                ? const Color(0XFFFFFFFF)
                                                : const Color(0XFF424252),
                                          ),),
                                          Text(
                                            "\$${finalData['price']??"0"}",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontSize: MySize.size14,
                                              fontWeight: FontWeight.w600,
                                              color:
                                              Provider.of<ThemeChanger>(context)
                                                  .themeData ==
                                                  darkMode
                                                  ? const Color(0XFFFFFFFF)
                                                  : const Color(0XFF424252),
                                            ),
                                          ),
                                          Text(
                                            "of \$${finalData['total_budget']??"0"}",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontSize: MySize.size12,
                                              fontWeight: FontWeight.w500,
                                              color:
                                              Provider.of<ThemeChanger>(context)
                                                  .themeData ==
                                                  darkMode
                                                  ? const Color(0XFFA2A2B5)
                                                  : const Color(0XFFA2A2B5),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          bottom: MySize.size5,
                                          left: MySize.size20,
                                          right: MySize.size25),
                                      child: LinearColorBarWidget(color: randomColors[index],progress: progressPercentage),

                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MySize.size24, vertical: MySize.size8),
                child: GestureDetector(
                  onTap: () {
                    Provider.of<CategoryProvider>(context,listen: false).displayDialog(context: context);
                  },
                  child: DottedBorder(
                    dashPattern: const [6, 6, 6, 6],
                    color:
                    Provider.of<ThemeChanger>(context).themeData == darkMode
                        ? const Color(0XFF4E4E61)
                        : const Color(0XFF4E4E61).withOpacity(.5),
                    strokeWidth: 1,
                    borderType: BorderType.RRect,
                    radius: Radius.circular(MySize.size12),
                    child: SizedBox(
                      height: MySize.scaleFactorHeight * 84,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Add new category',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: MySize.size14,
                              fontWeight: FontWeight.w600,
                              color: Provider.of<ThemeChanger>(context)
                                  .themeData ==
                                  darkMode
                                  ? const Color(0XFFA2A2B5)
                                  : const Color(0XFFA2A2B5),
                            ),
                          ),
                          SizedBox(width: MySize.size10),
                          Container(
                            height: MySize.size16,
                            width: MySize.size16,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius:
                              BorderRadius.circular(MySize.size90),
                              border: Border.all(
                                color: Provider.of<ThemeChanger>(context)
                                    .themeData ==
                                    darkMode
                                    ? const Color(0xFF4E4E61).withOpacity(0.4)
                                    : const Color(0xFF4E4E61).withOpacity(0.4),
                                width: 1.5,
                              ),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.add,
                                color: Provider.of<ThemeChanger>(context)
                                    .themeData ==
                                    darkMode
                                    ? const Color(0XFFA2A2B5)
                                    : const Color(0XFFA2A2B5),
                                size: MySize.size14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MySize.size20,
              )
            ],
          ),
        ),
      ),
    );
  }
  void showBudgetDialog({required BuildContext context, required String categoryName, required String categoryID}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SetBudgetDialog(categoryName: categoryName,categoryId: categoryID,);
      },
    );
  }

  void addProvider({required BuildContext context, required String categoryName, required String categoryID}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddProviderDialog(categoryName: categoryName,categoryId: categoryID,);
      },
    );
  }
}
