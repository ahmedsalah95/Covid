class HelpForm{
  String _name;
  String _phone;

  HelpForm(this._name,this._phone);

  String toParams() => "?name=$_name&phone=$_phone";
}