import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/app/cubit/auth_cubit.dart';
import '../features/app/cubit/auth_state.dart';
import '../features/app_settings/address/address.dart';
import '../features/app_settings/address/widgets/add_neu_address.dart';
import '../features/app_settings/profile/profile.dart';
import '../features/app_settings/profile/widgets/change_name.dart';
import '../features/app_settings/settings/settings.dart';
import '../features/authentication/presenter/forgot_password/pages/forgot_password.dart';
import '../features/authentication/presenter/login/pages/login_screen.dart';
import '../features/authentication/presenter/onboarding/pages/onboarding_screen.dart';
import '../features/authentication/presenter/onboarding/pages/splash_screen.dart';
import '../features/authentication/presenter/onboarding/service/onboarding_prefs.dart';
import '../features/authentication/presenter/register/pages/register_screen.dart';
import '../features/main_navigation/main_navigation_view.dart';
import '../features/shop/checkout/presenter/ui/checkout.dart';
import '../features/shop/favourite/favourite_page.dart';
import '../features/shop/home/presenter/ui/home.dart';
import '../features/shop/home/presenter/ui/widgets/sub_categories.dart';
import '../features/shop/home/presenter/ui/widgets/view_all_products.dart';
import '../features/shop/orders/orders_screen.dart';
import '../features/shop/reviews/product_detail/product_reviews_screen.dart';
import '../features/shop/shopping_cart/shopping_card.dart';
import '../features/shop/stores/product/product_screen.dart';
import '../features/shop/stores/product_detail/product_detail_screen.dart';
import '../widgets/success_or_error_screens/error.dart';
import 'refresh_stream.dart';
import 'route_names.dart';
import 'route_util.dart';
import 'routes.dart';

