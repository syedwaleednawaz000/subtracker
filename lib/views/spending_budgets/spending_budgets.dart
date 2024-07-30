import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/utils/app_Images.dart';
import 'package:sub_tracker/utils/app_colors.dart';
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
  List<String> titleText = ['Auto & Transport', 'Entertainment', 'Security'];
  List<String> subtitleText = [
    '\$375 left to spend',
    '\$375 left to spend',
    '\$375 left to spend'
  ];

  List<String> trailTitle = ['\$25.99', '\$50.99', '\$5.99'];
  List<String> trailSubtitle = ['of \$400', 'of \$600', 'of \$600'];

  List<Color> gradientColors = [
    AppColors.accent100,
    const Color(0XFF758AFF),
    AppColors.purpleLine
  ];

  List<int> lineMaxSteps = [30, 30, 30];
  List<int> lineCurrentSteps = [10, 18, 24];

  List<Widget> myIcon = [
    Image.asset(
      AppImages.carIcon,
      scale: 4,
    ),
    Image.asset(
      AppImages.starsIcon,
      scale: 4,
    ),
    Image.asset(
      AppImages.fingerIcon,
      scale: 4,
    ),
  ];
  TextEditingController? addCategoryController = TextEditingController();
  TextEditingController? priceController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(MySize.size72),
          child: Padding(
            padding: EdgeInsets.only(left: 8, top: MySize.size25),
            child: AppBar(
              automaticallyImplyLeading: false,
              scrolledUnderElevation: 0,
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text(
                'Spending & Budgets',
                style: TextStyle(
                    color: const Color(0XFFA2A2B5),
                    fontSize: MySize.size16,
                    fontWeight: FontWeight.w400),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 25),
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
                        height: 25,
                        width: 25,
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
                height: MySize.size42,
              ),
              SizedBox(
                height: MySize.scaleFactorHeight*160,
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
                      annotations: const <GaugeAnnotation>[
                        GaugeAnnotation(
                          angle: 90,
                          positionFactor: 00,
                          widget: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                '\$82,97',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'of \$2,000 budget',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
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
                          : const Color(0XFF4E4E61).withOpacity(.2),
                      width: 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidgetInterMedium(
                        title: 'Your budgets are on track',
                        // color: AppColors.white100,
                        fontSize: MySize.size14),
                    SizedBox(
                      width: MySize.size25,
                    ),
                    Image.asset(AppImages.handIcon, width: 14, height: 16)
                  ],
                ),
              ),
              SizedBox(
                height: MySize.size16,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: titleText.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: MySize.size8),
                    child: Column(
                      children: [
                        Container(
                          height: MySize.scaleFactorHeight * 96,
                          width: MySize.scaleFactorWidth * 326,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(MySize.size16),
                              color: Provider.of<ThemeChanger>(context)
                                          .themeData ==
                                      darkMode
                                  ? const Color(0XFF4E4E61).withOpacity(.2)
                                  : const Color(0XFFF1F1FF),
                              border: Border.all(
                                color: Provider.of<ThemeChanger>(context)
                                            .themeData ==
                                        darkMode
                                    ? const Color(0XFFCFCFFC).withOpacity(.15)
                                    : const Color(0XFFCFCFFC).withOpacity(.15),
                              )),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ListTile(
                                title: Text(
                                  titleText[index],
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
                                  subtitleText[index],
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: MySize.size12,
                                    fontWeight: FontWeight.w500,
                                    color: Provider.of<ThemeChanger>(context)
                                                .themeData ==
                                            darkMode
                                        ? const Color(0XFFA2A2B5)
                                        : const Color(0XFF424252),
                                  ),
                                ),
                                leading: myIcon[index],
                                trailing: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      trailTitle[index],
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: MySize.size16,
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
                                      trailSubtitle[index],
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: MySize.size12,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Provider.of<ThemeChanger>(context)
                                                        .themeData ==
                                                    darkMode
                                                ? const Color(0XFFA2A2B5)
                                                : const Color(0XFF424252),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: 5,
                                    left: MySize.size20,
                                    right: MySize.size25),
                                child: LinearColorBar(
                                    index: index,
                                    lineMaxSteps: lineMaxSteps,
                                    lineCurrentSteps: lineCurrentSteps,
                                    gradientColors: gradientColors),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35, right: 35, top: 15),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Consumer<CategoryProvider>(
                          builder: (context, categoryProvider, child) {
                            return AlertDialog(
                              title: Center(
                                child: Text(
                                  'Spending & Budgets',
                                  style: TextStyle(
                                    color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                        ? const Color(0XFFA2A2B5)
                                        : const Color(0XFFA2A2B5),
                                    fontSize: MySize.size18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              content: Form(
                                key: _formKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Please enter new category and its price',
                                      style: TextStyle(
                                        color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                            ? const Color(0XFFFFFFFF)
                                            : const Color(0XFF1C1C23),
                                        fontSize: MySize.size16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    TextFormField(
                                      controller: addCategoryController,
                                      validator: (value) {
                                        if (value == null || value.trim().isEmpty) {
                                          return 'Please enter category name';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        labelText: 'Category',
                                        hintText: 'Enter Category',
                                        labelStyle: TextStyle(
                                          color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                              ? const Color(0XFFFFFFFF)
                                              : const Color(0XFF1C1C23),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    TextFormField(
                                      validator: (value) {
                                        if (value == null || value.trim().isEmpty) {
                                          return 'Please enter price';
                                        }
                                        return null;
                                      },
                                      controller: priceController,
                                      decoration: InputDecoration(
                                        labelText: 'Price',
                                        hintText: 'Enter Price',
                                        labelStyle: TextStyle(
                                          color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                              ? const Color(0XFFFFFFFF)
                                              : const Color(0XFF1C1C23),
                                        ),
                                      ),
                                      keyboardType: TextInputType.number,
                                    ),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: Text(
                                    'Add',
                                    style: TextStyle(
                                      color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                          ? Colors.lightBlue
                                          : Colors.lightBlue,
                                      fontSize: MySize.size16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      categoryProvider.addCategories(
                                        categoryName: addCategoryController!.text.trim(),
                                        // price: priceController.text.trim(),
                                      );
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Center(
                                            child: Text('New category is added'),
                                          ),
                                        ),
                                      );
                                      Navigator.of(context).pop();
                                    }
                                  },
                                ),
                                TextButton(
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                      color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                          ? Colors.redAccent
                                          : Colors.redAccent,
                                      fontSize: MySize.size16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Center(
                                          child: Text(
                                            'Cancelling to add new',
                                            style: TextStyle(
                                              color: Provider.of<ThemeChanger>(context, listen: false).themeData == darkMode
                                                  ? Colors.redAccent
                                                  : Colors.redAccent,
                                              fontSize: MySize.size16,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    );
                  },
                  child: DottedBorder(
                    dashPattern: const [6, 6, 6, 6],
                    color: Provider.of<ThemeChanger>(context).themeData == darkMode
                        ? const Color(0XFF4E4E61)
                        : const Color(0XFF4E4E61).withOpacity(.5),
                    strokeWidth: 1,
                    borderType: BorderType.RRect,
                    radius: Radius.circular(MySize.size12),
                    child: SizedBox(
                      height: MySize.scaleFactorHeight * 61,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Add new category',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: MySize.size14,
                              fontWeight: FontWeight.w600,
                              color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                  ? const Color(0XFFA2A2B5)
                                  : const Color(0XFFA2A2B5),
                            ),
                          ),
                          SizedBox(width: MySize.size10),
                          Container(
                            height: MySize.size20,
                            width: MySize.size20,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(90),
                              border: Border.all(
                                color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                    ? const Color(0XFFA2A2B5)
                                    : const Color(0XFFA2A2B5),
                                width: 2,
                              ),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.add,
                                color: Provider.of<ThemeChanger>(context).themeData == darkMode
                                    ? const Color(0XFFA2A2B5)
                                    : const Color(0XFFA2A2B5),
                                size: MySize.size12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),


              const SizedBox(
                height: 60,
              )
            ],
          ),
        ),
      ),
    );
  }
}
