import 'dart:math';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Provider/currency_Provider.dart';
import 'package:sub_tracker/Provider/spending_budget_provider.dart';
import 'package:sub_tracker/Widget/app_bar_widget.dart';
import 'package:sub_tracker/utils/app_Images.dart';
import 'package:sub_tracker/utils/app_colors.dart';
import 'package:sub_tracker/utils/app_constant.dart';
import 'package:sub_tracker/utils/flutter_toast.dart';
import 'package:sub_tracker/views/home_screen/Component/linear_progress.dart';
import 'package:sub_tracker/views/spending_budgets/component/add_provider_dialog.dart';
import 'package:sub_tracker/views/spending_budgets/component/set_budget_dialog.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../../Provider/category_provider.dart';
import '../../theme/theme.dart';
import '../../utils/my_size.dart';
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
    Future.microtask(() =>
        Provider.of<SpendingBudgetProvider>(context, listen: false)
            .getSpendingBudget(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
      backgroundColor:
          Provider.of<ThemeChanger>(context).themeData == darkMode ?
          Colors.black
              : const Color(0XFFFFFFFF),
      appBar:  CustomAppBarInAll(leading: true,actions: true,title: AppLocalizations.of(context)!.spending_budgets),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: MySize.scaleFactorHeight * 43,
            ),
            Consumer<SpendingBudgetProvider>(
              builder: (context, spendingBudgetProvider, child) {
                return SizedBox(
                  height: MySize.scaleFactorHeight * 160,
                  child: SfRadialGauge(
                    axes: <RadialAxis>[
                      RadialAxis(
                        startAngle: 180,
                        endAngle: 360,
                        radiusFactor: 01.2,
                        showLabels: false,
                        showTicks: false,
                        axisLineStyle: AxisLineStyle(
                          thickness: 0.07,
                          cornerStyle: CornerStyle.bothCurve,
                          color:
                              Provider.of<ThemeChanger>(context).themeData ==
                                      darkMode
                                  ? Colors.white
                                  : Colors.black,
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
                            widget: Consumer<CurrencyProvider>(
                              builder: (context, currencyProvider, child) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      AppConstant.validatePrice(context: context,price: double.parse(spendingBudgetProvider.totalSpendBudget.toString())),
                                      // '${currencyProvider.selectedCurrencySymbol}${spendingBudgetProvider.totalSpendBudget}',
                                      style: TextStyle(
                                          fontSize: MySize.size24,
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w700,
                                          color: Provider.of<ThemeChanger>(context).themeData == darkMode? Colors.white: Color(0xFF424252)),
                                    ),
                                    SizedBox(height: MySize.size4),
                                    Text(
                                      'of ${AppConstant.validatePrice(context: context,price: double.parse(spendingBudgetProvider.totalSpendBudget.toString()))} budget',
                                      style: TextStyle(
                                        fontSize: MySize.size12,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFFA2A2B5),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
            Container(
              height: MySize.size60,
              // width: MySize.scaleFactorWidth * 326,
              margin: EdgeInsets.symmetric(horizontal: MySize.scaleFactorWidth * 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.transparent,
                border: Border.all(
                    color: Provider.of<ThemeChanger>(context).themeData == darkMode
                        ? const Color(0xFF4E4E61)
                        : const Color(0xFF4E4E61).withOpacity(.20),
                    width: 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidgetInterMedium(
                    title: AppLocalizations.of(context)!.your_budgets_are_on_track,
                    fontSize: MySize.size14,
                    fontWeight: FontWeight.w600,
                    color: Provider.of<ThemeChanger>(context).themeData ==
                            darkMode
                        ? const Color(0XFFFFFFFF)
                        : const Color(0XFF424252),
                  ),
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
            Consumer<SpendingBudgetProvider>(
              builder: (context, spendingBudgetProvider, child) {
                return spendingBudgetProvider.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.purpleFF,
                        ),
                      )
                    : spendingBudgetProvider.spendingBudgetData.isEmpty
                        ?  Center(
                            child: Text(AppLocalizations.of(context)!.error_please_try_again),
                          )
                        : spendingBudgetProvider
                                    .spendingBudgetData['data'].length ==
                                0
                            ?  Center(
                                child: Text(AppLocalizations.of(context)!.data_not_found),
                              )
                            : Container(
                  margin: EdgeInsets.symmetric(horizontal: MySize.scaleFactorWidth * 24),
                              child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: spendingBudgetProvider
                                      .spendingBudgetData['data'].length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    var finalData = spendingBudgetProvider
                                        .spendingBudgetData['data'][index];
                                    double totalBudget =
                                        finalData['total_budget'] != null
                                            ? double.parse(
                                                finalData['total_budget']
                                                    .toString())
                                            : 1.0; // Avoid division by zero
                                    double spentBudget =
                                        finalData['price'] != null
                                            ? double.parse(
                                                finalData['price'].toString())
                                            : 0.0;
                                    double progressPercentage =
                                        (spentBudget / totalBudget) * 1;
                                    randomColors = generateRandomColors(
                                        spendingBudgetProvider
                                            .spendingBudgetData['data'].length);

                                    return GestureDetector(
                                      onTap: () {
                                        if (finalData['user_id'] == null) {
                                          if (finalData['total_budget'] ==
                                              null) {
                                            showBudgetDialog(
                                                context: context,
                                                categoryName: finalData['name'],
                                                categoryID:
                                                    finalData['id'].toString());
                                          } else {
                                            FlutterToast.toastMessage(message:AppLocalizations.of(context)!.budget_is_already_set);
                                          }
                                        } else {
                                          addProvider(
                                              context: context,
                                              categoryName: finalData['name'],
                                              categoryID: finalData['id'].toString());
                                          // open dialog box for add provider
                                        }
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 8),
                                        child: Column(
                                          children: [
                                            Consumer<CurrencyProvider>(
                                              builder: (context,
                                                  currencyProvider, child) {
                                                return Container(
                                                  height: MySize.scaleFactorHeight * 110,
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius
                                                              .circular(MySize.size16),
                                                      color: Provider.of<ThemeChanger>(
                                                                      context)
                                                                  .themeData ==
                                                              darkMode
                                                          ? const Color(
                                                                  0XFF4E4E61)
                                                              .withOpacity(
                                                                  0.2)
                                                          : const Color(
                                                              0XFFF1F1FF),
                                                      border: Border.all(
                                                        color: Provider.of<ThemeChanger>(
                                                                        context)
                                                                    .themeData ==
                                                                darkMode
                                                            ? const Color(
                                                                    0XFFCFCFFC)
                                                                .withOpacity(
                                                                    0.15)
                                                            : const Color(
                                                                    0XFFCFCFFC)
                                                                .withOpacity(
                                                                    0.15),
                                                      )),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      ListTile(
                                                        title: Text(
                                                          finalData['name'] ??
                                                              "",
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: TextStyle(
                                                            fontSize:
                                                                MySize.size16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600,
                                                            color: Provider.of<ThemeChanger>(
                                                                            context)
                                                                        .themeData ==
                                                                    darkMode
                                                                ? const Color(
                                                                    0XFFFFFFFF)
                                                                : const Color(
                                                                    0XFF424252),
                                                          ),
                                                        ),

                                                        subtitle: Text(
                                                          "${AppConstant.validatePrice(context: context,price: double.parse(finalData['left_to_spend'].toString()))} left to spend",
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: TextStyle(
                                                            fontSize:
                                                                MySize.size12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500,
                                                            color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                                                ? const Color(0xFFA2A2B5)
                                                                : const Color(0xFFA2A2B5),
                                                          ),
                                                        ),
                                                        leading: Image.asset(
                                                          AppImages.carIcon,
                                                          width:
                                                              MySize.size32,
                                                          height:
                                                              MySize.size32,
                                                        ),
                                                          trailing: Column(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              Flexible(
                                                                child: Text(
                                                                  "${finalData['user_id'] == null ? finalData['total_budget'] == null ? AppLocalizations.of(context)!.set_budget : "" : AppLocalizations.of(context)!.add_provider}",
                                                                  style: TextStyle(
                                                                    fontSize: MySize.size14,
                                                                    fontWeight: FontWeight.w600,
                                                                    color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                                                        ? const Color(0XFFFFFFFF)
                                                                        : const Color(0XFF424252),
                                                                  ),
                                                                  softWrap: true, // Allow text to wrap within the available space
                                                                  overflow: TextOverflow.ellipsis, // Handle overflow with ellipsis
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child: Text(
                                                                  AppConstant.validatePrice(context: context,price: double.parse(finalData['price'].toString())),
                                                                  textAlign: TextAlign.start,
                                                                  style: TextStyle(
                                                                    fontSize: MySize.size14,
                                                                    fontWeight: FontWeight.w600,
                                                                    color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                                                        ? const Color(0XFFFFFFFF)
                                                                        : const Color(0XFF424252),
                                                                  ),
                                                                  softWrap: true,
                                                                  overflow: TextOverflow.ellipsis,
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child: Text(
                                                                  "of ${AppConstant.validatePrice(context: context,price: double.parse(finalData['total_budget'] == null ? "0":finalData['total_budget'].toString()))}",
                                                                  textAlign: TextAlign.start,
                                                                  style: TextStyle(
                                                                    fontSize: MySize.size12,
                                                                    fontWeight: FontWeight.w500,
                                                                    color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                                                        ? const Color(0XFFA2A2B5)
                                                                        : const Color(0XFFA2A2B5),
                                                                  ),
                                                                  softWrap: true,
                                                                  overflow: TextOverflow.ellipsis,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(

                                                                left: MySize
                                                                    .size20,
                                                                right: MySize
                                                                    .size25),
                                                        child: LinearColorBarWidget(
                                                            color:
                                                                randomColors[
                                                                    index],
                                                            progress:
                                                                progressPercentage),
                                                      )
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                            );
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MySize.size24, vertical: MySize.size8),
              child: GestureDetector(
                onTap: () {
                  Provider.of<CategoryProvider>(context, listen: false)
                      .displayDialog(context: context);
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
                          AppLocalizations.of(context)!.add_new_category,
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
                        SizedBox(width:  MySize.size10,),
                        SizedBox(
                          width: MySize.size20,
                          child: Image.asset(AppImages.addIcon),
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
    );
  }

  void showBudgetDialog(
      {required BuildContext context,
      required String categoryName,
      required String categoryID}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SetBudgetDialog(
          categoryName: categoryName,
          categoryId: categoryID,
        );
      },
    );
  }

  void addProvider(
      {required BuildContext context,
      required String categoryName,
      required String categoryID}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddProviderDialog(
          categoryName: categoryName,
          categoryId: categoryID,
        );
      },
    );
  }
}
