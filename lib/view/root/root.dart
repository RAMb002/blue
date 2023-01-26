import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rackathon/model/subject.dart';
import 'package:rackathon/res/dimensions.dart';

class RootView extends StatelessWidget {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<SubjectModel> subjects = [
      SubjectModel(letter: "M", subjectName: "Mathematics 1", time: "09.30 am"),
      SubjectModel(letter: "P", subjectName: "Physics", time: "10:40 am"),
      SubjectModel(letter: "B", subjectName: "Biology", time: "11:45 am"),
      SubjectModel(letter: "G", subjectName: "Geography", time: "12:10 am")
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.white,
            leading: const Icon(
              Icons.home,
              color: Colors.black,
            ),
            title: RichText(
              text: const TextSpan(
                text: 'BLUE',
                style: TextStyle(
                    fontSize: 24,
                    color: kLogoColor,
                    fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(
                      text: 'CHECK',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(
                            0xFF050B31,
                          ),
                          fontSize: 24,),),
                ],
              ),
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://s3-alpha-sig.figma.com/img/7dbe/edc0/bde26ec5908dfe87fc03f335d51c7d32?Expires=1675641600&Signature=OK4dFJMtPBGsDhuj~bKqcHA8n4mLWcUu8MgZFLipI2RRihNI~FCc5ICYkOIyOiJaik3ImK8LrTscSaS5KDPHKPcl7-bHjSm59lVZOwZgs8wvkoIkxqer9Pt03wjqjl1lHohBdpzmCvSmp0NQr7897s~k~8qERjKsmF3h8Lj1Y9LhvFuu3JZnNHcE6kqT~3W7xtgnV0OqnGZlaQ6rE3kQdtcgOCVNglNLkOcJxfOhxbqnlaFYMD09Ur2Ry6R0Jn9uOC3tsFqva79LCLQ8stFmRf5ZLCdwDm95ZrKz98OF0fBX1qLVQ20HSsoIqFef6kY7WU5N~9BoXLgpd~oTBO67yA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4")),
                    ),
                  ),
                  title: const Text(
                    "Sakshi Choudhary",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: kSecondaryColor),
                  ),
                  subtitle: const Text(
                    "sakshichoudhary@email.com",
                    style: TextStyle(
                      fontSize: 13,
                      color: kSecondaryColor
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "Hi, Sakshi.",
                  style: GoogleFonts.rubik(
                    color: kSecondaryColor,
                      fontSize: 40, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Welcome to your Class",
                  style: GoogleFonts.rubik(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor),
                ),
                const SizedBox(
                  height: 40,
                ),
                const ListTile(
                  contentPadding: EdgeInsets.zero,
                  trailing: Icon(
                    Icons.arrow_right_rounded,
                    color: kSecondaryColor,
                    size: 50,
                  ),
                  title: Text(
                    "Today's Classes",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: kSecondaryColor),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 100,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  decoration: const BoxDecoration(
                      color: Color(0xFF82CE67),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 5)),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(11)),
                        border: Border.all(
                          color: Colors.grey.shade300,
                        )),
                    child: Column(
                      children: List<Widget>.generate(
                          subjects.length,
                          (index) => ListTile(
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 2.5),
                                leading: CircleAvatar(
                                  backgroundColor: index == 0 || index == 2
                                      ? kPrimaryColor
                                      : kSecondaryColor,
                                  child: Text(subjects[index].letter,
                                      style: const TextStyle(
                                        color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ),
                                title: Text(
                                  subjects[index].subjectName,
                                  style: GoogleFonts.rubik(
                                    fontSize: 18,
                                    color: kSecondaryColor
                                  ),
                                ),
                                trailing: Text(subjects[index].time,
                                    style: GoogleFonts.rubik(
                                        fontSize: 14, color: Colors.black54)),
                              )),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
