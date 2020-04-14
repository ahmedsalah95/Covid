import 'package:corona/survey.dart';
import 'package:flutter/material.dart';

import 'Stats.dart';

class QuestionsAndAnswers extends StatefulWidget {
  @override
  _QuestionsAndAnswersState createState() => _QuestionsAndAnswersState();
}

class _QuestionsAndAnswersState extends State<QuestionsAndAnswers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: new Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Stats()),
                );
              },
              leading: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Icon(Icons.filter_frames),
              ),
              title: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "احصائيات",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Survey()),
                );
              },
              leading: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Icon(Icons.local_hospital),
              ),
              title: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  " مساعدة",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuestionsAndAnswers()),
                );
              },
              leading: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Icon(Icons.question_answer),
              ),
              title: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "أسئلة شائعة",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: ListView(
              children: <Widget>[
                Text(
                  "ما هي اعراض الكورونا ؟",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text("الحمى والسعال و/ أو ضيق التنفس."
                    "بعض الأشخاص المصابين بالعدوى لا تظهر عليهم في البداية الأعراض."
                    "وبُلّغ أيضاً عن الإصابة بأعراض مَعدِية معوية تشمل الإسهال."
                    "وقد تشمل الحالات الحرجة الفشل التنفسي الذي يتطلب التنفس الاصطناعي والدعم في وحدة للعناية المركزة."
                    "وأصيب بعض المرضى بفشل في وظائف بعض الأعضاء، ولاسيما الفشل الكلوي أو الصدمة الإنتانية. ويبدو أن الفيروس يتسبب في مرض أشد وخامة لدى الأشخاص الذين يشكون من ضعف الجهاز المناعي، والمسنين، والأشخاص المصابين بأمراض مزمنة، مثل داء السكري والسرطان وأمراض الرئة المزمنة.لذا إذا كنت تعاني من الام في الحلق والصدر او التنفس أو حمى أو أعراض انفلونزا .. أو إسهال .. الرجاء التوجه للكشف لدى طبيب مختص"),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 3,
                  width: 10,
                  color: Colors.black,
                ),
                Text(
                  "متى تظهر الاعراض ؟",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                    "الأرقام غير مؤكدة حتى هذه اللحظه و لكن في المتوسط 14 يومز بعد الحالات ظهرت الاعراض بعد 5 أيام و بعضها وصل ل٢٨ يوم"),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 3,
                  width: 10,
                  color: Colors.black,
                ),
                Text(
                  " ما هي سبل الوقاية ؟",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                    "غسل اليدين جيداً، والصابون قادر على القضاء على الفيروسات"
                     "  تغطية الفم والأنف عند العطس أو السعال وغسل اليدين بعدها لمنع انتشار الفيروس "
                        "تجنب لمس العينين والأنف والفم حال ملامسة اليد لسطح يُرجح أن يكون ملوثاً بالفيروس، إذ يمكن أن ينتقل الفيروس إلى الجسم بهذه الطريقة."),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
