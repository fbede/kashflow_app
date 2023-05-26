///The strings found in this class cannot be seen by the user
// ignore_for_file: constant_identifier_names

@Deprecated(
  'This class is to be deleted use other  more specific keys like DevStringKeys, SharedPrefKeys & NavParamKeys',
)
class HiddenStrings {
  static const SETTINGS = 'settings';
  static const THEMEMODE = 'themeMode';
}

///These are strings used by the developer as keys no non essenstial things
/* class DevStringKeys {
  static const FONT_FAMILY = 'Nunito';
} */

///These keys are used to store stuff in shared preferences
class SharedPrefKeys {
  static const ONBOARDED = 'hasOnboarded';
}

///These strings are used by the developer as keys in path parameters, query parameters and extras for the developer
class NavParamKeys {
  static const IS_DEFAULT_EXTRA_KEY = 'isDefault';
  static const BASIC_CURRENCY_EXTRA_KEY = 'basicCurrency';
  static const IS_SAVED_EXTRA_KEY = 'isSaved';
}
