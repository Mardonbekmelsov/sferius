// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Change Theme`
  String get change_theme {
    return Intl.message(
      'Change Theme',
      name: 'change_theme',
      desc: '',
      args: [],
    );
  }

  /// `Light Theme`
  String get light_theme {
    return Intl.message('Light Theme', name: 'light_theme', desc: '', args: []);
  }

  /// `Dark Theme`
  String get dark_theme {
    return Intl.message('Dark Theme', name: 'dark_theme', desc: '', args: []);
  }

  /// `en`
  String get locale {
    return Intl.message('en', name: 'locale', desc: '', args: []);
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Recent Searches`
  String get recent_search {
    return Intl.message(
      'Recent Searches',
      name: 'recent_search',
      desc: '',
      args: [],
    );
  }

  /// `Clear All`
  String get clear_all {
    return Intl.message('Clear All', name: 'clear_all', desc: '', args: []);
  }

  /// `Popular Searches`
  String get popular_search {
    return Intl.message(
      'Popular Searches',
      name: 'popular_search',
      desc: '',
      args: [],
    );
  }

  /// `Sfere Recommendations`
  String get sfere_recommend {
    return Intl.message(
      'Sfere Recommendations',
      name: 'sfere_recommend',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message('All', name: 'all', desc: '', args: []);
  }

  /// `Images`
  String get images {
    return Intl.message('Images', name: 'images', desc: '', args: []);
  }

  /// `Videos`
  String get video {
    return Intl.message('Videos', name: 'video', desc: '', args: []);
  }

  /// `News`
  String get news {
    return Intl.message('News', name: 'news', desc: '', args: []);
  }

  /// `See All`
  String get see_all {
    return Intl.message('See All', name: 'see_all', desc: '', args: []);
  }

  /// `Nothing Found`
  String get nothing_found {
    return Intl.message(
      'Nothing Found',
      name: 'nothing_found',
      desc: '',
      args: [],
    );
  }

  /// `Server Error`
  String get server_exception {
    return Intl.message(
      'Server Error',
      name: 'server_exception',
      desc: '',
      args: [],
    );
  }

  /// `Services`
  String get services {
    return Intl.message('Services', name: 'services', desc: '', args: []);
  }

  /// `Visit Site`
  String get enter_site {
    return Intl.message('Visit Site', name: 'enter_site', desc: '', args: []);
  }

  /// `Download App`
  String get download_app {
    return Intl.message(
      'Download App',
      name: 'download_app',
      desc: '',
      args: [],
    );
  }

  /// `Coming Soon`
  String get soon {
    return Intl.message('Coming Soon', name: 'soon', desc: '', args: []);
  }

  /// `Today`
  String get today {
    return Intl.message('Today', name: 'today', desc: '', args: []);
  }

  /// `Filter`
  String get filter {
    return Intl.message('Filter', name: 'filter', desc: '', args: []);
  }

  /// `Categories`
  String get categories {
    return Intl.message('Categories', name: 'categories', desc: '', args: []);
  }

  /// `Media`
  String get smi {
    return Intl.message('Media', name: 'smi', desc: '', args: []);
  }

  /// `Selected`
  String get selected {
    return Intl.message('Selected', name: 'selected', desc: '', args: []);
  }

  /// `Apply`
  String get apply {
    return Intl.message('Apply', name: 'apply', desc: '', args: []);
  }

  /// `Tabs`
  String get tabs {
    return Intl.message('Tabs', name: 'tabs', desc: '', args: []);
  }

  /// `History`
  String get history {
    return Intl.message('History', name: 'history', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Tech Support`
  String get tech_support {
    return Intl.message(
      'Tech Support',
      name: 'tech_support',
      desc: '',
      args: [],
    );
  }

  /// `About the App`
  String get about {
    return Intl.message('About the App', name: 'about', desc: '', args: []);
  }

  /// `Personal Information`
  String get personal_info {
    return Intl.message(
      'Personal Information',
      name: 'personal_info',
      desc: '',
      args: [],
    );
  }

  /// `Account Management`
  String get account_management {
    return Intl.message(
      'Account Management',
      name: 'account_management',
      desc: '',
      args: [],
    );
  }

  /// `Mail`
  String get mail {
    return Intl.message('Mail', name: 'mail', desc: '', args: []);
  }

  /// `Synchronization`
  String get synchronization {
    return Intl.message(
      'Synchronization',
      name: 'synchronization',
      desc: '',
      args: [],
    );
  }

  /// `Search Country`
  String get search_country {
    return Intl.message(
      'Search Country',
      name: 'search_country',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message('City', name: 'city', desc: '', args: []);
  }

  /// `Filter Mode`
  String get filter_mode {
    return Intl.message('Filter Mode', name: 'filter_mode', desc: '', args: []);
  }

  /// `Appearance`
  String get decoration {
    return Intl.message('Appearance', name: 'decoration', desc: '', args: []);
  }

  /// `Font Size`
  String get font_size {
    return Intl.message('Font Size', name: 'font_size', desc: '', args: []);
  }

  /// `Form Autofill`
  String get form_autofill {
    return Intl.message(
      'Form Autofill',
      name: 'form_autofill',
      desc: '',
      args: [],
    );
  }

  /// `Save History`
  String get save_history {
    return Intl.message(
      'Save History',
      name: 'save_history',
      desc: '',
      args: [],
    );
  }

  /// `Clear Cache`
  String get clear_cache {
    return Intl.message('Clear Cache', name: 'clear_cache', desc: '', args: []);
  }

  /// `Clear History`
  String get clear_history {
    return Intl.message(
      'Clear History',
      name: 'clear_history',
      desc: '',
      args: [],
    );
  }

  /// `Sign Out`
  String get sign_out {
    return Intl.message('Sign Out', name: 'sign_out', desc: '', args: []);
  }

  /// `If you have difficulties or any questions, you can contact us.`
  String get support_text {
    return Intl.message(
      'If you have difficulties or any questions, you can contact us.',
      name: 'support_text',
      desc: '',
      args: [],
    );
  }

  /// `Write on Telegram`
  String get write_to_telegram {
    return Intl.message(
      'Write on Telegram',
      name: 'write_to_telegram',
      desc: '',
      args: [],
    );
  }

  /// `Call`
  String get call {
    return Intl.message('Call', name: 'call', desc: '', args: []);
  }

  /// `Version`
  String get version {
    return Intl.message('Version', name: 'version', desc: '', args: []);
  }

  /// `Privacy Policy`
  String get privacy_policy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `License Agreement`
  String get license_accept {
    return Intl.message(
      'License Agreement',
      name: 'license_accept',
      desc: '',
      args: [],
    );
  }

  /// `Recommendation Rules`
  String get recommend_rules {
    return Intl.message(
      'Recommendation Rules',
      name: 'recommend_rules',
      desc: '',
      args: [],
    );
  }

  /// `Weather`
  String get weather {
    return Intl.message('Weather', name: 'weather', desc: '', args: []);
  }

  /// `Currency Exchange`
  String get currency {
    return Intl.message(
      'Currency Exchange',
      name: 'currency',
      desc: '',
      args: [],
    );
  }

  /// `Recent Chats`
  String get recent_chats {
    return Intl.message(
      'Recent Chats',
      name: 'recent_chats',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get see_all_chat {
    return Intl.message('See All', name: 'see_all_chat', desc: '', args: []);
  }

  /// `New Chat`
  String get new_chat {
    return Intl.message('New Chat', name: 'new_chat', desc: '', args: []);
  }

  /// `All Chats`
  String get all_chats {
    return Intl.message('All Chats', name: 'all_chats', desc: '', args: []);
  }

  /// `Clear Chat History`
  String get clear_chat_history {
    return Intl.message(
      'Clear Chat History',
      name: 'clear_chat_history',
      desc: '',
      args: [],
    );
  }

  /// `Share Chat`
  String get share_chat {
    return Intl.message('Share Chat', name: 'share_chat', desc: '', args: []);
  }

  /// `Ask Sferius`
  String get ask_sferius {
    return Intl.message('Ask Sferius', name: 'ask_sferius', desc: '', args: []);
  }

  /// `Delete Chat`
  String get delete_chat {
    return Intl.message('Delete Chat', name: 'delete_chat', desc: '', args: []);
  }

  /// `Create New Chat`
  String get make_new_chat {
    return Intl.message(
      'Create New Chat',
      name: 'make_new_chat',
      desc: '',
      args: [],
    );
  }

  /// `Chats`
  String get chats {
    return Intl.message('Chats', name: 'chats', desc: '', args: []);
  }

  /// `App Language`
  String get app_language {
    return Intl.message(
      'App Language',
      name: 'app_language',
      desc: '',
      args: [],
    );
  }

  /// `New`
  String get neew {
    return Intl.message('New', name: 'neew', desc: '', args: []);
  }

  /// `Main`
  String get main_settings {
    return Intl.message('Main', name: 'main_settings', desc: '', args: []);
  }

  /// `Interface`
  String get interface {
    return Intl.message('Interface', name: 'interface', desc: '', args: []);
  }

  /// `Confidentiality`
  String get confidentiality {
    return Intl.message(
      'Confidentiality',
      name: 'confidentiality',
      desc: '',
      args: [],
    );
  }

  /// `Like in system`
  String get like_system {
    return Intl.message(
      'Like in system',
      name: 'like_system',
      desc: '',
      args: [],
    );
  }

  /// `Enter to Pro ID to access this function`
  String get sferius_pro_id {
    return Intl.message(
      'Enter to Pro ID to access this function',
      name: 'sferius_pro_id',
      desc: '',
      args: [],
    );
  }

  /// `To see tabs and history enter Pro ID`
  String get history_pro_id {
    return Intl.message(
      'To see tabs and history enter Pro ID',
      name: 'history_pro_id',
      desc: '',
      args: [],
    );
  }

  /// `News Not Found`
  String get news_not_found {
    return Intl.message(
      'News Not Found',
      name: 'news_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Text Size`
  String get text_size {
    return Intl.message('Text Size', name: 'text_size', desc: '', args: []);
  }

  /// `Enter With Pro ID`
  String get enter_with_pro_id {
    return Intl.message(
      'Enter With Pro ID',
      name: 'enter_with_pro_id',
      desc: '',
      args: [],
    );
  }

  /// `No History Yet`
  String get no_history_yet {
    return Intl.message(
      'No History Yet',
      name: 'no_history_yet',
      desc: '',
      args: [],
    );
  }

  /// `No Tabs Yet`
  String get no_tabs_yet {
    return Intl.message('No Tabs Yet', name: 'no_tabs_yet', desc: '', args: []);
  }

  /// `Location Disabled`
  String get location_disabled {
    return Intl.message(
      'Location Disabled',
      name: 'location_disabled',
      desc: '',
      args: [],
    );
  }

  /// `Turn on location to see weather`
  String get turn_on_location {
    return Intl.message(
      'Turn on location to see weather',
      name: 'turn_on_location',
      desc: '',
      args: [],
    );
  }

  /// `Open Settings`
  String get open_settings {
    return Intl.message(
      'Open Settings',
      name: 'open_settings',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Location required to see weather data`
  String get location_required {
    return Intl.message(
      'Location required to see weather data',
      name: 'location_required',
      desc: '',
      args: [],
    );
  }

  /// `App needs location to show weather data`
  String get need_location {
    return Intl.message(
      'App needs location to show weather data',
      name: 'need_location',
      desc: '',
      args: [],
    );
  }

  /// `Open app settings`
  String get open_app_settings {
    return Intl.message(
      'Open app settings',
      name: 'open_app_settings',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message('Error', name: 'error', desc: '', args: []);
  }

  /// `Unexpected error in location`
  String get location_unexpected {
    return Intl.message(
      'Unexpected error in location',
      name: 'location_unexpected',
      desc: '',
      args: [],
    );
  }

  /// `Delete account`
  String get delete_account {
    return Intl.message(
      'Delete account',
      name: 'delete_account',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'uz'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
