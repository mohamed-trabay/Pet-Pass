// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      // Splash
      'sliding_text': 'PetPass',

      // Auth
      'Sign_in': 'Sign In',
      'Sign_up': 'Sign Up',
      'Password': 'Password',
      'Email': 'Email',
      'Enter_your_email': 'Enter your email',
      'Enter_your_password': 'Enter your password',
      'Forgot_Password': 'Forgot Password?',
      'Dont_have_an_account': 'Don\'t have an account?',
      'Create': 'Create',
      'Already_have_an_account': 'Already have an account?',
      'Welcome_back': 'Welcome back!',
      'Sign_in_to_continue': 'Sign in to continue',
      'Create_your_account': 'Create your account',
      'Sign_up_to_continue': 'Sign up to continue',
      'Full_Name': 'Full Name',
      'Enter_your_full_name': 'Enter your full name',
      'Confirm_Password': 'Confirm Password',
      'Enter_your_confirm_password': 'Enter your confirm password',
      'Password_does_not_match': 'Password does not match',
      'Please_enter_your_email': 'Please enter your email',
      'Please_enter_your_password': 'Please enter your password',
      'Please_enter_your_full_name': 'Please enter your full name',
      'Please_enter_your_confirm_password':
          'Please enter your confirm password',
      'password_is_too_weak': 'Password is too weak',
      'email_already_in_use': 'Email already in use',
      'invalid_eemail': 'Invalid email',
      'account_created': 'Account created successfully',

      // Home
      'banner1': 'Get Exclusive',
      'banner11': 'with One Click.',
      'banner11_button': 'Join Today',
      'banner2': 'Save more on pet care products',
      'banner22': 'Get access to premium offers and early discounts.',
      'categories': 'Popular Categories',
      'newest_items': 'Latest Deals',
      'more': 'More',
      'reedem': 'Reedem Voucher',
      'remove_from_cart': 'Remove from Favorites',
      'read_more': 'Read More',
      'read_less': 'Read Less',
      'more_option': 'Select an option',
      'r_s': 'AED',
      'Fixed_Banner1': 'Trusted by pet parents',
      'Fixed_Banner2': 'single subscription',
      'Fixed_Banner3': 'year round offers',
      'free': 'Free',
      'bottom_bannar1': 'Browse & Pick',
      'bottom_bannar11': 'Find the offers your pet will love.',
      'bottom_bannar2': 'Claim Instantly',

      'bottom_bannar22': 'Get your personal discount code with one click.',

      'bottom_bannar3': 'Get Your Code',

      'bottom_bannar33': 'We’ll email it to you for easy access later',

      'bottom_bannar4': 'Enjoy the Perk',
      'bottom_bannar44':
          'Show your code at the provider or use it online to redeem',
      'bottom_header': 'How to get a deal',

      // Search
      'search': 'Search',
      'searchhere': 'Search offers here',
      'serchtoshow': 'Search to show results',
      'noresult': 'No results found',
      'resut': 'Results',

      // Category
      'category1': 'Dogs',
      'category2': 'Cats',
      'category3': 'Birds',
      'category4': 'Rabbits',
      'category5': 'Fish',

      // Drawer
      'home': 'Home',
      'help': 'Help',
      'contact_us': 'Contact Us',
      'faqs': 'FAQs',
      'language': 'Language',
      'dark_mode': 'Dark',
      'light_mode': 'Light',
      'system_mode': 'Auto',
      'change_theme': 'Theme',
      'settings': 'Settings',
      'cancel': 'Cancel',
      'confirm': 'Confirm',
      'are_you_sure_logout': 'Are you sure you want to logout?',
      'no': 'No',
      'yes': 'Yes',

      // Profile
      'profile': 'Profile',
      'past_orders': 'My Offers',
      'privacy': 'Privacy Policy',
      'refund': 'Refund Policy',
      'logout': 'Logout',
      'about_us': 'About Us',
      'terms': 'Terms and Conditions',
      'user_name': 'Username',

      // Item Details
      'description': 'Description',
      'no_description': 'No description',

      // premiem
      'premium': 'Premium',
      'get_premium': 'Get Premium',
      'premium_benefits': 'Premium Benefits',
      'premium_benefit1': 'Unlimited access to all deals',
      'premium_benefit2': 'Early access to new deals',
      'premium_benefit3': 'Exclusive member-only offers',
      'premium_benefit4': 'Ad-free browsing experience',
      'premium_benefit5': 'Priority customer support',
      'subscribe_now': 'Subscribe Now',
      'monthly': 'Monthly',
      'yearly': 'Yearly',
      'select_plan': 'Select a plan',
      'already_subscribed': 'You are already subscribed to Premium',
      'subscribe': 'Subscribe',
      'restore_purchase': 'Restore Purchase',
      'subscription_success': 'Subscription successful',
      'subscription_failed': 'Subscription failed, please try again',
      'restore_success': 'Purchase restored successfully',
      'restore_failed': 'Failed to restore purchase, please try again',

      // Favorite
      'fav': 'Favorites',
      'no_fav': 'No favorites yet',
      'all_added': 'All offers added',
      'add_all_to_cart': 'Add All',

      // Store
      'store': 'Deals',
      'all_product': 'All Deals',
      'filter': 'Filter',
      'sort_by': 'Sort by:',
      'default_sorting': 'Latest',
      'high_price': 'Highest Discount',
      'newest_first': 'Newest First',
      'popularity': 'Most Popular',
      'apply': 'Apply',
      'only_sale': 'Discounted Only',
      'on_stock': 'Available Only',

      // User Details Form
      'user_info': 'User Information',
      'first_name': 'First Name',
      'last_name': 'Last Name',
      'email': 'Email',
      'phone': 'Phone Number',
      'whatsapp': 'WhatsApp Number',
      'country': 'Country',
      'city': 'City',
      'street': 'Street Name',
      'building': 'Building Number',
      'apartment': 'Apartment Number',
      'floor': 'Floor Number',
      'continue_payment': 'Continue',

      // Validation Messages
      'enter_first_name': 'Enter first name',
      'enter_last_name': 'Enter last name',
      'enter_email': 'Enter email',
      'invalid_email': 'Invalid email',
      'enter_phone': 'Enter phone number',
      'invalid_saudi_phone': 'Invalid phone number',
      'enter_whatsapp': 'Enter WhatsApp number',
      'enter_address': 'Enter address',
      'enter_country': 'Enter country',
      'enter_city': 'Enter city',
      'enter_street': 'Enter street name',
      'enter_building': 'Enter building number',
      'enter_apartment': 'Enter apartment number',
      'enter_floor': 'Enter floor number',

      // Error Messages
      'payment_error': 'Payment error',
      'order_error': 'Order creation error',
    },
    'ar': {
      // Splash
      'sliding_text': 'بيت باص',

      // Auth
      'Sign_in': 'تسجيل الدخول',
      'Sign_up': 'إنشاء حساب',
      'Password': 'كلمة المرور',
      'Email': 'البريد الإلكتروني',
      'Enter_your_email': 'أدخل بريدك الإلكتروني',
      'Enter_your_password': 'أدخل كلمة المرور',
      'Forgot_Password': 'هل نسيت كلمة المرور؟',
      'Dont_have_an_account': 'ليس لديك حساب؟',
      'Create': 'إنشاء',
      'Already_have_an_account': 'هل لديك حساب؟',
      'Welcome_back': 'مرحباً بعودتك!',
      'Sign_in_to_continue': 'قم بتسجيل الدخول للمتابعة',
      'Create_your_account': 'أنشئ حسابك',
      'Sign_up_to_continue': 'قم بالتسجيل للمتابعة',
      'Full_Name': 'الاسم الكامل',
      'Enter_your_full_name': 'أدخل اسمك الكامل',
      'Confirm_Password': 'تأكيد كلمة المرور',
      'Enter_your_confirm_password': 'أدخل تأكيد كلمة المرور',
      'Password_does_not_match': 'كلمة المرور غير متطابقة',
      'Please_enter_your_email': 'الرجاء إدخال بريدك الإلكتروني',
      'Please_enter_your_password': 'الرجاء إدخال كلمة المرور',
      'Please_enter_your_full_name': 'الرجاء إدخال اسمك الكامل',
      'Please_enter_your_confirm_password': 'الرجاء إدخال تأكيد كلمة المرور',
      'password_is_too_weak': 'كلمة المرور ضعيفة جداً',
      'email_already_in_use': 'البريد الإلكتروني مستخدم بالفعل',
      'invalid_eemail': 'البريد الإلكتروني غير صالح',
      'account_created': 'تم إنشاء الحساب بنجاح',

      // Home
      'banner1': 'احصل حصرياً على',
      'banner11': 'بنقرة واحدة.',
      'banner11_button': 'انضم اليوم',
      'banner2': 'وفر المزيد على منتجات العناية بالحيوانات',
      'banner22': 'احصل على وصول إلى عروض مميزة وخصومات مبكرة.',
      'categories': 'الفئات الشهيرة',
      'newest_items': 'أحدث العروض',
      'more': 'المزيد',
      'reedem': 'استرداد القسيمة',
      'remove_from_cart': 'احذف من المفضلة',
      'read_more': 'قراءة المزيد',
      'read_less': 'قراءة أقل',
      'more_option': 'تحديد احد الخيارات',
      'r_s': 'درهم',
      'Fixed_Banner1': 'موثوق من قبل أصحاب الحيوانات',
      'Fixed_Banner2': 'اشتراك واحد',
      'Fixed_Banner3': 'عروض على مدار السنة',
      'free': 'مجانا',
      'bottom_bannar1': 'تصفح واختر',
      'bottom_bannar11': 'اكتشف العروض التي سيحبها حيوانك الأليف.',

      'bottom_bannar2': 'احصل عليها فوراً',
      'bottom_bannar22': 'احصل على كود الخصم الخاص بك بنقرة واحدة.',

      'bottom_bannar3': 'احصل على الكود',
      'bottom_bannar33':
          'سنرسله إلى بريدك الإلكتروني لتتمكن من الوصول إليه لاحقًا.',

      'bottom_bannar4': 'استمتع بالمكافأة',
      'bottom_bannar44':
          'اعرض الكود لدى المزود أو استخدمه أونلاين لاستبدال العرض.',

      'bottom_header': 'كيفية الحصول على العرض',

      // Search
      'search': 'البحث',
      'searchhere': 'ابحث عن العروض',
      'serchtoshow': 'ابحث لعرض النتائج',
      'noresult': 'لا توجد نتائج',
      'resut': 'النتائج',

      // Category
      'category1': 'الكلاب',
      'category2': 'القطط',
      'category3': 'الطيور',
      'category4': 'الأرانب',
      'category5': 'الأسماك',

      // Drawer
      'home': 'الرئيسية',
      'help': 'المساعدة',
      'contact_us': 'اتصل بنا',
      'faqs': 'الأسئلة الشائعة',
      'language': 'اللغة',
      'dark_mode': 'داكن',
      'light_mode': 'فاتح',
      'system_mode': 'تلقائي',
      'change_theme': 'المظهر',
      'settings': 'الإعدادات',
      'cancel': 'إلغاء',
      'confirm': 'تأكيد',
      'are_you_sure_logout': 'هل أنت متأكد أنك تريد تسجيل الخروج؟',
      'no': 'لا',
      'yes': 'نعم',

      // Profile
      'profile': 'الملف الشخصي',
      'past_orders': 'عروضي',
      'privacy': 'سياسة الخصوصية',
      'refund': 'سياسة الاسترجاع',
      'logout': 'تسجيل الخروج',
      'about_us': 'من نحن',
      'terms': 'الأحكام والشروط',
      'user_name': 'اسم المستخدم',

      // Item Details
      'description': 'الوصف',
      'no_description': 'لا يوجد وصف',

      // premiem
      'premium': 'بريميوم',
      'get_premium': 'احصل على بريميوم',
      'premium_benefits': 'مزايا بريميوم',
      'premium_benefit1': 'وصول غير محدود إلى جميع العروض',
      'premium_benefit2': 'الوصول المبكر إلى العروض الجديدة',
      'premium_benefit3': 'عروض حصرية للأعضاء فقط',
      'premium_benefit4': 'تصفح بدون إعلانات',
      'premium_benefit5': 'دعم عملاء ذو أولوية',
      'subscribe_now': 'اشترك الآن',
      'monthly': 'شهري',
      'yearly': 'سنوي',
      'select_plan': 'اختر خطة',
      'already_subscribed': 'أنت مشترك بالفعل في بريميوم',
      'subscribe': 'اشترك',
      'restore_purchase': 'استعادة الشراء',
      'subscription_success': 'تم الاشتراك بنجاح',
      'subscription_failed': 'فشل الاشتراك، يرجى المحاولة مرة أخرى',
      'restore_success': 'تم استعادة الشراء بنجاح',
      'restore_failed': 'فشل استعادة الشراء، يرجى المحاولة مرة أخرى',

      // Favorite
      'fav': 'المفضلة',
      'no_fav': 'لا توجد مفضلات بعد',
      'all_added': 'تم إضافة جميع العروض',
      'add_all_to_cart': 'أضف الكل',

      // Store
      'store': 'العروض',
      'all_product': 'جميع العروض',
      'filter': 'تصفية',
      'sort_by': 'ترتيب حسب:',
      'default_sorting': 'الأحدث',
      'high_price': 'أعلى خصم',
      'newest_first': 'الأحدث أولاً',
      'popularity': 'الأكثر شيوعاً',
      'apply': 'تطبيق',
      'only_sale': 'المخفضة فقط',
      'on_stock': 'المتاح فقط',

      // User Details Form
      'user_info': 'معلومات المستخدم',
      'first_name': 'الاسم الأول',
      'last_name': 'الاسم الثاني',
      'email': 'البريد الإلكتروني',
      'phone': 'رقم الهاتف',
      'whatsapp': 'رقم الواتساب',
      'country': 'الدولة',
      'city': 'المدينة',
      'street': 'اسم الشارع',
      'building': 'رقم المبنى',
      'apartment': 'رقم الشقة',
      'floor': 'رقم الدور',
      'continue_payment': 'متابعة',

      // Validation Messages
      'enter_first_name': 'ادخل الاسم الأول',
      'enter_last_name': 'ادخل الاسم الثاني',
      'enter_email': 'ادخل البريد الإلكتروني',
      'invalid_email': 'البريد الإلكتروني غير صالح',
      'enter_phone': 'ادخل رقم الهاتف',
      'invalid_saudi_phone': 'رقم الهاتف غير صحيح',
      'enter_whatsapp': 'ادخل رقم الواتساب',
      'enter_address': 'ادخل العنوان',
      'enter_country': 'ادخل الدولة',
      'enter_city': 'ادخل المدينة',
      'enter_street': 'ادخل اسم الشارع',
      'enter_building': 'ادخل رقم المبنى',
      'enter_apartment': 'ادخل رقم الشقة',
      'enter_floor': 'ادخل رقم الدور',

      // Error Messages
      'payment_error': 'خطأ في الدفع',
      'order_error': 'خطأ في العملية',
    },
  };

  String translate(String key) {
    return _localizedValues[locale.languageCode]![key] ?? key;
  }

  // Splash
  String get slidingText => translate('sliding_text');

  // Auth
  String get signIn => translate('Sign_in');
  String get signUp => translate('Sign_up');
  String get password => translate('Password');
  String get email => translate('Email');
  String get enterYourEmail => translate('Enter_your_email');
  String get enterYourPassword => translate('Enter_your_password');
  String get forgotPassword => translate('Forgot_Password');
  String get dontHaveAnAccount => translate('Dont_have_an_account');
  String get create => translate('Create');
  String get alreadyHaveAnAccount => translate('Already_have_an_account');
  String get welcomeBack => translate('Welcome_back');
  String get signInToContinue => translate('Sign_in_to_continue');
  String get createYourAccount => translate('Create_your_account');
  String get signUpToContinue => translate('Sign_up_to_continue');
  String get fullName => translate('Full_Name');
  String get enterYourFullName => translate('Enter_your_full_name');
  String get confirmPassword => translate('Confirm_Password');
  String get enterYourConfirmPassword =>
      translate('Enter_your_confirm_password');
  String get passwordDoesNotMatch => translate('Password_does_not_match');
  String get pleaseEnterYourEmail => translate('Please_enter_your_email');
  String get pleaseEnterYourPassword => translate('Please_enter_your_password');
  String get pleaseEnterYourFullName =>
      translate('Please_enter_your_full_name');
  String get pleaseEnterYourConfirmPassword =>
      translate('Please_enter_your_confirm_password');
  String get passwordIsTooWeak => translate('password_is_too_weak');
  String get emailAlreadyInUse => translate('email_already_in_use');
  String get invalidEmail => translate('invalid_eemail');
  String get accountCreated => translate('account_created');

  // Home
  String get banner1 => translate('banner1');
  String get banner11 => translate('banner11');
  String get banner11Button => translate('banner11_button');
  String get banner2 => translate('banner2');
  String get banner22 => translate('banner22');
  String get categories => translate('categories');
  String get newestItems => translate('newest_items');
  String get more => translate('more');
  String get reedem => translate('reedem');

  String get removeFromCart => translate('remove_from_cart');
  String get readMore => translate('read_more');
  String get readLess => translate('read_less');
  String get moreOption => translate('more_option');
  String get rS => translate('r_s');
  String get fixedBanner1 => translate('Fixed_Banner1');
  String get fixedBanner2 => translate('Fixed_Banner2');
  String get fixedBanner3 => translate('Fixed_Banner3');
  String get free => translate('free');
  String get bottom_bannar1 => translate('bottom_bannar1'); // تصفح واختر
  String get bottom_bannar11 =>
      translate('bottom_bannar11'); // اكتشف العروض التي سيحبها حيوانك الأليف.

  String get bottom_bannar2 => translate('bottom_bannar2'); // احصل عليها فوراً
  String get bottom_bannar22 =>
      translate('bottom_bannar22'); // احصل على كود الخصم الخاص بك بنقرة واحدة.

  String get bottom_bannar3 => translate('bottom_bannar3'); // احصل على الكود
  String get bottom_bannar33 => translate(
    'bottom_bannar33',
  ); // سنرسله إلى بريدك الإلكتروني لتتمكن من الوصول إليه لاحقًا.

  String get bottom_bannar4 => translate('bottom_bannar4'); // استمتع بالمكافأة
  String get bottom_bannar44 => translate(
    'bottom_bannar44',
  ); // اعرض الكود لدى المزود أو استخدمه أونلاين لاستبدال العرض.

  String get bottom_header =>
      translate('bottom_header'); // كيفية الحصول على العرض

  // Category
  String get category1 => translate('category1');
  String get category2 => translate('category2');
  String get category3 => translate('category3');
  String get category4 => translate('category4');
  String get category5 => translate('category5');

  // Drawer
  String get home => translate('home');
  String get help => translate('help');
  String get contactUs => translate('contact_us');
  String get faqs => translate('faqs');
  String get language => translate('language');
  String get darkMode => translate('dark_mode');
  String get lightMode => translate('light_mode');
  String get systemMode => translate('system_mode');
  String get changeTheme => translate('change_theme');
  String get settings => translate('settings');
  String get cancel => translate('cancel');
  String get confirm => translate('confirm');
  String get areYouSureLogout => translate('are_you_sure_logout');
  String get no => translate('no');
  String get yes => translate('yes');

  // Profile
  String get profile => translate('profile');
  String get pastOrders => translate('past_orders');
  String get privacy => translate('privacy');
  String get refund => translate('refund');
  String get logout => translate('logout');
  String get aboutUs => translate('about_us');
  String get terms => translate('terms');
  String get userName => translate('user_name');

  // Item Details
  String get description => translate('description');
  String get noDescription => translate('no_description');

  // premiem
  String get premium => translate('premium');
  String get getPremium => translate('get_premium');
  String get premiumBenefits => translate('premium_benefits');
  String get premiumBenefit1 => translate('premium_benefit1');
  String get premiumBenefit2 => translate('premium_benefit2');
  String get premiumBenefit3 => translate('premium_benefit3');
  String get premiumBenefit4 => translate('premium_benefit4');
  String get premiumBenefit5 => translate('premium_benefit5');
  String get subscribeNow => translate('subscribe_now');
  String get monthly => translate('monthly');
  String get yearly => translate('yearly');
  String get selectPlan => translate('select_plan');
  String get alreadySubscribed => translate('already_subscribed');
  String get subscribe => translate('subscribe');
  String get restorePurchase => translate('restore_purchase');
  String get subscriptionSuccess => translate('subscription_success');
  String get subscriptionFailed => translate('subscription_failed');
  String get restoreSuccess => translate('restore_success');
  String get restoreFailed => translate('restore_failed');

  // Favorite
  String get fav => translate('fav');
  String get noFav => translate('no_fav');
  String get allAdded => translate('all_added');
  String get addAllToCart => translate('add_all_to_cart');

  // Search
  String get searchHere => translate('searchhere');
  String get searchToShow => translate('serchtoshow');
  String get search => translate('search');
  String get noResult => translate('noresult');
  String get result => translate('resut');

  // Store
  String get store => translate('store');
  String get allProduct => translate('all_product');
  String get filter => translate('filter');
  String get sortBy => translate('sort_by');
  String get defaultSorting => translate('default_sorting');
  String get highPrice => translate('high_price');
  String get newestFirst => translate('newest_first');
  String get popularity => translate('popularity');
  String get apply => translate('apply');
  String get onlySale => translate('only_sale');
  String get onStock => translate('on_stock');

  // User Details Form
  String get userInfo => translate('user_info');
  String get firstName => translate('first_name');
  String get lastName => translate('last_name');
  String get phone => translate('phone');
  String get whatsapp => translate('whatsapp');
  String get country => translate('country');
  String get city => translate('city');
  String get street => translate('street');
  String get building => translate('building');
  String get apartment => translate('apartment');
  String get floor => translate('floor');
  String get continuePayment => translate('continue_payment');

  // Validation Messages
  String get enterFirstName => translate('enter_first_name');
  String get enterLastName => translate('enter_last_name');
  String get enterEmail => translate('enter_email');
  String get enterPhone => translate('enter_phone');
  String get invalidSaudiPhone => translate('invalid_saudi_phone');
  String get enterWhatsapp => translate('enter_whatsapp');
  String get enterAddress => translate('enter_address');
  String get enterCountry => translate('enter_country');
  String get enterCity => translate('enter_city');
  String get enterStreet => translate('enter_street');
  String get enterBuilding => translate('enter_building');
  String get enterApartment => translate('enter_apartment');
  String get enterFloor => translate('enter_floor');

  // Error Messages
  String get paymentError => translate('payment_error');
  String get orderError => translate('order_error');
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
