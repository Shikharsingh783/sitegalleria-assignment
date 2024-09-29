import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sitegalleria/components/my_Textfeild.dart';
import 'package:sitegalleria/components/my_service_tile.dart';
import 'package:sitegalleria/components/my_tab_bar.dart';
import 'package:sitegalleria/const.dart';
import 'package:sitegalleria/models/data.dart';
import 'package:sitegalleria/models/type.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late ScrollController scrollController;

  // Heights for each section
  final double sectionHeight = 420.0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: Category.values.length,
      vsync: this,
    );
    scrollController = ScrollController();

    // Listen for tab selection and scroll to the respective section
    tabController.addListener(() {
      if (tabController.indexIsChanging) {
        scrollToSection(tabController.index);
      }
    });
  }

  // Scroll to the respective section
  void scrollToSection(int index) {
    final targetOffset = index * sectionHeight * 1.25;
    scrollController.animateTo(
      targetOffset,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOut,
    );
  }

  // Filter services by category
  List<ServiceType> filterServiceByCategory(
      Category category, List<ServiceType> services) {
    return services.where((service) => service.type == category).toList();
  }

  // Create service widgets for each category
  List<Widget> getServiceInThisCategory(List<ServiceType> services) {
    return Category.values.map((category) {
      List<ServiceType> serviceList =
          filterServiceByCategory(category, services);

      // Each category section with its services in a horizontal ListView
      return Padding(
        padding: const EdgeInsets.only(
            bottom:
                30.0), // Added bottom padding to create space between sections
        child: Container(
          height: sectionHeight * 1.18,
          padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category.toString().split('.').last.toUpperCase(),
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                  height: 20), // Space between heading and service tiles
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: serviceList.length,
                  itemBuilder: (context, index) {
                    final service = serviceList[index];
                    return MyServiceTile(service: service);
                  },
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: surfaceColor,
      body: Consumer<Data>(builder: (
        context,
        service,
        child,
      ) {
        return SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              //row 1
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    //back icon
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    //text
                    const Text(
                      'Premium Reports',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    // Icons
                    const Image(
                      image: AssetImage(
                        'assets/images/Frame 38.png',
                      ),
                      height: 40,
                      width: 40,
                    ),
                    const SizedBox(width: 10),
                    const Image(
                      image: AssetImage(
                        'assets/images/Frame 37.png',
                      ),
                      height: 40,
                      width: 40,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(left: 25),
                child: Text(
                  'Browse our Premium Reports',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 15),
              // Search field
              const MyTextfeild(),
              const SizedBox(height: 20),

              // Tab Bar
              MyTabBar(tabController: tabController),

              const SizedBox(
                height: 20,
              ),

              // ListView with ScrollController for vertical scrolling
              Expanded(
                child: ListView(
                  controller: scrollController,
                  children: getServiceInThisCategory(service.service),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
