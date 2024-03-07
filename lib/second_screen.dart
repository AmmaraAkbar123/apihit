import 'package:apihit/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> with TickerProviderStateMixin{
  TabController? _tabController;
  List<Tab> tabs = [];
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback(
      (_) {
        context.read<UserProvider>().fetchUser();
        _tabController =  TabController(length: tabs.length, vsync: this);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Consumer<UserProvider>(builder: (context, userProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("App Store"),
            centerTitle: true,
            bottom: TabBar(
                indicatorWeight: 8,
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color.fromARGB(255, 166, 227, 68)),
                tabs: tabs),
          ),
          body: _tabController == null ? const Text('wait ammara') : TabBarView(
            controller: _tabController,
            children: [
              Consumer<UserProvider>(builder: (context, userProvider, child) {
                 if (userProvider.user == null) {
                  return const CircularProgressIndicator();
                } else {
                  final store = userProvider.user!.appFeatures.store;
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _forBoolPerform("isProduct",
                            userProvider.user!.phone.toString(), store.isProduct),
                        _forBoolPerform("isService",
                            userProvider.user!.businessName, store.isService),
                        _forBoolPerform(
                            "isStaff", userProvider.user!.email, store.isStaff),
                        _forBoolPerform("isResource", userProvider.user!.address,
                            store.isResource),
                        _forBoolPerform("isGallery", userProvider.user!.address,
                            store.isGallery),
                        _forBoolPerform("isCheckout", userProvider.user!.email,
                            store.isCheckout),
                        _forBoolPerform("isBooking", userProvider.user!.email,
                            store.isBooking),
                        _forBoolPerform("isSearchableService",
                            userProvider.user!.email, store.isSearchableService),
                      ],
                    ),
                  );
                }
              }),
            ],
          ),
        );
      }
    );
  }

  Widget _forBoolPerform(String title, String subtitle, bool value) {
    return Column(
      children: [
        Card(
          child: ListTile(
              title: Text(
                title,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(subtitle),
              trailing:
                  value ? const Icon(Icons.done) : const Icon(Icons.cancel)),
        ),
      ],
    );
  }
}
