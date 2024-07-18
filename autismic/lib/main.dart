import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:autismic/pages/home.dart';
import 'package:autismic/pages/history.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late GenerativeModel geminiVisionProModel;
  late GenerativeModel geminiProModel;
  late GoRouter _router;

  @override
  void initState() {
    super.initState();
    _initializeModels();
    _initializeRouter();
  }

  void _initializeModels() {
    const apiKey = "AIzaSyCdT94QQEbqEyCnazUitETDiG1gmqByX3E";
    if (apiKey == 'key not found') {
      throw Exception('API key not found in environment. Please add an API key.');
    }

    final generationConfig = GenerationConfig(
      temperature: 0.4,
      topK: 32,
      topP: 1,
      maxOutputTokens: 4096,
    );

    final safetySettings = [
      SafetySetting(HarmCategory.harassment, HarmBlockThreshold.high),
      SafetySetting(HarmCategory.hateSpeech, HarmBlockThreshold.high),
    ];

    geminiVisionProModel = GenerativeModel(
      model: 'gemini-pro-vision',
      apiKey: apiKey,
      generationConfig: generationConfig,
      safetySettings: safetySettings,
    );

    geminiProModel = GenerativeModel(
      model: 'gemini-pro',
      apiKey: apiKey,
      generationConfig: generationConfig,
      safetySettings: safetySettings,
    );
  }

  void _initializeRouter() {
    _router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => HistoryPage(
            geminiVisionProModel: geminiVisionProModel,
            geminiProModel: geminiProModel,
          ),
        ),
        GoRoute(
          path: '/history',
          builder: (context, state) => HistoryPage(
            geminiVisionProModel: geminiVisionProModel,
            geminiProModel: geminiProModel,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}
