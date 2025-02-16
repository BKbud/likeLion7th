import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

import 'todo_list_view.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The ListenableBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    // ListenableBuilder는 SettingsController의 변화를 감지한다.
    // 사용자가 setting을 변경하면 MaterialApp이 다시 불려진다.
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          // Providing a restorationScopeId allows the Navigator built by the
          // MaterialApp to restore the navigation stack when a user leaves and
          // returns to the app after it has been killed while running in the
          // background.
          restorationScopeId: 'app',

          // Provide the generated AppLocalizations to the MaterialApp. This
          // allows descendant Widgets to display the correct translations
          // depending on the user's locale.
          localizationsDelegates: const [
            // 앱에서 사용하는 지역화 문자열을 찾는 데 사용.
            AppLocalizations.delegate,

            // Flutter에서 제공하는 기본적인 위젯들의 다국어 지원을 위한 delegate
            // Material Design 위젯의 텍스트를 번역한다.
            // 예: 'OK', 'Cancel' 버튼의 텍스트, 달력의 요일 이름 등
            GlobalMaterialLocalizations.delegate,

            // Flutter 위젯들의 일반적인 텍스트를 위한 delegae
            // 플랫폼에 따른 텍스트 방향 (LTR, RTL) 등을 처리한다.
            GlobalWidgetsLocalizations.delegate,

            // Cupertino (iOS 스타일) 위젯들의 다국어 지원을 위한 delegate
            GlobalCupertinoLocalizations.delegate,
          ],
          // settings에 locale 추가
          locale: settingsController.locale,
          // supportedLocales에 localize 할 언어 추가
          supportedLocales: const [
            Locale('en', ''), // English, no country code
            Locale('ko', ''),
          ],

          // Use AppLocalizations to configure the correct application title
          // depending on the user's locale.
          //
          // The appTitle is defined in .arb files found in the localization
          // directory.
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,

          // Define a light and dark color theme. Then, read the user's
          // preferred ThemeMode (light, dark, or system default) from the
          // SettingsController to display the correct theme.
          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode,

          // Define a function to handle named routes in order to support
          // Flutter web url navigation and deep linking.
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case SettingsView.routeName:
                    return SettingsView(controller: settingsController);
                  case TodoListView.routeName:
                    return TodoListView();
                  default:
                    return const TodoListView();
                }
              },
            );
          },
        );
      },
    );
  }
}
