import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jv_app/app/modules/become_provider/binding/become_provider_binding.dart';
import 'package:jv_app/app/modules/become_provider/views/become_provider_screen.dart';
import 'package:jv_app/app/modules/splash/bindings/splash_binding.dart';
import 'package:jv_app/app/modules/user/auth/login/binding/login_binding.dart';
import 'package:jv_app/app/modules/splash/views/splash_screen.dart';
import 'package:jv_app/app/modules/user/auth/signup/binding/signup_binding.dart';
import 'package:jv_app/app/modules/user/auth/signup/view/signup_screen.dart';
import 'package:jv_app/app/modules/user/auth/views/mobile_number.dart';
import 'package:jv_app/app/modules/user/auth/views/new_password.dart';
import 'package:jv_app/app/modules/user/auth/views/new_password_binding.dart';
import 'package:jv_app/app/modules/user/home/bindings/home_binding.dart';
import 'package:jv_app/screens/commonscreens/welcome_screen.dart';
import 'package:jv_app/screens/professional/drawerScreens/pbankdetails.dart';
import 'package:jv_app/screens/professional/drawerScreens/preferearn.dart';
import 'package:jv_app/screens/professional/drawerScreens/psubscription.dart';
import 'package:jv_app/screens/professional/pbottombar/pbookings/pfilter.dart';
import 'package:jv_app/screens/professional/pbottombar/pbookings/psearch.dart';
import 'package:jv_app/screens/professional/pbottombar.dart';
import 'package:jv_app/screens/professional/drawerScreens/peditprofile.dart';
import 'package:jv_app/screens/professional/drawerScreens/pofline.dart';
import 'package:jv_app/screens/professional/drawerScreens/pnotification.dart';
import 'package:jv_app/screens/professional/drawerScreens/prateus.dart';
import 'package:jv_app/screens/professional/pbottombar/pbookings/pviewbooking.dart';
import 'package:jv_app/screens/professional/pbottombar/pdashboard/pleaderboard.dart';
import 'package:jv_app/screens/professional/pbottombar/phome/pdelaybooking.dart';
import 'package:jv_app/screens/professional/pbottombar/phome/pmaskpicture/paddmaskpicture.dart';
import 'package:jv_app/screens/professional/pbottombar/phome/pmaskpicture/pintromask.dart';
import 'package:jv_app/screens/professional/pbottombar/phome/pwithoutmask/paddwithoutmaskpicture.dart';
import 'package:jv_app/screens/professional/pbottombar/phome/pwithoutmask/pintrowithoutmask.dart';
import 'package:jv_app/screens/professional/pwallet/pdepositmoney.dart';
import 'package:jv_app/screens/professional/pregisterscreens/padharcard.dart';
import 'package:jv_app/screens/professional/pregisterscreens/pbank.dart';
import 'package:jv_app/screens/professional/pregisterscreens/pancard.dart';
import 'package:jv_app/screens/professional/pregisterscreens/pregister.dart';
import 'package:jv_app/screens/user/account_screens_user/editprofile_user.dart';
import 'package:jv_app/screens/user/account_screens_user/help_user.dart';
import 'package:jv_app/screens/user/account_screens_user/manageaddress_user.dart';
import 'package:jv_app/screens/user/account_screens_user/referearn_user.dart';
import 'package:jv_app/screens/user/account_screens_user/supportchat_user.dart';
import 'package:jv_app/screens/user/bookings_user/bookingsuccessfully_user.dart';
import 'package:jv_app/screens/user/bookings_user/cancelbooking_user.dart';
import 'package:jv_app/screens/user/bookings_user/mybooking_user.dart';
import 'package:jv_app/screens/user/bookings_user/reschedulebooking_user.dart';
import 'package:jv_app/screens/user/bookings_user/viewbooking_user.dart';
import 'package:jv_app/screens/user/chat_user/chatscreen_user.dart';
import 'package:jv_app/app/modules/user/home/views/home_screen.dart';
import 'package:jv_app/screens/user/home_user/notification_screen.dart';
import 'package:jv_app/screens/user/home_user/services_screen.dart';
import 'package:jv_app/screens/user/home_user/store_list.dart';
import 'package:jv_app/screens/user/home_user/store_screen.dart';
import 'package:jv_app/screens/user/home_user/summary_screen.dart';
import 'package:jv_app/screens/user/location_user/locationscreen.dart';
import 'package:jv_app/app/modules/user/auth/login/views/user_login_screen.dart';
import 'package:jv_app/screens/commonscreens/onboarding_screen.dart';
import 'package:jv_app/screens/user/payment_user/paymentoption_user.dart';
import 'package:jv_app/screens/user/payment_user/paymentsuccess_user.dart';
import 'package:jv_app/screens/user/service_user/servicecompleteduser.dart';
import 'package:jv_app/screens/user/service_user/servicemapuser.dart';
import 'package:jv_app/screens/user/service_user/sharefeedbackuser.dart';
import 'package:jv_app/screens/user/service_user/viewserviceuser.dart';
import 'package:jv_app/app/modules/user/auth/views/verification_screen.dart';


