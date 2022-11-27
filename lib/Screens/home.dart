import 'package:flutter/material.dart';
import 'package:garvita_colorbracket/Function/employeeApi.dart';
import 'package:garvita_colorbracket/Screens/employeeDetail.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Model/employeesModel.dart';
import 'package:page_transition/page_transition.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  List<EmployeesModel> employeeData = [];

  @override
  void initState(){
    getEmployee();
  }

  getEmployee() async{
    var employees = await Employee().get();
    for(var employee in employees){
      setState(() {
        employeeData.add(employee);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employees List"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: employeeData.length,
                itemBuilder: (context,index){
                return Card(
                    margin: EdgeInsets.all(5),
                    // shadowColor: Colors.red,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  child:  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 19),
                            child: Text(employeeData[index].company.toString()),
                          ),
                          ListTile(
                            trailing: Container(
                              height: 120.0,
                              width: 50.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: employeeData[index].companyLogo == null
                                      ? const NetworkImage(
                                      "https://via.placeholder.com/150")
                                      : NetworkImage(
                                      employeeData[index].companyLogo.toString()),
                                  fit: BoxFit.fill,
                                ),
                                shape: BoxShape.rectangle,
                              ),
                            ),
                            title: Text(
                              employeeData[index].name.toString(),
                              maxLines: 1,
                              style: GoogleFonts.lato(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(employeeData[index].designation.toString()),
                            //contentPadding: EdgeInsets.all(4),

                            onTap: () => {
                              Navigator.push(
                                context,
                                PageTransition(
                                    child: EmployeeDetail(employeeName: employeeData[index].name.toString() ,id: employeeData[index].id.toString()),
                                    type: PageTransitionType.rightToLeftWithFade,
                                  duration: Duration(milliseconds: 500)
                                )
                              )
                            },
                          ),
                        ],
                      )));
                }),
          ),
        ],
      ),
    );
  }
}
