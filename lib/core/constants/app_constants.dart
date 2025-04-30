// ignore_for_file: constant_identifier_names

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sferius_ai/utils/app_colors.dart';

class AppConstants {
  static String baseUrlCurrency =
      'https://cbu.uz/ru/arkhiv-kursov-valyut/json/';
  static const String sfProBold = 'SfProBold';
  static const String sfProLight = 'SfProLight';
  static const String sfProMedium = 'SfProMedium';
  static const String sfProRegular = 'SfProRegular';
  static const String sfProSemiBold = 'SfProSemiBold';
  static const String sharedToCurrent = 'CurrentWeather';
  static const String sharedToCurrency = 'Currency';
  static const String sharedToToken = 'userToken';

  static const List<String> collections = [
    'Cheef',
    'Good Look',
    'My Tab',
    'Influency',
    'Dozzer',
    'Share',
    'Disk',
    'Pro Id',
    'Donate',
    'CRM',
    'Support',
  ];
  static const List<String> urls = [
    'https://cheeff.uz',
    'https://goodlook.uz',
    'https://mytab.uz',
    'https://influency.uz',
    'https://dozzer.uz',
    'https://share.uz',
    'https://disk.sfere.pro',
    'https://id.sfere.pro',
    'https://donate.sfere.pro',
    'https://crm.sfere.pro',
    'https://support.sfere.pro',
  ];
  static const List<List<Color>> gradientColors = [
    [AppColors.c2753E3, AppColors.c00D4C7],
    [],
    [],
    AppColors.influencyColor,
    [],
    [],
    [],
    [],
    [],
    [],
    [],
  ];
  static const List<String> soons = [
    "Mail",
    "News",
    "MyTab",
    "GoodLook",
    "Dozzer",
    "CRM",
    "PAY",
    "JOBI",
    "SFERIUS AI",
    "INVEST",
    "CALENDAR",
    "PROFI DOC",
    "PROFI VET",
  ];

  static const String api = 'fcdb90d53f1a5ad32a7e1caf36745525';
  static const String baseUrlWeather =
      'https://api.openweathermap.org/data/2.5/';
  static const String baseUrl = 'https://api1.sfere.pro/v1/';
  static const String baseUrlV2 = 'https://api1.sfere.pro/v2/';
}

enum Status { Loading, Success, Error, Initial, NetworkError, LocationError }

enum AuthStatus { Authenticated, Unauthenticated }
