import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:mamopay_test/design_system/mamo_text.dart';
import 'package:mamopay_test/features/welcome/cubit/welcome_cubit.dart';
import 'package:mamopay_test/features/welcome/view/images_paths.dart';
import 'package:mamopay_test/repository/repository.dart';
import 'package:cached_network_image/cached_network_image.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  final cubit = WelcomeCubit(authContract: Register.instance<AuthContract>());
  @override
  Widget build(BuildContext context) {
    return BlocProvider<WelcomeCubit>(
        create: (_) => cubit,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: const Color(0xFFFFFFFF),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlutterCarousel(
                  options: FlutterCarouselOptions(
                    height: MediaQuery.of(context).size.height * 0.45,
                    showIndicator: true,
                    slideIndicator: CircularStaticIndicator(
                      slideIndicatorOptions: const SlideIndicatorOptions(
                        indicatorBackgroundColor: Color(0xFFD1DCF8),
                        currentIndicatorColor: Color(0xFF3333FF),
                      ),
                    ),
                    enlargeCenterPage: true,
                    viewportFraction: 1,
                  ),
                  items: ImagesPath.imagesOnboarding.map((image) {
                    return Builder(builder: (context) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.9,
                        child: CachedNetworkImage(
                          imageUrl: image,
                          alignment: Alignment.topCenter,
                          fit: BoxFit.contain,
                        ),
                      );
                    });
                  }).toList(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                  child: MamoText.title(
                    'Connect your bank account',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color(0xFF3333FF),
                    ),
                    alignment: Alignment.center,
                    child: Material(
                      type: MaterialType.transparency,
                      child: InkWell(
                          borderRadius: BorderRadius.circular(100),
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                            child: SizedBox(
                              width: double.infinity,
                              height: 56,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                    child: MamoText.button(
                                      'Large Button',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
