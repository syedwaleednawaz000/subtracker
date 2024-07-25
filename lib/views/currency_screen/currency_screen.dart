import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sub_tracker/Provider/currency_Provider.dart';
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
  void initState() {
    // TODO: implement initState
    Future.microtask(() => Provider.of<CurrencyProvider>(context,listen: false).getCurrency());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFF1C1C23) : Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MySize.size72),
        child: Padding(
          padding: EdgeInsets.only(left: 8, top: MySize.size25),
          child:  CustomAppBar(
            onTap: () {
              Navigator.pop(context);
            },
            text: 'Currency',
            icon: Icons.arrow_back_rounded,
          ),
        ),
      ),
      body: Column(
        children: [

          Expanded(
            child: CurrencyTiles(),
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

  });

  // final List<String> namingLists;
  // final List<String> namingLists_urdu;
  // final List<AssetImage> iconsList;

  @override
  Widget build(BuildContext context) {
    return Consumer<CurrencyProvider>(
      builder: (context, currencyProvider, child) {
        return currencyProvider.isCurrency == true ? const Center(child: CircularProgressIndicator(color: Colors.green,),):
        currencyProvider.currencyData['data'].length == 0 ?
        const Center(child: Text("data are not available"),):
        ListView.builder(
          shrinkWrap: true,
          itemCount: currencyProvider.currencyData['data'].length,
          itemBuilder: (context, index) {
            bool isSelected = currencyProvider.selectedIndex == index;
            return Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 8),
              child: GestureDetector(
                onTap: () {
                  currencyProvider.selectCurrency(index, currencyProvider.currencyData['data'][index]['name'], currencyProvider.currencyData['data'][index]['code']);
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
                        currencyProvider.currencyData['data'][index]['name'].toString(),
                        style: TextStyle(
                          color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.white : const Color(0XFF1C1C23),
                        ),
                      ),
                      leading: const Image(image: AssetImage(AppImages.pkFlag), height: 24, width: 24),
                      trailing: Text(
                        currencyProvider.currencyData['data'][index]['code'].toString(),
                        // namingLists_urdu[index],
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