class MyRouter {
  static var splashScreen = "/splashScreen";
  static var welcomeScreen = "/welcomeScreen";
  static var onBoardingScreen = "/onBoardingScreen";
  static var onMobileLoginScreen = "/onMobileLoginScreen";
  static var onVerificationScreen = "/onVerificationScreen";
  static var signupScreen = "/signupScreen";
  static var homeScreen = "/bottomNavBarHomeScreen";
  static var servicesScreen = "/servicesScreen";
  static var storeListScreen = "/storeListScreen";
  static var storeScreen = "/storeScreen";
  static var summaryScreen = "/summaryScreen";
  static var editProfileScreen = "/editProfileScreen";
  static var manageAddressScreen = "/manageAddressScreen";
  static var referEarnScreen = "/referEarnScreen";
  static var myBookingScreen = "/myBookingScreen";
  static var notificationScreen = "/notificationScreen";
  static var mobileNumberScreen = "/mobileNumberScreen";
  static var newPassword = "/newPassword";

  static var helpScreen = "/helpScreen";
  static var supportChat = "/supportChat";
  static var supportChatScreen = "/supportChatScreen";
  static var viewBooking = "/viewBooking";
  static var cancelBooking = "/cancelBooking";
  static var rescheduleBooking = "/rescheduleBooking";
  static var locationscreen = '/locationscreen';
  static var paymentOption = '/paymentOption';
  static var paymentSuccess = '/paymentSuccess';
  static var bookingSuccess = '/bookingSuccess';
  static var serviceMap = '/serviceMap';
  static var chatscreen = '/chatscreen';
  static var viewservice = '/viewservice';
  static var servicecompleted = '/servicecompleted';
  static var sharefeedback = '/sharefeedback';

  /////// professional router
  static var pRegister = '/pRegister';
  static var pBankDetails = '/pBankDetails';
  static var pAdharCard = '/pAdharCard';
  static var pPanCard = '/pPanCard';
  static var pDashboard = '/pDashboard';
  static var pSideBar = '/pSideBar';
  static var pEditProfile = '/pEditProfile';
  static var pBankDetail = '/pBankDetail';
  static var pReferEarn = '/pReferEarn';
  static var pNotification = '/pNotification';
  static var pSubscription = '/pSubscription';
  static var pOffline = '/pOffline';
  static var pRateUs = '/pRateUs';
  static var pDesposit = '/pDesposit';
  static var pViewBooking = '/pViewBooking';
  static var pSearch = '/pSearch';
  static var pFilter = '/pFilter';
  static var pDelayBooking = '/pDelayBooking';
  static var pIntroMask = '/pIntroMask';
  static var pAddmaskPicture = '/pAddmaskPicture';
  static var pIntroWithoutMask = '/pIntroWithoutMask';
  static var pAddWithoutMaskPicture = '/pAddWithoutMaskPicture';
  static var pLeadsBoard = '/pLeadsBoard';
  static String becomeProvider = '/become/provider';