class AppRouter {
  static GoRouter router(AuthenticationCubit authCubit) => GoRouter(
        /// The app always starts on the Home screen.
        initialLocation: AppRoutes.home,

        /// Convert stream to Listenable
        refreshListenable: GoRouterRefreshStream(authCubit.stream),

        /// GLOBAL REDIRECT LOGIC
        redirect: (context, state) async {
          // DRY Design Pattern
          final authState = authCubit.state;
          final loc = state.matchedLocation;
          final prefs = await SharedPreferences.getInstance();
          final isFirstLaunch = prefs.getBool(OnboardingPrefsKeys.isFirstTime) ?? true;

          // 1. Loading / Initial → Splash
          if (authState is AuthenticationInitial || authState is AuthenticationLoading) {
            return loc == AppRoutes.splash ? null : AppRoutes.splash;
          }

          // 2. First launch → Onboarding
          if (isFirstLaunch && loc != AppRoutes.onboarding) {
            return AppRoutes.onboarding;
          }

          // 3. Otherwise, everything is permitted.
          return null;
        },

        /// Global routes
        routes: [
          // Splash
          GoRoute(
            path: AppRoutes.splash,
            name: RouteNames.splash,
            pageBuilder: (context, state) => RouterUtil.getPlatFormPage(
              state: state,
              child: const SplashScreen(),
            ),
          ),

          // Onboarding
          GoRoute(
            path: AppRoutes.onboarding,
            name: RouteNames.onboarding,
            pageBuilder: (context, state) => RouterUtil.getPlatFormPage(
              state: state,
              child: const OnboardingScreen(),
            ),
          ),

          // Login
          GoRoute(
            path: AppRoutes.login,
            name: RouteNames.login,
            pageBuilder: (context, state) => RouterUtil.getPlatFormPage(
              state: state,
              child: const LoginScreen(),
            ),
          ),

          // Register
          GoRoute(
            path: AppRoutes.register,
            name: RouteNames.register,
            pageBuilder: (context, state) => RouterUtil.getPlatFormPage(
              state: state,
              child: const RegisterScreen(),
            ),
          ),

          // Forgot Password
          GoRoute(
            path: AppRoutes.forgotPassword,
            name: RouteNames.forgotPassword,
            pageBuilder: (context, state) => RouterUtil.getPlatFormPage(
              state: state,
              child: const ForgotPasswordScreen(),
            ),
          ),

          // Home avec BottomNav
          StatefulShellRoute.indexedStack(
            builder: (context, state, navigationShell) {
              return Scaffold(
                body: navigationShell,
                bottomNavigationBar: MainNavigationView(
                  currentIndex: navigationShell.currentIndex,
                  navigationShel: navigationShell,
                  onTap: (index) => navigationShell.goBranch(index),
                ),
              );
            },
            branches: [
              StatefulShellBranch(
                initialLocation: AppRoutes.home,
                routes: [
                  GoRoute(
                    path: AppRoutes.home,
                    name: RouteNames.home,
                    pageBuilder: (context, state) => RouterUtil.getPlatFormPage(
                      state: state,
                      child: HomePage(),
                    ),
                    routes: [
                      GoRoute(
                        path: AppRoutes.products,
                        name: RouteNames.viewAllProducts,
                        pageBuilder: (context, state) => RouterUtil.getPlatFormPage(
                          state: state,
                          child: const TViewAllProductsScreen(),
                        ),
                      ),
                      GoRoute(
                        path: AppRoutes.subCategories,
                        name: RouteNames.subCategories,
                        pageBuilder: (context, state) => RouterUtil.getPlatFormPage(
                          state: state,
                          child: const HomeSubCategories(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: AppRoutes.favorite,
                    name: RouteNames.favorite,
                    pageBuilder: (context, state) => RouterUtil.getPlatFormPage(
                      state: state,
                      child: const FavouritePage(),
                    ),
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: AppRoutes.store,
                    name: RouteNames.store,
                    pageBuilder: (context, state) => RouterUtil.getPlatFormPage(
                      state: state,
                      child: const StoreProductScreen(),
                    ),
                  ),
                ],
              ),
              StatefulShellBranch(
                initialLocation: AppRoutes.profile,
                routes: [
                  GoRoute(
                    path: AppRoutes.profile,
                    name: RouteNames.profile,
                    pageBuilder: (context, state) => RouterUtil.getPlatFormPage(
                      state: state,
                      child: const ProfilePage(),
                    ),
                    routes: [
                      GoRoute(
                        path: AppRoutes.settings,
                        name: RouteNames.settings,
                        pageBuilder: (context, state) => RouterUtil.getPlatFormPage(
                          state: state,
                          child: const SettingsPage(),
                        ),
                        routes: [
                          GoRoute(
                            path: AppRoutes.userAddress,
                            name: RouteNames.userAddress,
                            pageBuilder: (context, state) => RouterUtil.getPlatFormPage(
                              state: state,
                              child: const UserAddressScreen(),
                            ),
                            routes: [
                              GoRoute(
                                path: AppRoutes.addAddress,
                                name: RouteNames.addAddress,
                                pageBuilder: (context, state) => RouterUtil.getPlatFormPage(
                                  state: state,
                                  child: const AddNeuAddress(),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      GoRoute(
                        path: AppRoutes.changeName,
                        name: RouteNames.changeName,
                        pageBuilder: (context, state) => RouterUtil.getPlatFormPage(
                          state: state,
                          child: const ChangeNameScreen(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: AppRoutes.shoppingCart,
                    name: RouteNames.shoppingCart,
                    pageBuilder: (context, state) => RouterUtil.getPlatFormPage(
                      state: state,
                      child: const TShoppingCart(),
                    ),
                  ),
                ],
              ),
            ],
          ),

          GoRoute(
            path: AppRoutes.checkout,
            name: RouteNames.checkout,
            pageBuilder: (context, state) => RouterUtil.getPlatFormPage(
              state: state,
              child: const TCheckoutScreen(),
            ),
          ),
          GoRoute(
            path: AppRoutes.productDetail,
            name: RouteNames.productDetail,
            pageBuilder: (context, state) => RouterUtil.getPlatFormPage(
              state: state,
              child: const StoreProductDetailScreen(),
            ),
            routes: [
              GoRoute(
                path: AppRoutes.productReviews,
                name: RouteNames.productReviews,
                pageBuilder: (context, state) => RouterUtil.getPlatFormPage(
                  state: state,
                  child: const StoreProductReviewsScreen(),
                ),
              ),
            ],
          ),
          GoRoute(
            path: AppRoutes.orders,
            name: RouteNames.orders,
            pageBuilder: (context, state) => RouterUtil.getPlatFormPage(
              state: state,
              child: const TOrdersScreen(),
            ),
          ),
        ],

        ///  Global error
        errorBuilder: (context, state) => const ErrorScreen(message: 'Error Screen'),
      );
}
