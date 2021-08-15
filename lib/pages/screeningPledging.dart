import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:said/components/said-text-card.dart';
import 'package:said/components/said-widget-card.dart';

enum Option { OPTION_1, OPTION_2, OPTION_3 }

class ScreeningPledging extends StatefulWidget {
  const ScreeningPledging({ Key? key }) : super(key: key);

  @override
  _ScreeningPledgingState createState() => _ScreeningPledgingState();
}

class _ScreeningPledgingState extends State<ScreeningPledging> {

  Option option = Option.OPTION_1;

  void setOption(Option? value) {
    setState(() {  
      if (value != null)
        option = value;  
    });  
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: ListView(
        children: [
          SaidTextCard(
            title: AppLocalizations.of(context)!.screeningPledge,
            text: AppLocalizations.of(context)!.screeningPledgeText,
          ),
          SaidWidgetCard(
            child: Column(
              children: [
                ListTile(  
                  title: Text(AppLocalizations.of(context)!.screeningPledgeOption1),  
                  leading: Radio(  
                    value: Option.OPTION_1,  
                    groupValue: option,  
                    onChanged: setOption,  
                  ),  
                ),
                ListTile(  
                  title: Text(AppLocalizations.of(context)!.screeningPledgeOption2),  
                  leading: Radio(  
                    value: Option.OPTION_2,  
                    groupValue: option,  
                    onChanged: setOption,  
                  ),  
                ),
                ListTile(  
                  title: Text(AppLocalizations.of(context)!.screeningPledgeOption3),  
                  leading: Radio(  
                    value: Option.OPTION_3,  
                    groupValue: option,  
                    onChanged: setOption,  
                  ),  
                ),
              ],
            )  
          ),
          Expanded(
            child: Card(
              elevation: 2,
              color: Color(0xFFF59E0B),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              child: TextButton(
                onPressed: () { 
                  Navigator.of(context).pop();
                },
                child: Text(
              AppLocalizations.of(context)!.screeningPledgeSubmit,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                  ),
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}