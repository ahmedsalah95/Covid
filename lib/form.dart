import 'package:corona/controller.dart';
import 'package:flutter/material.dart';
import 'help_form.dart';

class FormFieldC extends StatefulWidget {
  @override
  _FormFieldCState createState() => _FormFieldCState();
}

class _FormFieldCState extends State<FormFieldC> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState.validate()) {
      HelpForm helpForm = HelpForm(nameController.text, phoneController.text);
      FormController formController = FormController((String response) {
        print(response);
        if (response == FormController.STATUS_SUCCESS) {
          _showSnackBar("help message submitted");
        } else {
          _showSnackBar("error occured!!");
        }
      });
      _showSnackBar("submitting...");
      formController.submitForm(helpForm);
    }
  }

  _showSnackBar(String message) {
    final snackbar = SnackBar(content: Text(message));
    _scaffoldKey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: nameController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "enter name";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "Name",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: phoneController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "enter phone number";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "phone",
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    _submitForm();
                  },
                  child: Text("send"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
