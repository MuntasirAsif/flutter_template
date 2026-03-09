import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_vi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of S
/// returned by `S.of(context)`.
///
/// Applications need to include `S.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: S.localizationsDelegates,
///   supportedLocales: S.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the S.supportedLocales
/// property.
abstract class S {
  S(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static S? of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  static const LocalizationsDelegate<S> delegate = _SDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('vi'),
  ];

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get or;

  /// Auto extracted: Effortless home maintenance at your fingertips!
  ///
  /// In en, this message translates to:
  /// **'Effortless home maintenance at your fingertips!'**
  String get effortless_home_maintenance_at_your_fingertips;

  /// Auto extracted: Find top-rated professionals for servicing, cleaning, electrical work, and more.
  ///
  /// In en, this message translates to:
  /// **'Find top-rated professionals for servicing, cleaning, electrical work, and more.'**
  String
  get find_top_rated_professionals_for_servicing_cleaning_electrical_work;

  /// Auto extracted: Top-quality home services at the best price.
  ///
  /// In en, this message translates to:
  /// **'Top-quality home services at the best price.'**
  String get top_quality_home_services_at_the_best_price;

  /// Auto extracted: Reliable, affordable, and professional - get the best service without breaking the bank.
  ///
  /// In en, this message translates to:
  /// **'Reliable, affordable, and professional - get the best service without breaking the bank.'**
  String
  get reliable_affordable_and_professional_get_the_best_service_without_breaking_the_bank;

  /// Auto extracted: More Details
  ///
  /// In en, this message translates to:
  /// **'More Details'**
  String get more_details;

  /// Auto extracted: Rajshahi, Bangladesh
  ///
  /// In en, this message translates to:
  /// **'Rajshahi, Bangladesh'**
  String get rajshahi_bangladesh;

  /// Auto extracted: Privacy policy
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get privacy_policy;

  /// Auto extracted: What should we call you?
  ///
  /// In en, this message translates to:
  /// **'What should we call you?'**
  String get what_should_we_call_you;

  /// Auto extracted: Delete account permanently
  ///
  /// In en, this message translates to:
  /// **'Delete account permanently'**
  String get delete_account_permanently;

  /// Auto extracted: Personal details
  ///
  /// In en, this message translates to:
  /// **'Personal details'**
  String get personal_details;

  /// Auto extracted: City
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// Auto extracted: Price
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// Auto extracted: Jane Copper
  ///
  /// In en, this message translates to:
  /// **'Jane Copper'**
  String get jane_copper;

  /// Auto extracted: 4.5(20)
  ///
  /// In en, this message translates to:
  /// **'4.5(20)'**
  String get s_4_5_20;

  /// Auto extracted: Change Password
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get change_password;

  /// Auto extracted: AC Service
  ///
  /// In en, this message translates to:
  /// **'AC Service'**
  String get ac_service;

  /// Auto extracted: John cooper
  ///
  /// In en, this message translates to:
  /// **'John cooper'**
  String get john_cooper;

  /// Auto extracted: Done
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// Auto extracted: About us
  ///
  /// In en, this message translates to:
  /// **'About us'**
  String get about_us;

  /// Auto extracted: Change password
  ///
  /// In en, this message translates to:
  /// **'Change password  '**
  String get change_password_1;

  /// Auto extracted: New Password
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get new_password;

  /// Auto extracted: Enter your OTP
  ///
  /// In en, this message translates to:
  /// **'Enter your OTP'**
  String get enter_your_otp;

  /// Auto extracted: Once it’s finished, please press on Yes, it will send the payment invoice to the user.
  ///
  /// In en, this message translates to:
  /// **'Once it’s finished, please press on Yes, it will send the payment invoice to the user.'**
  String get once_it_s_finished_please_press_on_yes_it_will_sen;

  /// Auto extracted: Type a message
  ///
  /// In en, this message translates to:
  /// **'Type a message'**
  String get type_a_message;

  /// Auto extracted: Vietnamese
  ///
  /// In en, this message translates to:
  /// **'Vietnamese'**
  String get vietnamese;

  /// Auto extracted: Aircon
  ///
  /// In en, this message translates to:
  /// **'Aircon'**
  String get aircon;

  /// Auto extracted: Reason
  ///
  /// In en, this message translates to:
  /// **'Reason'**
  String get reason;

  /// Auto extracted: Cash
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get cash;

  /// Auto extracted: Stay cool and comfortable with our professional Air Conditioner Installation Service. Whether you’ve purchased a brand-new AC or are relocating an existing unit, our skilled technicians ensure safe, accurate, and efficient installation for maximum cooling performance and long-term reliability.
  ///
  /// In en, this message translates to:
  /// **'Stay cool and comfortable with our professional Air Conditioner Installation Service. Whether you’ve purchased a brand-new AC or are relocating an existing unit, our skilled technicians ensure safe, accurate, and efficient installation for maximum cooling performance and long-term reliability.'**
  String get stay_cool_and_comfortable_with_our_professional_ai;

  /// Auto extracted: Name
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// Auto extracted: Online
  ///
  /// In en, this message translates to:
  /// **'Online'**
  String get online;

  /// Auto extracted: Are you sure you want to delete?
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete?'**
  String get are_you_sure_you_want_to_delete;

  /// Auto extracted: vi
  ///
  /// In en, this message translates to:
  /// **'vi'**
  String get vi;

  /// Auto extracted: Confirm your Password
  ///
  /// In en, this message translates to:
  /// **'Confirm your Password'**
  String get confirm_your_password;

  /// Auto extracted: Verification Screen
  ///
  /// In en, this message translates to:
  /// **'Verification Screen'**
  String get verification_screen;

  /// Auto extracted: English
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// Auto extracted: Hello 👋
  ///
  /// In en, this message translates to:
  /// **'Hello 👋'**
  String get hello;

  /// Auto extracted: Work History
  ///
  /// In en, this message translates to:
  /// **'Work History'**
  String get work_history;

  /// Auto extracted: Service Categories
  ///
  /// In en, this message translates to:
  /// **'Service Categories'**
  String get service_categories;

  /// Auto extracted: Customer Feedback
  ///
  /// In en, this message translates to:
  /// **'Customer Feedback'**
  String get customer_feedback;

  /// Auto extracted: Order Id
  ///
  /// In en, this message translates to:
  /// **'Order Id'**
  String get order_id;

  /// Auto extracted: Already have an account?
  ///
  /// In en, this message translates to:
  /// **'Already have an account? '**
  String get already_have_an_account;

  /// Auto extracted: Enter your current password
  ///
  /// In en, this message translates to:
  /// **'Enter your current password'**
  String get enter_your_current_password;

  /// Auto extracted: Code expires in 59 sec
  ///
  /// In en, this message translates to:
  /// **'Code expires in 59 sec'**
  String get code_expires_in_59_sec;

  /// Auto extracted: 30 ₫
  ///
  /// In en, this message translates to:
  /// **'30 ₫'**
  String get s_30;

  /// Auto extracted: Sure! What service do you need?
  ///
  /// In en, this message translates to:
  /// **'Sure! What service do you need?'**
  String get sure_what_service_do_you_need;

  /// Auto extracted: done
  ///
  /// In en, this message translates to:
  /// **'done'**
  String get done_1;

  /// Auto extracted: pending
  ///
  /// In en, this message translates to:
  /// **'pending'**
  String get pending;

