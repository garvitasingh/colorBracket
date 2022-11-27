import 'package:flutter/material.dart';
import 'package:garvita_colorbracket/Constants/app_constants.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';

import '../Function/employeeApi.dart';
import '../Model/employeesModel.dart';

class EmployeeDetail extends StatefulWidget {
  String employeeName;
  String id;
  EmployeeDetail({
    Key? key,
    required this.employeeName,
    required this.id,
  });

  @override
  State<EmployeeDetail> createState() => _EmployeeDetailState();
}

class _EmployeeDetailState extends State<EmployeeDetail> {
  EmployeesModel? employeeData;
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  @override
  void initState() {
    _getEmployeeDetail();
    super.initState();
  }

  _getEmployeeDetail() async {
    employeeData = await Employee().getDetail(widget.id);
    print(employeeData!.company);

    setState(() {

    });
  }

  // _viewMore() async {
  //   Uri url = Uri.parse(employeeData!.viewMore.toString());
  //   if (await canLaunchUrl(url)) {
  //     await launchUrl(url, mode: LaunchMode.externalApplication);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.employeeName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child:employeeData == null ?
        const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlue,
              strokeWidth: 3,
            ))
            : Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                vertical: deviceHeight(context) * 0.05,
              ),
              height: 120.0,
              width: 100.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: employeeData!.companyLogo == null
                      ? const NetworkImage("https://via.placeholder.com/150")
                      : NetworkImage(employeeData!.companyLogo.toString()),
                  fit: BoxFit.fill,
                ),
                shape: BoxShape.rectangle,
              ),
            ),
            Row(
              children: [
                const Icon(
                  Icons.person,
                  shadows: <Shadow>[
                    BoxShadow(
                      color: Constants.Icon_shadow,
                      spreadRadius: 4,
                      blurRadius: 10,
                    ),
                    BoxShadow(
                      color: Constants.Icon_shadow,
                      spreadRadius: -4,
                      blurRadius: 5,
                    )
                  ],
                  size: 25,
                  color: Constants.ICON,
                ),
                const SizedBox(
                  width: 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Name : ",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      employeeData!.name.toString(),
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                  ],
                )
              ],
            ),
            Row(
              children: [
                const Icon(
                  Icons.star_rate_outlined,
                  shadows: <Shadow>[
                    BoxShadow(
                      color: Constants.Icon_shadow,
                      spreadRadius: 4,
                      blurRadius: 10,
                    ),
                    BoxShadow(
                      color: Constants.Icon_shadow,
                      spreadRadius: -4,
                      blurRadius: 5,
                    )
                  ],
                  size: 25,
                  color: Constants.ICON,
                ),
                const SizedBox(
                  width: 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Ratting : ",
                      style:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      employeeData!.rating.toString(),
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                  ],
                )
              ],
            ),
            Row(
              children: [
                const Icon(Icons.work,
                    shadows: <Shadow>[
                      BoxShadow(
                        color: Constants.Icon_shadow,
                        spreadRadius: 4,
                        blurRadius: 10,
                      ),
                      BoxShadow(
                        color: Constants.Icon_shadow,
                        spreadRadius: -4,
                        blurRadius: 5,
                      )
                    ],
                    size: 20,
                    color: Constants.ICON),
                const SizedBox(
                  width: 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Designation : ",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      employeeData!.designation.toString(),
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
            Row(
              children: [
                const Icon(Icons.interests,
                    shadows: <Shadow>[
                      BoxShadow(
                        color: Constants.Icon_shadow,
                        spreadRadius: 4,
                        blurRadius: 10,
                      ),
                      BoxShadow(
                        color: Constants.Icon_shadow,
                        spreadRadius: -4,
                        blurRadius: 5,
                      )
                    ],
                    size: 25,
                    color: Constants.ICON),
                const SizedBox(
                  width: 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Company : ",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      employeeData!.company.toString(),
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
            Row(
              children: [
                const Icon(Icons.assured_workload,
                    shadows: <Shadow>[
                      BoxShadow(
                        color: Constants.Icon_shadow,
                        spreadRadius: 4,
                        blurRadius: 10,
                      ),
                      BoxShadow(
                        color: Constants.Icon_shadow,
                        spreadRadius: -4,
                        blurRadius: 5,
                      )
                    ],
                    size: 25,
                    color: Constants.App_bar_light),
                const SizedBox(
                  width: 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Interest : ",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      employeeData!.interests.toString(),
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
            Row(
              children: [
                const Icon(Icons.description,
                    shadows: <Shadow>[
                      BoxShadow(
                        color: Constants.Icon_shadow,
                        spreadRadius: 4,
                        blurRadius: 10,
                      ),
                      BoxShadow(
                        color: Constants.Icon_shadow,
                        spreadRadius: -4,
                        blurRadius: 5,
                      )
                    ],
                    size: 20,
                    color: Constants.ICON),
                const SizedBox(
                  width: 25,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Job Description : ",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      employeeData!.jobDescripton.toString(),
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ))
              ],
            ),
            TextButton(
                onPressed: (){
                  _launchURL(context, employeeData!.viewMore.toString());
                },
                child: const Text(
                  "View More",
                  style: TextStyle(
                    fontSize: 20,
                    color: Constants.LINK_BLUE,
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Future<void> _launchURL(BuildContext context, String url) async {
    final theme = Theme.of(context);
    try {
      await launch(
        url,
        customTabsOption: CustomTabsOption(
          toolbarColor: theme.primaryColor,
          enableDefaultShare: true,
          enableUrlBarHiding: true,
          showPageTitle: true,
          animation: CustomTabsSystemAnimation.slideIn(),
          extraCustomTabs: const <String>[
            // ref. https://play.google.com/store/apps/details?id=org.mozilla.firefox
            'org.mozilla.firefox',
            // ref. https://play.google.com/store/apps/details?id=com.microsoft.emmx
            'com.microsoft.emmx',
          ],
        ),
        safariVCOption: SafariViewControllerOption(
          preferredBarTintColor: theme.primaryColor,
          preferredControlTintColor: Colors.white,
          barCollapsingEnabled: true,
          entersReaderIfAvailable: false,
          dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
        ),
      );
    } catch (e) {
      // An exception is thrown if browser app is not installed on Android device.
      debugPrint(e.toString());
    }
  }
}
