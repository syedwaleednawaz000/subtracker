import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../theme/theme.dart';
import '../../utils/app_Images.dart';
import '../../utils/my_size.dart';
import '../language_selection/base/custom_appBar.dart';
import '../language_selection/language_selection.dart';
import 'currency_provider/currency_provider.dart';
class CurrencySelection extends StatefulWidget {
  const CurrencySelection({super.key});

  @override
  State<CurrencySelection> createState() => _CurrencySelectionState();
}

class _CurrencySelectionState extends State<CurrencySelection> {
  @override
  Widget build(BuildContext context) {
    List<String> namingLists = ['Pakistan', 'Iran', 'English (UK)', 'Pakistan', 'English (UK)', 'Iran', 'Palestine', 'English (UK)'];
    List<String> namingLists_urdu = ['PKR', 'Rial', 'GBP', 'PKR', 'GBP', 'Rial', 'JOD', 'English'];
    List<AssetImage> iconsList = const [
      AssetImage(AppImages.pkFlag),
      AssetImage(AppImages.irFlag),
      AssetImage(AppImages.gbFlag),
      AssetImage(AppImages.psFlag),
      AssetImage(AppImages.gbFlag),
      AssetImage(AppImages.irFlag),
      AssetImage(AppImages.psFlag),
      AssetImage(AppImages.gbFlag),
    ];

    return Scaffold(
      backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFF1C1C23) : Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MySize.size72),
        child: Padding(
          padding: EdgeInsets.only(left: 8, top: MySize.size25),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const CustomAppBar(
              text: 'Currency',
              icon: Icons.arrow_back_rounded,
            ),
          ),
        ),
      ),
      body: Column(
        children: [

          Expanded(
            child: CurrencyTiles(
              namingLists: namingLists,
              namingLists_urdu: namingLists_urdu,
              iconsList: iconsList,
            ),
          ),
          SizedBox(height: MySize.size10),
          const CustomSaveButton(
            Text: 'Save',
          ),
        ],
      ),
    );
  }
}

class CurrencyTiles extends StatelessWidget {
  const CurrencyTiles({
    super.key,
    required this.namingLists,
    required this.namingLists_urdu,
    required this.iconsList,
  });

  final List<String> namingLists;
  final List<String> namingLists_urdu;
  final List<AssetImage> iconsList;

  @override
  Widget build(BuildContext context) {
    return Consumer<CurrencyProvider>(
      builder: (context, currencyProvider, child) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: namingLists.length,
          itemBuilder: (context, index) {
            bool isSelected = currencyProvider.selectedIndex == index;
            return Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 8),
              child: GestureDetector(
                onTap: () {
                  currencyProvider.selectCurrency(index, namingLists[index], namingLists_urdu[index]);
                },
                child: Container(
                  height: 52,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: isSelected
                        ? (Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.blue : Colors.blue.withOpacity(0.5))
                        : (Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFF272730) : const Color(0XFFF7F7FF)),
                  ),
                  child: Center(
                    child: ListTile(
                      dense: true,
                      title: Text(
                        namingLists[index],
                        style: TextStyle(
                          color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.white : const Color(0XFF1C1C23),
                        ),
                      ),
                      leading: Image(image: iconsList[index], height: 24, width: 24),
                      trailing: Text(
                        namingLists_urdu[index],
                        style: TextStyle(
                          color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.white.withOpacity(.5) : const Color(0XFF1C1C23),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
