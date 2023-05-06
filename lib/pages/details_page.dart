import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/cubit/app_cubits.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_button.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is DetailState) {
            var placeInfo = state.place;
            // int selectedIndex = placeInfo.people;
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // height: ,
                      width: double.maxFinite,
                      child: Stack(
                        children: [
                          Positioned(
                            child: Container(
                              width: double.maxFinite,
                              height: 300,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'http://mark.bslmeiyu.com/uploads/${placeInfo.img}'),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          Positioned(
                              child: Container(
                                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        BlocProvider.of<AppCubits>(context).goHome();
                                      },
                                      icon: const Icon(
                                        Icons.menu,
                                        color: Colors.white,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.scatter_plot_rounded,
                                        color: Colors.white,
                                      ),
                                    ),
                              ],
                            ),
                          )),
                          Positioned(
                              top: 265,
                              child: Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(35),
                                        topRight: Radius.circular(35)),
                                    color: Colors.white),
                              ))
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(
                            text: placeInfo.name,
                            color: Colors.black.withOpacity(0.8),
                          ),
                          AppLargeText(
                            text: '\$ ${placeInfo.price}',
                            color: AppColors.mainColor,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 20,
                            color: AppColors.mainColor,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          AppText(
                            text: placeInfo.location,
                            color: AppColors.textColor1,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Wrap(
                            children: List.generate(5, (index) {
                              return Icon(
                                Icons.star,
                                color: placeInfo.stars > index
                                    ? AppColors.starColor
                                    : AppColors.textColor1,
                              );
                            }),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          AppText(
                            text: '(${placeInfo.stars}.0)',
                            color: AppColors.textColor2,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppLargeText(
                                text: 'People',
                                color: Colors.black.withOpacity(0.8),
                                size: 20),
                            const SizedBox(
                              height: 5,
                            ),
                            AppText(
                              text: 'Number of people in your group',
                              color: AppColors.mainTextColor,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Wrap(
                              children: List.generate(5, (index) {
                                return Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = index;
                                      });
                                      // index = selectedIndex;
                                    },
                                    child: AppButton(
                                      text: (index + 1).toString(),
                                      backgroundColor: selectedIndex == index
                                          ? Colors.black
                                          : AppColors.buttonBackground,
                                      size: 50,
                                      borderColor: selectedIndex == index
                                          ? Colors.black
                                          : AppColors.buttonBackground,
                                      color: selectedIndex == index
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                );
                              }),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            AppLargeText(
                              text: 'Decription',
                              size: 20,
                              color: Colors.black.withOpacity(0.8),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            AppText(
                              text:
                                  placeInfo.description,
                              color: AppColors.mainTextColor,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppButton(
                                  size: 60,
                                  backgroundColor: Colors.white,
                                  borderColor: AppColors.textColor1,
                                  isIcon: true,
                                  icon: Icons.favorite_border,
                                  color: AppColors.textColor1,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                const Flexible(
                                    child: ResponsiveButton(
                                        isResponsive: true,
                                        text: Text(
                                          'Book Trip Now',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16),
                                        ))),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