  /// Auto extracted: Address
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// Auto extracted: Email
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// Auto extracted: Outdoor unit setup with proper support
  ///
  /// In en, this message translates to:
  /// **'Outdoor unit setup with proper support'**
  String get outdoor_unit_setup_with_proper_support;

  /// Auto extracted: 10:56 AM
  ///
  /// In en, this message translates to:
  /// **'10:56 AM'**
  String get s_10_56_am;

  /// Auto extracted: Add New Address
  ///
  /// In en, this message translates to:
  /// **'Add New Address'**
  String get add_new_address;

  /// Auto extracted:  Choose a service to get started.
  ///
  /// In en, this message translates to:
  /// **' Choose a service to get started.'**
  String get choose_a_service_to_get_started;

  /// Auto extracted: Complete
  ///
  /// In en, this message translates to:
  /// **'Complete'**
  String get complete;

  /// Auto extracted: Provider Details
  ///
  /// In en, this message translates to:
  /// **'Provider Details'**
  String get provider_details;

  /// Auto extracted: AC Cleaning
  ///
  /// In en, this message translates to:
  /// **'AC Cleaning'**
  String get ac_cleaning;

  /// Auto extracted: Order Timeline
  ///
  /// In en, this message translates to:
  /// **'Order Timeline'**
  String get order_timeline;

  /// Auto extracted: Why  us?
  ///
  /// In en, this message translates to:
  /// **'Why  us?'**
  String get why_us;

  /// Auto extracted: I'm good. Need service details.
  ///
  /// In en, this message translates to:
  /// **'I\'m good. Need service details.'**
  String get i_m_good_need_service_details;

  /// Auto extracted: The cleaners were professional and efficient.
  ///
  /// In en, this message translates to:
  /// **'The cleaners were professional and efficient.'**
  String get the_cleaners_were_professional_and_efficient;

  /// Auto extracted: 775 Rolling Green Rd., San Francisco, CA 94109, USA
  ///
  /// In en, this message translates to:
  /// **'775 Rolling Green Rd., San Francisco, CA 94109, USA'**
  String get s_775_rolling_green_rd_san_francisco_ca_94109_usa;

  /// Auto extracted: We’ve sent a verification code to your email a*@gmail.com. Please enter it below.
  ///
  /// In en, this message translates to:
  /// **'We’ve sent a verification code to your email a*@gmail.com. Please enter it below.'**
  String get we_ve_sent_a_verification_code_to_your_email_a_gma;

  /// Auto extracted: Order In Progress
  ///
  /// In en, this message translates to:
  /// **'Order In Progress'**
  String get order_in_progress;

  /// Auto extracted: Invoice
  ///
  /// In en, this message translates to:
  /// **'Invoice'**
  String get invoice;

  /// Auto extracted: MMM yyyy
  ///
  /// In en, this message translates to:
  /// **'MMM yyyy'**
  String get mmm_yyyy;

  /// Auto extracted: Stay cool and comfortable with our professional Air Conditioner Installation Service. Whether you’ve purchased a brand-new AC or are relocating an existing unit
  ///
  /// In en, this message translates to:
  /// **'Stay cool and comfortable with our professional Air Conditioner Installation Service. Whether you’ve purchased a brand-new AC or are relocating an existing unit'**
  String get stay_cool_and_comfortable_with_our_professional_ai_1;

  /// Auto extracted: Personal Details
  ///
  /// In en, this message translates to:
  /// **'Personal Details'**
  String get personal_details_1;

  /// Auto extracted: Total
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// Auto extracted: Enter reason
  ///
  /// In en, this message translates to:
  /// **'Enter reason'**
  String get enter_reason;

  /// Auto extracted:  More Details
  ///
  /// In en, this message translates to:
  /// **' More Details'**
  String get more_details_1;

  /// Auto extracted: Mechanic
  ///
  /// In en, this message translates to:
  /// **'Mechanic'**
  String get mechanic;

  /// Auto extracted: ₫150
  ///
  /// In en, this message translates to:
  /// **'₫150'**
  String get s_150;

  /// Auto extracted: Cancel
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Auto extracted: Thousands
  ///
  /// In en, this message translates to:
  /// **'Thousands'**
  String get thousands;

  /// Auto extracted: My Addresses
  ///
  /// In en, this message translates to:
  /// **'My Addresses'**
  String get my_addresses;

  /// Auto extracted: Confirm Booking
  ///
  /// In en, this message translates to:
  /// **'Confirm Booking'**
  String get confirm_booking;

  /// Auto extracted: 2:30 PM
  ///
  /// In en, this message translates to:
  /// **'2:30 PM'**
  String get s_2_30_pm;

  /// Auto extracted: Book Now
  ///
  /// In en, this message translates to:
  /// **'Book Now'**
  String get book_now;

  /// Auto extracted: /message
  ///
  /// In en, this message translates to:
  /// **'/message'**
  String get message;

  /// Auto extracted: Service charges may vary depending on site condition and additional work requirements.
  ///
  /// In en, this message translates to:
  /// **'Service charges may vary depending on site condition and additional work requirements.'**
  String get service_charges_may_vary_depending_on_site_conditi;

  /// Auto extracted: Ensure TextStyleExtension is added to ThemeData.extensions in src/theme_data.dart.
  ///
  /// In en, this message translates to:
  /// **'Ensure TextStyleExtension is added to ThemeData.extensions in src/theme_data.dart.'**
  String get ensure_textstyleextension_is_added_to_themedata_ex;

  /// Auto extracted: Enter your password
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get enter_your_password;

  /// Auto extracted: ₫80
  ///
  /// In en, this message translates to:
  /// **'₫80'**
  String get s_80;

  /// Auto extracted: Add a service note
  ///
  /// In en, this message translates to:
  /// **'Add a service note'**
  String get add_a_service_note;

  /// Auto extracted: Edit
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// Auto extracted: Loading role...
  ///
  /// In en, this message translates to:
  /// **'Loading role...'**
  String get loading_role;

  /// Auto extracted: Dhaka, Bangladesh
  ///
  /// In en, this message translates to:
  /// **'Dhaka, Bangladesh'**
  String get dhaka_bangladesh;

  /// Auto extracted: Enter your email
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get enter_your_email;

  /// Auto extracted: This app made booking a cleaning service so easy!
  ///
  /// In en, this message translates to:
  /// **'This app made booking a cleaning service so easy! '**
  String get this_app_made_booking_a_cleaning_service_so_easy;

  /// Auto extracted: Hassan Ali
  ///
  /// In en, this message translates to:
  /// **'Hassan Ali'**
  String get hassan_ali;

  /// Auto extracted: /booking
  ///
  /// In en, this message translates to:
  /// **'/booking'**
  String get booking;

  /// Auto extracted: Enter your email address
  ///
  /// In en, this message translates to:
  /// **'Enter your email address'**
  String get enter_your_email_address;

  /// Auto extracted: Sign Up
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get sign_up;

  /// Auto extracted: Provider
  ///
  /// In en, this message translates to:
  /// **'Provider'**
  String get provider;

  /// Auto extracted: Quantity: 2
  ///
  /// In en, this message translates to:
  /// **'Quantity: 2'**
  String get quantity_2;

  /// Auto extracted: Date and Time
  ///
  /// In en, this message translates to:
  /// **'Date and Time'**
  String get date_and_time;

  /// Auto extracted: Forgot your password? We’ll help you reset it.
  ///
  /// In en, this message translates to:
  /// **'Forgot your password? We’ll help you reset it.'**
  String get forgot_your_password_we_ll_help_you_reset_it;

