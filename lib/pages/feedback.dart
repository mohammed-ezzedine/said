import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:said/components/said-text.dart';
import 'package:said/components/said-title.dart';
import 'package:said/components/said-widget-card.dart';
import 'package:said/services/api.dart';

class SaidFeedback extends StatefulWidget {
  const SaidFeedback({ Key? key }) : super(key: key);

  @override
  _SaidFeedbackState createState() => _SaidFeedbackState();
}

class _SaidFeedbackState extends State<SaidFeedback> {

  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  TextEditingController storyController = TextEditingController();
  TextEditingController feedbackController = TextEditingController();

  bool storySent = false;
  bool feedbackSent = false;

  sendStory() {
    postStory(storyController.text).then((value) => setState(() {
      storyController.clear();
      storySent = true;
    }));
  }

  sendFeedback() {
    postFeedback(feedbackController.text).then((value) => setState(() {
      feedbackController.clear();
      feedbackSent = true;
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: ListView(
        children: [
          Form(
            key: _formKey1,
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    SaidText(
                      text: AppLocalizations.of(context)!.feedbackStory,
                    ),
                    TextFormField(
                      controller: storyController,
                      maxLines: 20,
                      minLines: 5,
                    ),
                    Card(
                      elevation: 2,
                      color: Color(0xFFF59E0B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextButton(
                            onPressed: sendStory,
                            child: Text(
                              AppLocalizations.of(context)!.send,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18
                              ),
                            ),
                          ),
                          if (storySent)
                            Icon(Icons.check)
                        ]
                      ),
                    )
                  ],
                )
              ),
            )
          ),
           Form(
            key: _formKey2,
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    SaidText(
                      text: AppLocalizations.of(context)!.feedbackApp,
                    ),
                    TextFormField(
                      controller: feedbackController,
                      maxLines: 20,
                      minLines: 5,
                    ),
                    Card(
                      elevation: 2,
                      color: Color(0xFFF59E0B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextButton(
                            onPressed: sendFeedback,
                            child: Text(
                              AppLocalizations.of(context)!.send,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18
                              ),
                            ),
                          ),
                          if (feedbackSent)
                            Icon(Icons.check)
                        ]
                      ),
                    )
                  ],
                ),
              )
            ),
          )
        ],
      ),
    );
  }
}