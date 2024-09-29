import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sitegalleria/components/my_Textfeild.dart';
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
  final double sectionHeight = 400.0;

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
    final targetOffset = index * sectionHeight;
    scrollController.animateTo(
      targetOffset,
      duration: const Duration(milliseconds: 500),
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
      return Container(
        height: sectionHeight,
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
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: serviceList.length,
                itemBuilder: (context, index) {
                  final service = serviceList[index];
                  return Container(
                    margin: const EdgeInsets.only(right: 16.0),
                    width: 200, // Define width for each service card
                    decoration: BoxDecoration(
                      color: Colors.grey[850],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            service.title,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "\$${service.price}",
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Rating: ${service.rating}",
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
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
                height: 30,
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
              const SizedBox(height: 20),
              // Search field
              const MyTextfeild(),
              const SizedBox(height: 30),

              // Tab Bar
              MyTabBar(tabController: tabController),

              const SizedBox(
                height: 30,
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