  /// Auto extracted: Search
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// Auto extracted: Congratulations!
  ///
  /// In en, this message translates to:
  /// **'Congratulations!'**
  String get congratulations;

  /// Auto extracted: Order Completed
  ///
  /// In en, this message translates to:
  /// **'Order Completed'**
  String get order_completed;

  /// Auto extracted: Are you sure you want to logout?
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout?'**
  String get are_you_sure_you_want_to_logout;

  /// Auto extracted: Booking Status
  ///
  /// In en, this message translates to:
  /// **'Booking Status'**
  String get booking_status;

  /// Auto extracted: Select Address
  ///
  /// In en, this message translates to:
  /// **'Select Address'**
  String get select_address;

  /// Auto extracted: ₫500/hr
  ///
  /// In en, this message translates to:
  /// **'₫500/hr'**
  String get s_500_hr;

  /// Auto extracted: Booking History
  ///
  /// In en, this message translates to:
  /// **'Booking History'**
  String get booking_history;

  /// Auto extracted: agree with terms & condition
  ///
  /// In en, this message translates to:
  /// **'agree with terms & condition'**
  String get agree_with_terms_condition;

  /// Auto extracted: Popular Services
  ///
  /// In en, this message translates to:
  /// **'Popular Services'**
  String get popular_services;

  /// Auto extracted: Pending
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pending_1;

  /// Auto extracted: Next
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// Auto extracted: Confirm Password
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirm_password;

  /// Auto extracted: Search for services
  ///
  /// In en, this message translates to:
  /// **'Search for services'**
  String get search_for_services;

  /// Auto extracted: Ensure Dimensions is added to ThemeData.extensions in src/theme_data.dart.
  ///
  /// In en, this message translates to:
  /// **'Ensure Dimensions is added to ThemeData.extensions in src/theme_data.dart.'**
  String get ensure_dimensions_is_added_to_themedata_extensions;

  /// Auto extracted: Yes, Cancel
  ///
  /// In en, this message translates to:
  /// **'Yes, Cancel'**
  String get yes_cancel;

  /// Auto extracted: ₫130
  ///
  /// In en, this message translates to:
  /// **'₫130'**
  String get s_130;

  /// Auto extracted: Confirm your new password
  ///
  /// In en, this message translates to:
  /// **'Confirm your new password'**
  String get confirm_your_new_password;

  /// Auto extracted: Payment Confirmed
  ///
  /// In en, this message translates to:
  /// **'Payment Confirmed'**
  String get payment_confirmed;

  /// Auto extracted: What’s Included in Our AC Installation Service
  ///
  /// In en, this message translates to:
  /// **'What’s Included in Our AC Installation Service'**
  String get what_s_included_in_our_ac_installation_service;

  /// Auto extracted: Chattogram, Bangladesh
  ///
  /// In en, this message translates to:
  /// **'Chattogram, Bangladesh'**
  String get chattogram_bangladesh;

  /// Auto extracted: /splash
  ///
  /// In en, this message translates to:
  /// **'/splash'**
  String get splash;

  /// Auto extracted: 10:57 AM
  ///
  /// In en, this message translates to:
  /// **'10:57 AM'**
  String get s_10_57_am;

  /// Auto extracted: Stay cool and comfortable with our professional Air Conditioner Installation Service. Whether you’ve purchased a brand-new AC or are relocating an existing unit, we’ll install it safely and efficiently. Trust us to provide you with the best Air Conditioner Installation Service in the area, so you can enjoy a cool and comfortable home all year long.
  ///
  /// In en, this message translates to:
  /// **'Stay cool and comfortable with our professional Air Conditioner Installation Service. Whether you’ve purchased a brand-new AC or are relocating an existing unit, we’ll install it safely and efficiently. Trust us to provide you with the best Air Conditioner Installation Service in the area, so you can enjoy a cool and comfortable home all year long.'**
  String get stay_cool_and_comfortable_with_our_professional_ai_1_2;

  /// Auto extracted: Sign in
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get sign_in;

  /// Auto extracted: Enter your new password
  ///
  /// In en, this message translates to:
  /// **'Enter your new password'**
  String get enter_your_new_password;

  /// Auto extracted: Categories
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// Auto extracted: Payment Method
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get payment_method;

  /// Auto extracted: AC Installation
  ///
  /// In en, this message translates to:
  /// **'AC Installation'**
  String get ac_installation;

  /// Auto extracted: Type here
  ///
  /// In en, this message translates to:
  /// **'Type here'**
  String get type_here;

  /// Auto extracted: Accept
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get accept;

  /// Auto extracted: Time:
  ///
  /// In en, this message translates to:
  /// **'Time: '**
  String get time;

  /// Auto extracted: Toufik Hasan
  ///
  /// In en, this message translates to:
  /// **'Toufik Hasan'**
  String get toufik_hasan;

  /// Auto extracted: Old Password
  ///
  /// In en, this message translates to:
  /// **'Old Password'**
  String get old_password;

  /// Auto extracted: AC Repair
  ///
  /// In en, this message translates to:
  /// **'AC Repair'**
  String get ac_repair;

  /// Auto extracted: Enter your phone number
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number'**
  String get enter_your_phone_number;

  /// Auto extracted: canceled
  ///
  /// In en, this message translates to:
  /// **'canceled'**
  String get canceled;

  /// Auto extracted: 10:00 AM
  ///
  /// In en, this message translates to:
  /// **'10:00 AM'**
  String get s_10_00_am;

  /// Auto extracted: Enter address name
  ///
  /// In en, this message translates to:
  /// **'Enter address name'**
  String get enter_address_name;

  /// Auto extracted:  #123456
  ///
  /// In en, this message translates to:
  /// **' #123456'**
  String get s_123456;

  /// Auto extracted: Note
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get note;

  /// Auto extracted: ₫50
  ///
  /// In en, this message translates to:
  /// **'₫50'**
  String get s_50;

  /// Auto extracted: Booking date
  ///
  /// In en, this message translates to:
  /// **'Booking date'**
  String get booking_date;

  /// No description provided for @booking_date_label.
  ///
  /// In en, this message translates to:
  /// **'Booking date: {date}'**
  String booking_date_label(String date);

  /// No description provided for @service_date_label.
  ///
  /// In en, this message translates to:
  /// **'Service date: {date}'**
  String service_date_label(String date);

  /// Auto extracted: Language
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// Auto extracted: Enter your name
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get enter_your_name;

  /// Auto extracted: Toufik Hasan Home
  ///
  /// In en, this message translates to:
  /// **'Toufik Hasan Home'**
  String get toufik_hasan_home;

  /// Auto extracted: User
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get user;

  /// Auto extracted: Additional Note
  ///
  /// In en, this message translates to:
  /// **'Additional Note'**
  String get additional_note;

  /// Auto extracted: 123 Nguyen Trai Street, Ward 7, District 5, Ho Chi Minh
  ///
  /// In en, this message translates to:
  /// **'123 Nguyen Trai Street, Ward 7, District 5, Ho Chi Minh'**
  String get s_123_nguyen_trai_street_ward_7_district_5_ho_chi;

  /// Auto extracted: Enter address
  ///
  /// In en, this message translates to:
  /// **'Enter address'**
  String get enter_address;

  /// Auto extracted: Logout
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// Auto extracted: Yes, Send Invoice
  ///
  /// In en, this message translates to:
  /// **'Yes, Send Invoice'**
  String get yes_send_invoice;

  /// Auto extracted: AC Maintenance
  ///
  /// In en, this message translates to:
  /// **'AC Maintenance'**
  String get ac_maintenance;

