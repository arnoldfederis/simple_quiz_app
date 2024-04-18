# Simple Quiz App

## How to set up local

```bash
  $ git clone https://github.com/arnoldfederis/simple_quiz_app.git
  $ cd /simple_quiz_app
  $ flutter pub get

  # To generate states & models using Freezed and Equatable
  # Freezed
  # https://pub.dev/packages/freezed
  # Equatable
  # https://pub.dev/packages/equatable
  $ flutter pub run build_runner build --delete-conflicting-outputs
```

## How to run in IOS / Android

* Open your emulator / simulator first

```bash
  # For Android
  $ emulator -list-avds
    <copy_result_of_avd>

  $ emulator -avd <selected-avd>
```

```bash
  # For IOS
  $ open -a simulator
```

* Run flutter in IOS / Android

```bash
  $ flutter run -d <device_name>
  # After executing `flutter run` select the device that you want.
```

## Folder structures

* `lib`
  * `app` - Modules directory
    * `pages.dart` - Export all page here
      * Example:

        ```dart
        export '<module>/page.dart';
        ```

    * `<module>` - Module directory
      * `bloc` - Bloc file.
      * `event.dart` - Bloc event file.
      * `state.dart` - Bloc state file.
      * `state.freezed.dart` - Generated freezed file - Don't customize.
      * `state.g.dart` - Generated json annotation file - Don't customize.
      * `models` - Module models.
        * `models.dart` - Export all models here.
      * `widgets` - Module Widgets
        * `widgets.dart` - Export all widgets here
      * `<module>.dart` - Export all from module
        * Example:

            ```dart
            export 'bloc.dart';
            export 'event.dart';
            export 'state.dart';
            export 'models/models.dart';
            export 'widgets/widgets.dart';
            ```

    * `bootstrap` - Bootstrap directory
      * `bootstrap.dart` - App initiator

    * `configs` - Configs directory

    * `theme` - Theme directory

    * `utils` - Utils directory

    * `main.dart` - Main dart file

    * `router.dart` - Router file
