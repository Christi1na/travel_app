import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/cubit/app_cubits.dart';
import 'package:travel_app/misc/colors.dart';
// import 'package:travel_app/model/data_model.dart';
// import 'package:travel_app/pages/details_page.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    var exploreImages = {
      "balloning.png": "Balloning",
      "hiking.png": "Hiking",
      "kayaking.png": "Kayaking",
      "snorkling.png": "Snorkling"
    };

    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(actions: []),
      body: BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
        if (state is LoadedState) {
          var info = state.places;
          // print(info.map((e) => e.img));
          // print(info.length);
          // var nameList = info.map((e) => e.name);
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.menu, size: 30, color: Colors.black54,),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.withOpacity(0.5)
                          ),
                        )
                      ],
                    ),
                  ),
            
                  const SizedBox(height: 30,),
            
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const AppLargeText(text: 'Discover')
                  ),
                  const SizedBox(height: 20,),
            
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                        controller: tabController,
                        labelColor: Colors.black,
                        // padding: EdgeInsets.only(right: 10),
                        labelPadding: const EdgeInsets.only(left: 20, right: 20),
                        unselectedLabelColor: Colors.grey,
                        // indicatorColor: Colors.black,
                        // indicatorPadding: EdgeInsets.only(left: 5),
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicator: CircleTabIndicator(color: AppColors.mainColor, radius: 4.0),
                        tabs: const [
                          Tab(text: 'Places',),
                          Tab(text: 'Inspiration',),
                          Tab(text: 'Emotions',),
                        ]
                      ),
                    ),
                  ),

                 const SizedBox(height: 20,),

                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    height: 300,
                    width: double.maxFinite,
                    // color: Colors.amber,
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        ListView.builder(
                          itemCount: info.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                // return DetailsPage();
                                BlocProvider.of<AppCubits>(context).DetailPage(info[index]);
                              },
                              child: Container( 
                                margin: const EdgeInsets.only(right: 10),
                                width: 200,
                                height: 300,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage('http://mark.bslmeiyu.com/uploads/${info[index].img}'), 
                                    fit: BoxFit.cover
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(left: 10, bottom: 10),
                                      child: Text(info[index].name, style: const TextStyle(color: Colors.white, fontSize: 30),)
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          scrollDirection: Axis.horizontal,
                          
                        ),
                        const Text(''),
                        const Text('')
                      ]
                    ),
                  ),

                  const SizedBox(height: 40,),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const AppLargeText(text: 'Explore more', size: 22,),
                        InkWell(
                          onTap: () {
                            
                          },
                          child: AppText(text: 'See all', color: AppColors.textColor1,),
                        )
                      ],
                    ),
                  ),

                  const SizedBox(height: 20,),

                  Container(
                    height: 110,
                    // width: 110,
                    margin: const EdgeInsets.only(left: 20),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (_, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                // margin: EdgeInsets.only(right: 50),
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/${exploreImages.keys.elementAt(index)}'),
                                    fit: BoxFit.cover
                                  ),
                                  color: Colors.white
                                      
                                ),
                              ),
                              const SizedBox(height: 10,),
                              AppText(text: exploreImages.values.elementAt(index), color: AppColors.textColor2,),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
            
                  const SizedBox(height: 30,)
                ]
              ),
            ),
          ); 

        } else {
          return Container();
        }
        // places.map((e) => print(e));
        
      })
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  final double radius;
  const CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
  
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleOffset = Offset(configuration.size!.width/2 -radius/2, configuration.size!.height-radius);
    canvas.drawCircle(offset+circleOffset, radius, paint);
  }

}