  /// Auto extracted: Reset Password
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get reset_password;

  /// Auto extracted: 10:58 AM
  ///
  /// In en, this message translates to:
  /// **'10:58 AM'**
  String get s_10_58_am;

  /// Auto extracted: Hi, Hassan Ali
  ///
  /// In en, this message translates to:
  /// **'Hi, Hassan Ali'**
  String get hi_hassan_ali;

  /// Auto extracted: Hanoi City, Vietnam
  ///
  /// In en, this message translates to:
  /// **'Hanoi City, Vietnam'**
  String get hanoi_city_vietnam;

  /// Auto extracted: May 20, 2023
  ///
  /// In en, this message translates to:
  /// **'May 20, 2023'**
  String get may_20_2023;

  /// Auto extracted: Completed
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// Auto extracted: hh:mm a
  ///
  /// In en, this message translates to:
  /// **'hh:mm a'**
  String get hh_mm_a;

  /// Auto extracted: Terms and Conditions
  ///
  /// In en, this message translates to:
  /// **'Terms and Conditions'**
  String get terms_and_conditions;

  /// Auto extracted: Messages
  ///
  /// In en, this message translates to:
  /// **'Messages'**
  String get messages;

  /// Auto extracted: My addresses
  ///
  /// In en, this message translates to:
  /// **'My addresses'**
  String get my_addresses_1;

  /// Auto extracted: Order id #123456
  ///
  /// In en, this message translates to:
  /// **'Order id #123456'**
  String get order_id_123456;

  /// Auto extracted: Goto Home
  ///
  /// In en, this message translates to:
  /// **'Goto Home'**
  String get goto_home;

  /// Auto extracted: Log in
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get log_in;

  /// Auto extracted: Service Proposal
  ///
  /// In en, this message translates to:
  /// **'Service Proposal'**
  String get service_proposal;

  /// Auto extracted: Password
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// Auto extracted: ₫100,000
  ///
  /// In en, this message translates to:
  /// **'₫100,000'**
  String get s_100_000;

  /// Auto extracted: Enter a new password to regain access to your account.
  ///
  /// In en, this message translates to:
  /// **'Enter a new password to regain access to your account.'**
  String get enter_a_new_password_to_regain_access_to_your_acco;

  /// Auto extracted: Jane Cooper
  ///
  /// In en, this message translates to:
  /// **'Jane Cooper'**
  String get jane_cooper;

  /// Auto extracted: Select Date
  ///
  /// In en, this message translates to:
  /// **'Select Date'**
  String get select_date;

  /// Auto extracted: dd MMM
  ///
  /// In en, this message translates to:
  /// **'dd MMM'**
  String get dd_mmm;

  /// Auto extracted: Save
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// Auto extracted: Log out
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get log_out;

  /// Auto extracted: Are you sure the work is fully completed?
  ///
  /// In en, this message translates to:
  /// **'Are you sure the work is fully completed? '**
  String get are_you_sure_the_work_is_fully_completed;

  /// Auto extracted: Submit
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// Auto extracted: Enter City
  ///
  /// In en, this message translates to:
  /// **'Enter City'**
  String get enter_city;

  /// Auto extracted: Forgot Password
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get forgot_password;

  /// Auto extracted: Time
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get time_1;

  /// Auto extracted: Ensure ColorExtension is added to ThemeData.extensions in src/theme_data.dart.
  ///
  /// In en, this message translates to:
  /// **'Ensure ColorExtension is added to ThemeData.extensions in src/theme_data.dart.'**
  String get ensure_colorextension_is_added_to_themedata_extens;

  /// Auto extracted: Select Time
  ///
  /// In en, this message translates to:
  /// **'Select Time'**
  String get select_time;

  /// Auto extracted: In Review
  ///
  /// In en, this message translates to:
  /// **'In Review'**
  String get in_review;

  /// Auto extracted: Hi! How are you?
  ///
  /// In en, this message translates to:
  /// **'Hi! How are you?'**
  String get hi_how_are_you;

  /// Auto extracted: 10:55 AM
  ///
  /// In en, this message translates to:
  /// **'10:55 AM'**
  String get s_10_55_am;

  /// Auto extracted: dd MMM yyyy
  ///
  /// In en, this message translates to:
  /// **'dd MMM yyyy'**
  String get dd_mmm_yyyy;

  /// Auto extracted: 4.5(10)
  ///
  /// In en, this message translates to:
  /// **'4.5(10)'**
  String get s_4_5_10;

  /// Auto extracted: Select Language
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get select_language;

  /// Auto extracted: Selected Service
  ///
  /// In en, this message translates to:
  /// **'Selected Service'**
  String get selected_service;

  /// Auto extracted: Card
  ///
  /// In en, this message translates to:
  /// **'Card'**
  String get card;

  /// Auto extracted: Create your account. It's quick and easy.
  ///
  /// In en, this message translates to:
  /// **'Create your account. It\'s quick and easy.'**
  String get create_your_account_it_s_quick_and_easy;

  /// Auto extracted: Change
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get change;

  /// Auto extracted: Khulna, Bangladesh
  ///
  /// In en, this message translates to:
  /// **'Khulna, Bangladesh'**
  String get khulna_bangladesh;

  /// Auto extracted: Delete
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// Auto extracted: dd MMM yyyy, hh:mm a
  ///
  /// In en, this message translates to:
  /// **'dd MMM yyyy, hh:mm a'**
  String get dd_mmm_yyyy_hh_mm_a;

  /// Auto extracted: See All
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get see_all;

  /// Auto extracted: + Add Service
  ///
  /// In en, this message translates to:
  /// **'+ Add Service'**
  String get add_service;

  /// Auto extracted: Service Details
  ///
  /// In en, this message translates to:
  /// **'Service Details'**
  String get service_details;

  /// Auto extracted: Date
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// Auto extracted: /login
  ///
  /// In en, this message translates to:
  /// **'/login'**
  String get login;

  /// Auto extracted: Booking Details
  ///
  /// In en, this message translates to:
  /// **'Booking Details'**
  String get booking_details;

  /// Auto extracted: 4.5
  ///
  /// In en, this message translates to:
  /// **'4.5'**
  String get s_4_5;

  /// Auto extracted: No
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// Auto extracted: AC Gas Refill
  ///
  /// In en, this message translates to:
  /// **'AC Gas Refill'**
  String get ac_gas_refill;

  /// Auto extracted: Order Placed
  ///
  /// In en, this message translates to:
  /// **'Order Placed'**
  String get order_placed;

  /// Auto extracted: All
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// Auto extracted: Are you sure want to cancel this order?
  ///
  /// In en, this message translates to:
  /// **'Are you sure want to cancel this order?'**
  String get are_you_sure_want_to_cancel_this_order;

  /// Auto extracted: /invoice
  ///
  /// In en, this message translates to:
  /// **'/invoice'**
  String get invoice_1;

  /// Auto extracted: Booking Request
  ///
  /// In en, this message translates to:
  /// **'Booking Request'**
  String get booking_request;

  /// Auto extracted: Cancellation Policy
  ///
  /// In en, this message translates to:
  /// **'Cancellation Policy'**
  String get cancellation_policy;

  /// Auto extracted: Phone Number
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phone_number;

  /// Auto extracted: Selected: $value
  ///
  /// In en, this message translates to:
  /// **'Selected: \$value'**
  String get selected_value;

  /// Auto extracted: No, Don’t Delete
  ///
  /// In en, this message translates to:
  /// **'No, Don’t Delete'**
  String get no_don_t_delete;