  static var route = [
    GetPage(
      name: '/',
      binding: SplashBinding(),
      transition: Transition.fade,
      page: () => const SplashScreen(),
    ),
    GetPage(
        name: MyRouter.welcomeScreen,
        page: () => const WelcomeScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: MyRouter.becomeProvider,
        page: () => const BecomeProviderScreen(),
        binding: BecomeProviderBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: MyRouter.onBoardingScreen,
        page: () => const OnBoardongScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: MyRouter.onMobileLoginScreen,
        binding: LoginBinding(),
        page: () => const UserLoginScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: MyRouter.onVerificationScreen,
        page: () => const VerificationScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: MyRouter.mobileNumberScreen,
        binding: SignupBinding(),
        page: () => const MobileNumberScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: MyRouter.newPassword,
        binding: NewpassBinding(),
        page: () => NewPassword(),
        transition: Transition.fadeIn),

    GetPage(
        name: MyRouter.signupScreen,
        binding: SignupBinding(),
        page: () => const SignUpScreen(),
        transition: Transition.fadeIn),

    GetPage(
        name: MyRouter.homeScreen,
        binding: HomeBinding(),
        page: () => const HomeScreenView()),
    GetPage(name: MyRouter.servicesScreen, page: () => const ServicesScreen()),
    GetPage(
        name: MyRouter.storeListScreen, page: () => const StoreListScreen()),
    GetPage(name: MyRouter.storeScreen, page: () => const StoreScreen()),
    GetPage(name: MyRouter.summaryScreen, page: () => const SummaryScreen()),
    GetPage(
        name: MyRouter.editProfileScreen, page: () => const EditProfileuser()),
    GetPage(
        name: MyRouter.manageAddressScreen,
        page: () => const ManageAddressUser()),
    GetPage(name: MyRouter.referEarnScreen, page: () => const ReferEarnUser()),
    GetPage(name: MyRouter.myBookingScreen, page: () => const MyBookingUser()),
    GetPage(
        name: MyRouter.notificationScreen,
        page: () => const NotificationScreen()),
    GetPage(name: MyRouter.helpScreen, page: () => const HelpUser()),
    GetPage(
        name: MyRouter.supportChatScreen, page: () => const SupportChatUser()),
    GetPage(name: MyRouter.viewBooking, page: () => const ViewBookingUser()),
    GetPage(
        name: MyRouter.cancelBooking, page: () => const CancelBookingUser()),
    GetPage(
      name: MyRouter.rescheduleBooking,
      page: () => const RescheduleBookingUser(),
      curve: Curves.easeInOut,
      transitionDuration: const Duration(microseconds: 200),
    ),
    GetPage(name: MyRouter.locationscreen, page: () => const LocationScreen()),
    GetPage(
        name: MyRouter.paymentOption, page: () => const PaymentOptionUser()),
    GetPage(
        name: MyRouter.paymentSuccess,
        page: () => const PaymentSuccessUser(),
        transition: Transition.fadeIn),
    GetPage(
        name: MyRouter.bookingSuccess,
        page: () => const BookingSuccessfullyUser()),
    GetPage(name: MyRouter.serviceMap, page: () => const ServiceMapUser()),
    GetPage(name: MyRouter.chatscreen, page: () => const ChatScreenUser()),
    GetPage(name: MyRouter.viewservice, page: () => const ViewServiceUser()),
    GetPage(
        name: MyRouter.servicecompleted,
        page: () => const ServiceCompletedUser()),
    GetPage(
        name: MyRouter.sharefeedback, page: () => const ShareFeedbackUser()),

    /// professional router
    GetPage(
        name: MyRouter.pRegister,
        transition: Transition.fadeIn,
        page: () => const PRegister()),
    GetPage(
        name: MyRouter.pBankDetails,
        transition: Transition.fadeIn,
        page: () => const PBank()),
    GetPage(
        name: MyRouter.pAdharCard,
        transition: Transition.fadeIn,
        page: () => const PAdharCard()),
    GetPage(
        name: MyRouter.pPanCard,
        transition: Transition.fadeIn,
        page: () => const PanCard()),
    GetPage(
        name: MyRouter.pDashboard,
        transition: Transition.fadeIn,
        page: () => const PBottomBar()),
    GetPage(
        name: MyRouter.pEditProfile,
        transition: Transition.fadeIn,
        page: () => const PEditProfile()),
    GetPage(
        name: MyRouter.pBankDetail,
        transition: Transition.fadeIn,
        page: () => const PBankDetails()),
    GetPage(
        name: MyRouter.pReferEarn,
        transition: Transition.fadeIn,
        page: () => const PReferEarn()),
    GetPage(
        name: MyRouter.pNotification,
        transition: Transition.fadeIn,
        page: () => const PNotification()),
    GetPage(
        name: MyRouter.pSubscription,
        transition: Transition.fadeIn,
        page: () => const PSubscription()),

    // GetPage(
    //     name: MyRouter.pSideBar,
    //     page: () => DrawerBar(),
    //     transition: Transition.leftToRight,
    //     transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: MyRouter.pOffline,
        page: () => const POffline(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)),

    GetPage(
        name: MyRouter.pRateUs,
        page: () => const PRateUs(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)),

    GetPage(
        name: MyRouter.pDesposit,
        page: () => const PDepositMoney(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: MyRouter.pViewBooking,
        page: () => const PViewBooking(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: MyRouter.pSearch,
        page: () => const PSearch(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 200)),
    GetPage(
        name: MyRouter.pFilter,
        page: () => const PFilter(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 200)),
    GetPage(
      name: MyRouter.pDelayBooking,
      page: () => const PDelayBooking(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: MyRouter.pIntroMask,
      page: () => const PIntroMask(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: MyRouter.pAddmaskPicture,
      page: () => const PAddMaskPicture(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: MyRouter.pIntroWithoutMask,
      page: () => const PIntroWithoutMask(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: MyRouter.pAddWithoutMaskPicture,
      page: () => const PAddWithoutMaskPicture(),
      transition: Transition.fadeIn,
    ),

    GetPage(
      name: MyRouter.pLeadsBoard,
      page: () => const PLeaderBoard(),
      transition: Transition.fadeIn,
    ),
  ];
}
