import 'package:apihit/model.dart';
import 'package:apihit/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback(
      (_) {
        context.read<UserProvider>().fetchUser();
        
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<UserProvider>(
          builder: (context, userProvider, child) {
           if(userProvider.user==null)
           {
            return CircularProgressIndicator();
           }else{
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(userProvider.user!.address),
                Text(userProvider.user!.business_name),
                Text(userProvider.user!.email),
                Text(userProvider.user!.phone)
              ],
            );
           }
           
          } 
        ),
      ),
    );
  }
}