  /// Auto extracted: Your order has been completed successfully!
  ///
  /// In en, this message translates to:
  /// **'Your order has been completed successfully!'**
  String get your_order_has_been_completed_successfully;

  /// Auto extracted: Service Provider
  ///
  /// In en, this message translates to:
  /// **'Service Provider'**
  String get service_provider;

  /// Auto extracted: Indoor unit mounting and positioning
  ///
  /// In en, this message translates to:
  /// **'Indoor unit mounting and positioning'**
  String get indoor_unit_mounting_and_positioning;

  /// Auto extracted: ₫30
  ///
  /// In en, this message translates to:
  /// **'₫30'**
  String get s_30_1;

  /// Auto extracted: ₫50/hr
  ///
  /// In en, this message translates to:
  /// **'₫50/hr'**
  String get s_50_hr;

  /// Auto extracted: Payments and refunds
  ///
  /// In en, this message translates to:
  /// **'Payments and refunds'**
  String get payments_and_refunds;

  /// Auto extracted: Cancelled
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get cancelled;

  /// Auto extracted: Date:
  ///
  /// In en, this message translates to:
  /// **'Date: '**
  String get date_1;

  /// Auto extracted: Remember me
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get remember_me;

  /// Auto extracted: Sign in with Google
  ///
  /// In en, this message translates to:
  /// **'Sign in with Google'**
  String get sign_in_with_google;

  /// Auto extracted: Don't have an account?
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get don_t_have_an_account;

  /// Auto extracted: Skip
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// Auto extracted: Log in to your account
  ///
  /// In en, this message translates to:
  /// **'Log in to your account'**
  String get log_in_to_your_account;

  /// Auto extracted: Reviews
  ///
  /// In en, this message translates to:
  /// **'Reviews'**
  String get reviews;

  /// Auto extracted: Quick and efficient. Handled the complicated wiring with ease. Very knowledgeable technician.
  ///
  /// In en, this message translates to:
  /// **'Quick and efficient. Handled the complicated wiring with ease. Very knowledgeable technician.'**
  String get quick_and_efficient_handled_the_complicated_wiring;

  /// Auto extracted: Cleaning
  ///
  /// In en, this message translates to:
  /// **'Cleaning'**
  String get cleaning;

  /// Auto extracted: Your facial data is stored securely on your device.We do not save or access your biometric information.
  ///
  /// In en, this message translates to:
  /// **'Your facial data is stored securely on your device.We do not save or access your biometric information.'**
  String get your_facial_data_is_stored_securely_on_your_device;

  /// Auto extracted: Your privacy is important to us. It is our policy to respect your privacy regarding any information we may collect from you through our app.
  ///
  /// In en, this message translates to:
  /// **'Your privacy is important to us. It is our policy to respect your privacy regarding any information we may collect from you through our app.'**
  String get your_privacy_is_important_to_us_it_is_our_policy_t;

  /// Auto extracted: The best service I've had in a long time. They even cleaned up after the work was done!
  ///
  /// In en, this message translates to:
  /// **'The best service I\'ve had in a long time. They even cleaned up after the work was done!'**
  String get the_best_service_i_ve_had_in_a_long_time_they_even;

  /// Auto extracted: Today's Earnings
  ///
  /// In en, this message translates to:
  /// **'Today\'s Earnings'**
  String get today_s_earnings;

  /// Auto extracted: Face ID
  ///
  /// In en, this message translates to:
  /// **'Face ID'**
  String get face_id;

  /// Auto extracted: approved
  ///
  /// In en, this message translates to:
  /// **'approved'**
  String get approved;

  /// Auto extracted: 1 week ago
  ///
  /// In en, this message translates to:
  /// **'1 week ago'**
  String get s_1_week_ago;

  /// Auto extracted: Active on this device
  ///
  /// In en, this message translates to:
  /// **'Active on this device'**
  String get active_on_this_device;

  /// Auto extracted: Plumbing
  ///
  /// In en, this message translates to:
  /// **'Plumbing'**
  String get plumbing;

  /// Auto extracted: Ductless Mini Split AC
  ///
  /// In en, this message translates to:
  /// **'Ductless Mini Split AC'**
  String get ductless_mini_split_ac;

  /// Auto extracted: 2. Use of Information
  ///
  /// In en, this message translates to:
  /// **'2. Use of Information'**
  String get s_2_use_of_information;

  /// Auto extracted: Enter your description
  ///
  /// In en, this message translates to:
  /// **'Enter your description'**
  String get enter_your_description;

  /// Auto extracted: Use facial recognition for faster and secure access.
  ///
  /// In en, this message translates to:
  /// **'Use facial recognition for faster and secure access.'**
  String get use_facial_recognition_for_faster_and_secure_acces;

  /// Auto extracted: Privacy Policy
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacy_policy_1;

  /// Auto extracted: We reserve the right, at our sole discretion, to modify or replace these Terms at any time.
  ///
  /// In en, this message translates to:
  /// **'We reserve the right, at our sole discretion, to modify or replace these Terms at any time.'**
  String get we_reserve_the_right_at_our_sole_discretion_to_mod;

  /// Auto extracted: Customer satisfaction is at the heart of everything we do. From on-time service to transparent pricing and professional support, we strive to deliver a smooth and stress-free experience every time you book with us.
  ///
  /// In en, this message translates to:
  /// **'Customer satisfaction is at the heart of everything we do. From on-time service to transparent pricing and professional support, we strive to deliver a smooth and stress-free experience every time you book with us.'**
  String get customer_satisfaction_is_at_the_heart_of_everythin;

  /// Auto extracted: 1000
  ///
  /// In en, this message translates to:
  /// **'1000'**
  String get s_1000;

  /// Auto extracted: Aircon Services
  ///
  /// In en, this message translates to:
  /// **'Aircon Services'**
  String get aircon_services;

  /// Auto extracted: We only ask for personal information when we truly need it to provide a service to you. We collect it by fair and lawful means, with your knowledge and consent.
  ///
  /// In en, this message translates to:
  /// **'We only ask for personal information when we truly need it to provide a service to you. We collect it by fair and lawful means, with your knowledge and consent.'**
  String get we_only_ask_for_personal_information_when_we_truly;

  /// Auto extracted: Earning
  ///
  /// In en, this message translates to:
  /// **'Earning'**
  String get earning;

  /// Auto extracted: We are a trusted home service company dedicated to providing reliable, affordable, and high-quality air conditioning solutions. With a team of skilled and experienced technicians, we specialize in AC installation, repair, cleaning, and maintenance for homes and businesses.
  ///
  /// In en, this message translates to:
  /// **'We are a trusted home service company dedicated to providing reliable, affordable, and high-quality air conditioning solutions. With a team of skilled and experienced technicians, we specialize in AC installation, repair, cleaning, and maintenance for homes and businesses.'**
  String get we_are_a_trusted_home_service_company_dedicated_to;

  /// Auto extracted: Reliable, Affordable, and Professional – Get the Best Service Without Breaking the Bank!
  ///
  /// In en, this message translates to:
  /// **'Reliable, Affordable, and Professional – Get the Best Service Without Breaking the Bank!'**
  String get reliable_affordable_and_professional_get_the_best;

  /// Auto extracted: Create Account
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get create_account;

  /// Auto extracted: Location
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// Auto extracted: VAT Number
  ///
  /// In en, this message translates to:
  /// **'VAT Number'**
  String get vat_number;

