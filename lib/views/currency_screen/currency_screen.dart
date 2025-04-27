import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sub_tracker/Provider/currency_Provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sub_tracker/Widget/app_bar_widget.dart';
import 'package:sub_tracker/Widget/custom_save_button.dart';
import 'package:sub_tracker/utils/app_colors.dart';
import 'package:sub_tracker/utils/flutter_toast.dart';
import '../../theme/theme.dart';
import '../../utils/my_size.dart';
import '../language_selection/language_selection.dart';

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
      backgroundColor: Provider.of<ThemeChanger>(context).themeData == darkMode ?
      Colors.black
          : const Color(0XFFFFFFFF),
      appBar:  CustomAppBarInAll(leading: false,title:  AppLocalizations.of(context)!.currency),
      body: Column(
        children: [
         SizedBox(height: MySize.size18,),
          const Expanded(
            child: CurrencyTiles(),
          ),
          SizedBox(height: MySize.size10),
        ],
      ),
      bottomNavigationBar:           Consumer<CurrencyProvider>(builder: (context, currencyProvider, child) {
        return CustomSaveButton(
          loading: currencyProvider.isUpdateCurrency,
          titleText:  AppLocalizations.of(context)!.save,
          onTap: (){
            if(currencyProvider.selectedCurrency != "Currency"){
              currencyProvider.updateCurrency(context: context,currencyCode: currencyProvider.selectedCurrency);
            }else{
              FlutterToast.toastMessage(message: AppLocalizations.of(context)!.please_select_currency,isError: true);
            }
          },
        );
      },),
    );
  }
}

class CurrencyTiles extends StatelessWidget {
  const CurrencyTiles({
    super.key,

  });
  @override
  Widget build(BuildContext context) {
    return Consumer<CurrencyProvider>(
      builder: (context, currencyProvider, child) {
        return currencyProvider.isCurrency == true ? const Center(child: CircularProgressIndicator(color: AppColors.purpleFF,),):
        currencyProvider.currencyData == null ?
        const Center(child: Text("data are not available"),):
        ListView.builder(
          shrinkWrap: true,
          itemCount: currencyProvider.currencyData['data'].length,
          itemBuilder: (context, index) {
            var finalData = currencyProvider.currencyData['data'][index];
            return Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 8),
              child: GestureDetector(
                onTap: () {
                  currencyProvider.selectCurrency(currencyCode:  currencyProvider.currencyData['data'][index]['code'],currencySymbol: currencyProvider.currencyData['data'][index]['symbol']);
                },
                child: Container(
                  height: 52,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(MySize.size15),
                    color: currencyProvider.selectedCurrency == finalData['code']
                        ? (Provider.of<ThemeChanger>(context).themeData == darkMode ? Color(0xff758AFF) : Color(0xff758AFF))
                        : (Provider.of<ThemeChanger>(context).themeData == darkMode ? const Color(0XFF272730) : const Color(0XFFF7F7FF)),
                  ),
                  child: Center(
                    child: ListTile(
                      dense: true,
                      title: Text(
                        currencyProvider.currencyData['data'][index]['name'].toString(),
                        style: TextStyle(
                          fontSize:14,
                          fontWeight: FontWeight.w500,
                          color: Provider.of<ThemeChanger>(context).themeData == darkMode ? Colors.white : const Color(0XFF1C1C23),
                        ),
                      ),
                      leading: CachedNetworkImage(
                        imageUrl: finalData['image'],
                        height: 24,
                        width: 24,
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            height: 24,
                            width: 24,
                            color: Colors.white,
                          ),
                        ),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),
                      trailing: Text(
                        currencyProvider.currencyData['data'][index]['code'].toString(),

                        style: TextStyle(
                          fontSize:12,
                          fontWeight: FontWeight.w500,
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
