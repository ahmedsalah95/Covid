
import 'package:corona/help_form.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
class FormController{

  final void Function(String) callback;
  static const String URL = "https://script.google.com/macros/s/AKfycbwO_jE9XASNhwGANRr_C1VurF_9VsF-COVdg-ifg1Jig2Dcx9w/exec";

  static const STATUS_SUCCESS = "SUCCESS";

  FormController(this.callback);

  void submitForm(HelpForm helpForm)async{
    try{
          await http.get(
            URL + helpForm.toParams()
          ).then((response){
             callback(convert.jsonDecode(response.body)['status']);

          });
    }catch(e){
      print(e);
    }

  }
}