  /// Auto extracted: 3. Modifications
  ///
  /// In en, this message translates to:
  /// **'3. Modifications'**
  String get s_3_modifications;

  /// Auto extracted: Enter your Email
  ///
  /// In en, this message translates to:
  /// **'Enter your Email'**
  String get enter_your_email_1;

  /// Auto extracted: Enter your year of experience
  ///
  /// In en, this message translates to:
  /// **'Enter your year of experience'**
  String get enter_your_year_of_experience;

  /// Auto extracted: Enter your Phone Number
  ///
  /// In en, this message translates to:
  /// **'Enter your Phone Number'**
  String get enter_your_phone_number_1;

  /// Auto extracted: Verify Again
  ///
  /// In en, this message translates to:
  /// **'Verify Again'**
  String get verify_again;

  /// Auto extracted: Review submitted successfully
  ///
  /// In en, this message translates to:
  /// **'Review submitted successfully'**
  String get review_submitted_successfully;

  /// Auto extracted: Initialize this in main
  ///
  /// In en, this message translates to:
  /// **'Initialize this in main'**
  String get initialize_this_in_main;

  /// Auto extracted: 1 hour ago
  ///
  /// In en, this message translates to:
  /// **'1 hour ago'**
  String get s_1_hour_ago;

  /// Auto extracted: Enter your email address or phone number
  ///
  /// In en, this message translates to:
  /// **'Enter your email address or phone number'**
  String get enter_your_email_address_or_phone_number;

  /// Auto extracted: Window AC
  ///
  /// In en, this message translates to:
  /// **'Window AC'**
  String get window_ac;

  /// Auto extracted: Enter your email or phone number
  ///
  /// In en, this message translates to:
  /// **'Enter your email or phone number'**
  String get enter_your_email_or_phone_number;

  /// Auto extracted: You agree to use the app responsibly and not for any illegal or unauthorized purpose.
  ///
  /// In en, this message translates to:
  /// **'You agree to use the app responsibly and not for any illegal or unauthorized purpose.'**
  String get you_agree_to_use_the_app_responsibly_and_not_for_a;

  /// Auto extracted: Order id #$orderId
  ///
  /// In en, this message translates to:
  /// **'Order id #\$orderId'**
  String get order_id_orderid;

  /// Auto extracted: Service Completed
  ///
  /// In en, this message translates to:
  /// **'Service Completed'**
  String get service_completed;

  /// Auto extracted: Enter your bank branch
  ///
  /// In en, this message translates to:
  /// **'Enter your bank branch'**
  String get enter_your_bank_branch;

  /// Auto extracted: 4.8
  ///
  /// In en, this message translates to:
  /// **'4.8'**
  String get s_4_8;

  /// Auto extracted: Charlie Puth
  ///
  /// In en, this message translates to:
  /// **'Charlie Puth'**
  String get charlie_puth;

  /// Auto extracted: Company Name
  ///
  /// In en, this message translates to:
  /// **'Company Name'**
  String get company_name;

  /// Auto extracted: Bearer $accessToken
  ///
  /// In en, this message translates to:
  /// **'Bearer \$accessToken'**
  String get bearer_accesstoken;

  /// Auto extracted: Refund Request
  ///
  /// In en, this message translates to:
  /// **'Refund Request'**
  String get refund_request;

  /// Auto extracted: Electrician
  ///
  /// In en, this message translates to:
  /// **'Electrician'**
  String get electrician;

  /// Auto extracted: en
  ///
  /// In en, this message translates to:
  /// **'en'**
  String get en;

  /// Auto extracted: No refresh token available
  ///
  /// In en, this message translates to:
  /// **'No refresh token available'**
  String get no_refresh_token_available;

  /// Auto extracted: You have not received the email?
  ///
  /// In en, this message translates to:
  /// **'You have not received the email?'**
  String get you_have_not_received_the_email;

  /// Auto extracted: Add Review
  ///
  /// In en, this message translates to:
  /// **'Add Review'**
  String get add_review;

  /// Auto extracted: Your payment for the invoice #12345 was successful.
  ///
  /// In en, this message translates to:
  /// **'Your payment for the invoice #12345 was successful.'**
  String get your_payment_for_the_invoice_12345_was_successful;

  /// Auto extracted: Add
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// Auto extracted: Based on 124 reviews
  ///
  /// In en, this message translates to:
  /// **'Based on 124 reviews'**
  String get based_on_124_reviews;

  /// Auto extracted: Select
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get select;

  /// Auto extracted: image
  ///
  /// In en, this message translates to:
  /// **'image'**
  String get image;

  /// Auto extracted: Reconfirm your identity to continue using Face ID.
  ///
  /// In en, this message translates to:
  /// **'Reconfirm your identity to continue using Face ID.'**
  String get reconfirm_your_identity_to_continue_using_face_id;

  /// Auto extracted: We only retain collected information for as long as necessary to provide you with your requested service.
  ///
  /// In en, this message translates to:
  /// **'We only retain collected information for as long as necessary to provide you with your requested service.'**
  String get we_only_retain_collected_information_for_as_long_a;

  /// Auto extracted: Sub Service
  ///
  /// In en, this message translates to:
  /// **'Sub Service'**
  String get sub_service;

  /// Auto extracted: Total Earnings
  ///
  /// In en, this message translates to:
  /// **'Total Earnings'**
  String get total_earnings;

  /// Auto extracted: 3. Data Protection
  ///
  /// In en, this message translates to:
  /// **'3. Data Protection'**
  String get s_3_data_protection;

  /// Auto extracted: 1 month ago
  ///
  /// In en, this message translates to:
  /// **'1 month ago'**
  String get s_1_month_ago;

  /// Auto extracted: Terms & Conditions
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions'**
  String get terms_conditions;

  /// Auto extracted: 123456
  ///
  /// In en, this message translates to:
  /// **'123456'**
  String get s_123456_1;

  /// Auto extracted: Bob Marley
  ///
  /// In en, this message translates to:
  /// **'Bob Marley'**
  String get bob_marley;

  /// Auto extracted: Refund request submitted
  ///
  /// In en, this message translates to:
  /// **'Refund request submitted'**
  String get refund_request_submitted;

  /// Auto extracted: Select Name
  ///
  /// In en, this message translates to:
  /// **'Select Name'**
  String get select_name;

  /// Auto extracted: Bank Branch
  ///
  /// In en, this message translates to:
  /// **'Bank Branch'**
  String get bank_branch;

  /// Auto extracted: Upload Picture
  ///
  /// In en, this message translates to:
  /// **'Upload Picture'**
  String get upload_picture;

  /// Auto extracted: Service 1
  ///
  /// In en, this message translates to:
  /// **'Service 1'**
  String get service_1;

  /// Auto extracted: Cassette AC
  ///
  /// In en, this message translates to:
  /// **'Cassette AC'**
  String get cassette_ac;

  /// Auto extracted: Select Service
  ///
  /// In en, this message translates to:
  /// **'Select Service'**
  String get select_service;

  /// Auto extracted: retry
  ///
  /// In en, this message translates to:
  /// **'retry'**
  String get retry;

  /// Auto extracted: Geothermal AC
  ///
  /// In en, this message translates to:
  /// **'Geothermal AC'**
  String get geothermal_ac;

  /// Auto extracted: Inverter AC
  ///
  /// In en, this message translates to:
  /// **'Inverter AC'**
  String get inverter_ac;

  /// Auto extracted: Camera
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get camera;

  /// Auto extracted: Refresh token request failed with status:
  ///
  /// In en, this message translates to:
  /// **'Refresh token request failed with status: '**
  String get refresh_token_request_failed_with_status;

  /// Auto extracted: Very satisfied with the AC repair. It's working like new now. Thank you!
  ///
  /// In en, this message translates to:
  /// **'Very satisfied with the AC repair. It\'s working like new now. Thank you!'**
  String get very_satisfied_with_the_ac_repair_it_s_working_lik;

  /// Auto extracted: ₫50,000
  ///
  /// In en, this message translates to:
  /// **'₫50,000'**
  String get s_50_000;

  /// Auto extracted: Enter your bank name
  ///
  /// In en, this message translates to:
  /// **'Enter your bank name'**
  String get enter_your_bank_name;

  /// Auto extracted: New Message
  ///
  /// In en, this message translates to:
  /// **'New Message'**
  String get new_message;

  /// Auto extracted: Add Service
  ///
  /// In en, this message translates to:
  /// **'Add Service'**
  String get add_service_1;

  /// Auto extracted: Smart AC
  ///
  /// In en, this message translates to:
  /// **'Smart AC'**
  String get smart_ac;

  /// Auto extracted: Enter your experience here...
  ///
  /// In en, this message translates to:
  /// **'Enter your experience here...'**
  String get enter_your_experience_here;

  /// Auto extracted: Booking Confirmed
  ///
  /// In en, this message translates to:
  /// **'Booking Confirmed'**
  String get booking_confirmed;

  /// Auto extracted: time
  ///
  /// In en, this message translates to:
  /// **'time'**
  String get time_2;

  /// Auto extracted: cancel
  ///
  /// In en, this message translates to:
  /// **'cancel'**
  String get cancel_1;

  /// Auto extracted: Face ID Status
  ///
  /// In en, this message translates to:
  /// **'Face ID Status'**
  String get face_id_status;

  /// Auto extracted: 2 days ago
  ///
  /// In en, this message translates to:
  /// **'2 days ago'**
  String get s_2_days_ago;

  /// Auto extracted: 2. User Obligations
  ///
  /// In en, this message translates to:
  /// **'2. User Obligations'**
  String get s_2_user_obligations;

  /// Auto extracted: Authorization
  ///
  /// In en, this message translates to:
  /// **'Authorization'**
  String get authorization;

  /// Auto extracted: Bearer $refreshToken
  ///
  /// In en, this message translates to:
  /// **'Bearer \$refreshToken'**
  String get bearer_refreshtoken;

  /// Auto extracted: By using our app, you agree to comply with and be bound by the following terms and conditions of use, which together with our privacy policy govern our relationship with you in relation to this application.
  ///
  /// In en, this message translates to:
  /// **'By using our app, you agree to comply with and be bound by the following terms and conditions of use, which together with our privacy policy govern our relationship with you in relation to this application.'**
  String get by_using_our_app_you_agree_to_comply_with_and_be_b;

  /// Auto extracted: Our goal is simple — to keep your space cool, energy-efficient comfortable, and  all year round. We use proper tools, follow industry best practices, and pay attention to every detail to ensure your AC performs at its best.
  ///
  /// In en, this message translates to:
  /// **'Our goal is simple — to keep your space cool, energy-efficient comfortable, and  all year round. We use proper tools, follow industry best practices, and pay attention to every detail to ensure your AC performs at its best.'**
  String get our_goal_is_simple_to_keep_your_space_cool_energy;

  /// Auto extracted: Time Range
  ///
  /// In en, this message translates to:
  /// **'Time Range'**
  String get time_range;

  /// Auto extracted: Bank account number
  ///
  /// In en, this message translates to:
  /// **'Bank account number'**
  String get bank_account_number;

  /// Auto extracted: Service Name
  ///
  /// In en, this message translates to:
  /// **'Service Name'**
  String get service_name;

  /// Auto extracted: Bearer $newToken
  ///
  /// In en, this message translates to:
  /// **'Bearer \$newToken'**
  String get bearer_newtoken;

  /// Auto extracted: NID or Driving license
  ///
  /// In en, this message translates to:
  /// **'NID or Driving license'**
  String get nid_or_driving_license;

  /// Auto extracted: How was your experience?
  ///
  /// In en, this message translates to:
  /// **'How was your experience?'**
  String get how_was_your_experience;

  /// Auto extracted: 1. Information We Collect
  ///
  /// In en, this message translates to:
  /// **'1. Information We Collect'**
  String get s_1_information_we_collect;

  /// Auto extracted: Payment Successful
  ///
  /// In en, this message translates to:
  /// **'Payment Successful'**
  String get payment_successful;

  /// Auto extracted: Withdraw
  ///
  /// In en, this message translates to:
  /// **'Withdraw'**
  String get withdraw;

  /// Auto extracted: Yesterday
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get yesterday;

  /// Auto extracted: Enter your company name
  ///
  /// In en, this message translates to:
  /// **'Enter your company name'**
  String get enter_your_company_name;

  /// Auto extracted: You have a new message from the service provider.
  ///
  /// In en, this message translates to:
  /// **'You have a new message from the service provider.'**
  String get you_have_a_new_message_from_the_service_provider;

  /// Auto extracted: Office Cleaning
  ///
  /// In en, this message translates to:
  /// **'Office Cleaning'**
  String get office_cleaning;

  /// Auto extracted: Your booking for AC repair has been confirmed by the provider.
  ///
  /// In en, this message translates to:
  /// **'Your booking for AC repair has been confirmed by the provider.'**
  String get your_booking_for_ac_repair_has_been_confirmed_by_t;

  /// Auto extracted: 2 weeks ago
  ///
  /// In en, this message translates to:
  /// **'2 weeks ago'**
  String get s_2_weeks_ago;

  /// Auto extracted: Customer Reviews
  ///
  /// In en, this message translates to:
  /// **'Customer Reviews'**
  String get customer_reviews;

  /// Auto extracted: Approved
  ///
  /// In en, this message translates to:
  /// **'Approved'**
  String get approved_1;

  /// Auto extracted: 1. Acceptance of Terms
  ///
  /// In en, this message translates to:
  /// **'1. Acceptance of Terms'**
  String get s_1_acceptance_of_terms;

  /// Auto extracted: Experience
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get experience;

  /// Auto extracted: Portable AC
  ///
  /// In en, this message translates to:
  /// **'Portable AC'**
  String get portable_ac;

  /// Auto extracted: Service Image
  ///
  /// In en, this message translates to:
  /// **'Service Image'**
  String get service_image;

  /// Auto extracted: Split AC
  ///
  /// In en, this message translates to:
  /// **'Split AC'**
  String get split_ac;

  /// Auto extracted: Packaged AC
  ///
  /// In en, this message translates to:
  /// **'Packaged AC'**
  String get packaged_ac;

  /// Auto extracted: My Service
  ///
  /// In en, this message translates to:
  /// **'My Service'**
  String get my_service;

  /// Auto extracted: ₫5,00
  ///
  /// In en, this message translates to:
  /// **'₫5,00'**
  String get s_5_00;

  /// Auto extracted: Floor Standing AC
  ///
  /// In en, this message translates to:
  /// **'Floor Standing AC'**
  String get floor_standing_ac;

  /// Auto extracted: Reject
  ///
  /// In en, this message translates to:
  /// **'Reject'**
  String get reject;

  /// Auto extracted: Whether it’s a new installation or an urgent repair, you can count on us for fast response, honest service, and lasting results.
  ///
  /// In en, this message translates to:
  /// **'Whether it’s a new installation or an urgent repair, you can count on us for fast response, honest service, and lasting results.'**
  String get whether_it_s_a_new_installation_or_an_urgent_repai;

  /// Auto extracted: No Choosen File
  ///
  /// In en, this message translates to:
  /// **'No Choosen File'**
  String get no_choosen_file;

  /// Auto extracted: Choose file
  ///
  /// In en, this message translates to:
  /// **'Choose file'**
  String get choose_file;

  /// Auto extracted: Choose Language
  ///
  /// In en, this message translates to:
  /// **'Choose Language'**
  String get choose_language;

  /// Auto extracted: 10 jan 2026 / 9:00 am
  ///
  /// In en, this message translates to:
  /// **'10 jan 2026 / 9:00 am'**
  String get s_10_jan_2026_9_00_am;

  /// Auto extracted: subtitle
  ///
  /// In en, this message translates to:
  /// **'subtitle'**
  String get subtitle;

  /// Auto extracted: Enter issue here...
  ///
  /// In en, this message translates to:
  /// **'Enter issue here...'**
  String get enter_issue_here;

  /// Auto extracted: data
  ///
  /// In en, this message translates to:
  /// **'data'**
  String get data;

  /// Auto extracted: Eva Longoria
  ///
  /// In en, this message translates to:
  /// **'Eva Longoria'**
  String get eva_longoria;

  /// Auto extracted: Enter your VAT Number
  ///
  /// In en, this message translates to:
  /// **'Enter your VAT Number'**
  String get enter_your_vat_number;

  /// Auto extracted: Gallery
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get gallery;

  /// Auto extracted: Jone Cooper
  ///
  /// In en, this message translates to:
  /// **'Jone Cooper'**
  String get jone_cooper;

  /// Auto extracted: Bank Name
  ///
  /// In en, this message translates to:
  /// **'Bank Name'**
  String get bank_name;

  /// Auto extracted: Upload Image
  ///
  /// In en, this message translates to:
  /// **'Upload Image'**
  String get upload_image;

  /// Auto extracted: Enter your bank account number
  ///
  /// In en, this message translates to:
  /// **'Enter your bank account number'**
  String get enter_your_bank_account_number;

  /// Auto extracted: Aircon Types
  ///
  /// In en, this message translates to:
  /// **'Aircon Types'**
  String get aircon_types;

  /// Auto extracted: Face ID
  ///
  /// In en, this message translates to:
  /// **'Face ID '**
  String get face_id_1;

  /// Auto extracted: We protect the data we store within commercially acceptable means to prevent loss and theft, as well as unauthorized access, disclosure, copying, use, or modification.
  ///
  /// In en, this message translates to:
  /// **'We protect the data we store within commercially acceptable means to prevent loss and theft, as well as unauthorized access, disclosure, copying, use, or modification.'**
  String get we_protect_the_data_we_store_within_commercially_a;

  /// Auto extracted: title
  ///
  /// In en, this message translates to:
  /// **'title'**
  String get title;

  /// Auto extracted: Notifications
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// Auto extracted: Email or phone number
  ///
  /// In en, this message translates to:
  /// **'Email or phone number'**
  String get email_or_phone_number;

  /// Auto extracted: Good quality work, but slightly expensive compared to others. However, the result was worth it.
  ///
  /// In en, this message translates to:
  /// **'Good quality work, but slightly expensive compared to others. However, the result was worth it.'**
  String get good_quality_work_but_slightly_expensive_compared;

  /// Auto extracted: 5.0
  ///
  /// In en, this message translates to:
  /// **'5.0'**
  String get s_5_0;

  /// Auto extracted: Hybrid AC
  ///
  /// In en, this message translates to:
  /// **'Hybrid AC'**
  String get hybrid_ac;

  /// Auto extracted: 123458
  ///
  /// In en, this message translates to:
  /// **'123458'**
  String get s_123458;

  /// Auto extracted: Central AC
  ///
  /// In en, this message translates to:
  /// **'Central AC'**
  String get central_ac;

  /// Auto extracted: Write Review
  ///
  /// In en, this message translates to:
  /// **'Write Review'**
  String get write_review;

  /// Auto extracted: Excellent service! The technician was professional and arrived on time. Highly recommended.
  ///
  /// In en, this message translates to:
  /// **'Excellent service! The technician was professional and arrived on time. Highly recommended.'**
  String get excellent_service_the_technician_was_professional;

  /// Auto extracted: Error picking image: $e
  ///
  /// In en, this message translates to:
  /// **'Error picking image: \$e'**
  String get error_picking_image_e;

  /// Auto extracted: My Earnings
  ///
  /// In en, this message translates to:
  /// **'My Earnings'**
  String get my_earnings;

  /// Auto extracted: Alice Freeman
  ///
  /// In en, this message translates to:
  /// **'Alice Freeman'**
  String get alice_freeman;

  /// Auto extracted: Your access to and use of the Service is conditioned on your acceptance of and compliance with these Terms. These Terms apply to all visitors, users, and others who access or use the Service.
  ///
  /// In en, this message translates to:
  /// **'Your access to and use of the Service is conditioned on your acceptance of and compliance with these Terms. These Terms apply to all visitors, users, and others who access or use the Service.'**
  String get your_access_to_and_use_of_the_service_is_condition;

  /// Auto extracted: Submit Review
  ///
  /// In en, this message translates to:
  /// **'Submit Review'**
  String get submit_review;

  /// Auto extracted: Service Type
  ///
  /// In en, this message translates to:
  /// **'Service Type'**
  String get service_type;

  /// Auto extracted: Write Issue
  ///
  /// In en, this message translates to:
  /// **'Write Issue'**
  String get write_issue;

  /// Auto extracted: Available Balance
  ///
  /// In en, this message translates to:
  /// **'Available Balance'**
  String get available_balance;

  /// Auto extracted: 2 mins ago
  ///
  /// In en, this message translates to:
  /// **'2 mins ago'**
  String get s_2_mins_ago;

  /// Auto extracted: David Beckham
  ///
  /// In en, this message translates to:
  /// **'David Beckham'**
  String get david_beckham;

  /// Auto extracted: 2 months ago
  ///
  /// In en, this message translates to:
  /// **'2 months ago'**
  String get s_2_months_ago;

  /// Auto extracted:  Resend
  ///
  /// In en, this message translates to:
  /// **' Resend'**
  String get resend;

  /// Auto extracted: service 2
  ///
  /// In en, this message translates to:
  /// **'service 2'**
  String get service_2;

  /// Auto extracted: Face ID Login
  ///
  /// In en, this message translates to:
  /// **'Face ID Login'**
  String get face_id_login;

  /// Auto extracted: Rumi Aktar
  ///
  /// In en, this message translates to:
  /// **'Rumi Aktar'**
  String get rumi_aktar;

  /// Auto extracted: 123457
  ///
  /// In en, this message translates to:
  /// **'123457'**
  String get s_123457;

  /// Auto extracted: Description
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// Auto extracted: The service has been marked as completed. Please leave a review.
  ///
  /// In en, this message translates to:
  /// **'The service has been marked as completed. Please leave a review.'**
  String get the_service_has_been_marked_as_completed_please_le;
}

class _SDelegate extends LocalizationsDelegate<S> {
  const _SDelegate();

  @override
  Future<S> load(Locale locale) {
    return SynchronousFuture<S>(lookupS(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_SDelegate old) => false;
}

S lookupS(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return SEn();
    case 'vi':
      return SVi();
  }

  throw FlutterError(
    'S.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
