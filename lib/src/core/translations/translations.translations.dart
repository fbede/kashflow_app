/// Generated file. Do not edit.
///
/// Original: assets/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 1
/// Strings: 53
///
/// Built on 2024-06-04 at 20:48 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	en(languageCode: 'en', build: Translations.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
Translations get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	Translations get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// interfaces generated as mixins

mixin OnboardingPageData {
	String get title;
	String get subtitle;

	@override
	bool operator ==(Object other) => other is OnboardingPageData && title == other.title && subtitle == other.subtitle;

	@override
	int get hashCode => title.hashCode * subtitle.hashCode;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	late final _TranslationsAccountModuleEn account_module = _TranslationsAccountModuleEn._(_root);
	late final _TranslationsCurrencyModuleEn currency_module = _TranslationsCurrencyModuleEn._(_root);
	late final _TranslationsIconModuleEn icon_module = _TranslationsIconModuleEn._(_root);
	late final _TranslationsOnboardingModuleEn onboarding_module = _TranslationsOnboardingModuleEn._(_root);
	late final _TranslationsOtherEn other = _TranslationsOtherEn._(_root);
	late final _TranslationsSharedEn shared = _TranslationsSharedEn._(_root);
	late final _TranslationsRecordsEn records = _TranslationsRecordsEn._(_root);
	String get settings => 'Settings';
	String get purse => 'Purse';
	String get portfoilo => 'Portfolio';
	String get account_name => 'Account Name';
	String get add_new_account => 'Add New Account';
	String get add_account => 'Add Account';
	String get edit_account => 'Edit Account';
	String get new_record => 'New Record';
}

// Path: account_module
class _TranslationsAccountModuleEn {
	_TranslationsAccountModuleEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _TranslationsAccountModuleAccountPurseViewEn account_purse_view = _TranslationsAccountModuleAccountPurseViewEn._(_root);
	late final _TranslationsAccountModuleAccountPopupMenuButtonEn account_popup_menu_button = _TranslationsAccountModuleAccountPopupMenuButtonEn._(_root);
	late final _TranslationsAccountModuleCreateEditAccountViewEn create_edit_account_view = _TranslationsAccountModuleCreateEditAccountViewEn._(_root);
}

// Path: currency_module
class _TranslationsCurrencyModuleEn {
	_TranslationsCurrencyModuleEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _TranslationsCurrencyModuleCurrencyFormFieldEn currency_form_field = _TranslationsCurrencyModuleCurrencyFormFieldEn._(_root);
}

// Path: icon_module
class _TranslationsIconModuleEn {
	_TranslationsIconModuleEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _TranslationsIconModuleIconPickerEn icon_picker = _TranslationsIconModuleIconPickerEn._(_root);
	late final _TranslationsIconModuleIconSelectorEn icon_selector = _TranslationsIconModuleIconSelectorEn._(_root);
	late final _TranslationsIconModuleColorPickerEn color_picker = _TranslationsIconModuleColorPickerEn._(_root);
}

// Path: onboarding_module
class _TranslationsOnboardingModuleEn {
	_TranslationsOnboardingModuleEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _TranslationsOnboardingModuleOnboardingScreenEn onboarding_screen = _TranslationsOnboardingModuleOnboardingScreenEn._(_root);
	late final _TranslationsOnboardingModuleMobileAppShellEn mobile_app_shell = _TranslationsOnboardingModuleMobileAppShellEn._(_root);
	late final _TranslationsOnboardingModuleHomeScreenEn home_screen = _TranslationsOnboardingModuleHomeScreenEn._(_root);
}

// Path: other
class _TranslationsOtherEn {
	_TranslationsOtherEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _TranslationsOtherMoreScreenEn more_screen = _TranslationsOtherMoreScreenEn._(_root);
}

// Path: shared
class _TranslationsSharedEn {
	_TranslationsSharedEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _TranslationsSharedWidgetsEn widgets = _TranslationsSharedWidgetsEn._(_root);
}

// Path: records
class _TranslationsRecordsEn {
	_TranslationsRecordsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Records';
}

// Path: account_module.account_purse_view
class _TranslationsAccountModuleAccountPurseViewEn {
	_TranslationsAccountModuleAccountPurseViewEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get add_new_account => 'Add New Account';
	String get nothing_here => 'Nothing Here';
	String get create_a_new_account_text => 'Create a new account to start managing your finances.';
}

// Path: account_module.account_popup_menu_button
class _TranslationsAccountModuleAccountPopupMenuButtonEn {
	_TranslationsAccountModuleAccountPopupMenuButtonEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get edit => 'Edit';
	String get delete => 'Delete';
}

// Path: account_module.create_edit_account_view
class _TranslationsAccountModuleCreateEditAccountViewEn {
	_TranslationsAccountModuleCreateEditAccountViewEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get add_account => 'Add Account';
	String get edit_account => 'Edit Account';
	String get account_name => 'Account Name';
	String get balance_change_warning => 'You are about to change the opening balance of your account. This will also change the current balance of the account.';
}

// Path: currency_module.currency_form_field
class _TranslationsCurrencyModuleCurrencyFormFieldEn {
	_TranslationsCurrencyModuleCurrencyFormFieldEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get select_currency => 'Select Currency';
	String get cannot_be_empty => 'Cannot Be Empty';
	String get currency => 'Currency';
}

// Path: icon_module.icon_picker
class _TranslationsIconModuleIconPickerEn {
	_TranslationsIconModuleIconPickerEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get select_icon => 'Select Icon';
	String get search => 'Search';
}

// Path: icon_module.icon_selector
class _TranslationsIconModuleIconSelectorEn {
	_TranslationsIconModuleIconSelectorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get change_icon_color => 'Change Icon Color';
	String get change_background_color => 'Change Background Color';
	String get reset_colors => 'Reset Colors';
}

// Path: icon_module.color_picker
class _TranslationsIconModuleColorPickerEn {
	_TranslationsIconModuleColorPickerEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get pick_a_color => 'Pick a color!';
}

// Path: onboarding_module.onboarding_screen
class _TranslationsOnboardingModuleOnboardingScreenEn {
	_TranslationsOnboardingModuleOnboardingScreenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	List<OnboardingPageData> get pages => [
		_TranslationsOnboardingModuleOnboardingScreen$pages$0i0$En._(_root),
		_TranslationsOnboardingModuleOnboardingScreen$pages$0i1$En._(_root),
		_TranslationsOnboardingModuleOnboardingScreen$pages$0i2$En._(_root),
		_TranslationsOnboardingModuleOnboardingScreen$pages$0i3$En._(_root),
	];
	String get currency_picker_title => 'Select Default Currency';
}

// Path: onboarding_module.mobile_app_shell
class _TranslationsOnboardingModuleMobileAppShellEn {
	_TranslationsOnboardingModuleMobileAppShellEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get nav_bar_home => 'Home';
	String get nav_bar_records => 'Records';
	String get nav_bar_more => 'More';
}

// Path: onboarding_module.home_screen
class _TranslationsOnboardingModuleHomeScreenEn {
	_TranslationsOnboardingModuleHomeScreenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Home';
	String get purse => 'Purse';
	String get portfoilo => 'Portfolio';
	String get balance => 'BALANCE';
	String get net_worth => 'NET WORTH';
	String get new_record => 'New Record';
}

// Path: other.more_screen
class _TranslationsOtherMoreScreenEn {
	_TranslationsOtherMoreScreenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'More';
}

// Path: shared.widgets
class _TranslationsSharedWidgetsEn {
	_TranslationsSharedWidgetsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _TranslationsSharedWidgetsCustomTextFieldsEn custom_text_fields = _TranslationsSharedWidgetsCustomTextFieldsEn._(_root);
	late final _TranslationsSharedWidgetsSaveOrCancelButtonBarEn save_or_cancel_button_bar = _TranslationsSharedWidgetsSaveOrCancelButtonBarEn._(_root);
}

// Path: onboarding_module.onboarding_screen.pages.0
class _TranslationsOnboardingModuleOnboardingScreen$pages$0i0$En with OnboardingPageData {
	_TranslationsOnboardingModuleOnboardingScreen$pages$0i0$En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	@override String get title => 'Welcome To Kashflow';
	@override String get subtitle => 'Let\'s help you manage your finances';
}

// Path: onboarding_module.onboarding_screen.pages.1
class _TranslationsOnboardingModuleOnboardingScreen$pages$0i1$En with OnboardingPageData {
	_TranslationsOnboardingModuleOnboardingScreen$pages$0i1$En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	@override String get title => 'Record Your Daily Transactions';
	@override String get subtitle => 'Enter your daily transactions to find out how much you are making';
}

// Path: onboarding_module.onboarding_screen.pages.2
class _TranslationsOnboardingModuleOnboardingScreen$pages$0i2$En with OnboardingPageData {
	_TranslationsOnboardingModuleOnboardingScreen$pages$0i2$En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	@override String get title => 'Discover Your Finances';
	@override String get subtitle => 'Indepth analysis of your money tells you where you can cut costs and increase income.';
}

// Path: onboarding_module.onboarding_screen.pages.3
class _TranslationsOnboardingModuleOnboardingScreen$pages$0i3$En with OnboardingPageData {
	_TranslationsOnboardingModuleOnboardingScreen$pages$0i3$En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	@override String get title => 'Know Your Networth';
	@override String get subtitle => 'View and manage your assets and liabilities - stocks, bonds, saving, loans, real estate, crypto, gold, anything. Seriously, anything!';
}

// Path: shared.widgets.custom_text_fields
class _TranslationsSharedWidgetsCustomTextFieldsEn {
	_TranslationsSharedWidgetsCustomTextFieldsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get description => 'Description';
	String get amount => 'Amount';
	String get cannot_be_empty => 'Cannot Be Empty';
	String get too_short => 'Too Short';
	String get search => 'Search';
}

// Path: shared.widgets.save_or_cancel_button_bar
class _TranslationsSharedWidgetsSaveOrCancelButtonBarEn {
	_TranslationsSharedWidgetsSaveOrCancelButtonBarEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get cancel => 'Cancel';
	String get save => 'Save';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'account_module.account_purse_view.add_new_account': return 'Add New Account';
			case 'account_module.account_purse_view.nothing_here': return 'Nothing Here';
			case 'account_module.account_purse_view.create_a_new_account_text': return 'Create a new account to start managing your finances.';
			case 'account_module.account_popup_menu_button.edit': return 'Edit';
			case 'account_module.account_popup_menu_button.delete': return 'Delete';
			case 'account_module.create_edit_account_view.add_account': return 'Add Account';
			case 'account_module.create_edit_account_view.edit_account': return 'Edit Account';
			case 'account_module.create_edit_account_view.account_name': return 'Account Name';
			case 'account_module.create_edit_account_view.balance_change_warning': return 'You are about to change the opening balance of your account. This will also change the current balance of the account.';
			case 'currency_module.currency_form_field.select_currency': return 'Select Currency';
			case 'currency_module.currency_form_field.cannot_be_empty': return 'Cannot Be Empty';
			case 'currency_module.currency_form_field.currency': return 'Currency';
			case 'icon_module.icon_picker.select_icon': return 'Select Icon';
			case 'icon_module.icon_picker.search': return 'Search';
			case 'icon_module.icon_selector.change_icon_color': return 'Change Icon Color';
			case 'icon_module.icon_selector.change_background_color': return 'Change Background Color';
			case 'icon_module.icon_selector.reset_colors': return 'Reset Colors';
			case 'icon_module.color_picker.pick_a_color': return 'Pick a color!';
			case 'onboarding_module.onboarding_screen.pages.0.title': return 'Welcome To Kashflow';
			case 'onboarding_module.onboarding_screen.pages.0.subtitle': return 'Let\'s help you manage your finances';
			case 'onboarding_module.onboarding_screen.pages.1.title': return 'Record Your Daily Transactions';
			case 'onboarding_module.onboarding_screen.pages.1.subtitle': return 'Enter your daily transactions to find out how much you are making';
			case 'onboarding_module.onboarding_screen.pages.2.title': return 'Discover Your Finances';
			case 'onboarding_module.onboarding_screen.pages.2.subtitle': return 'Indepth analysis of your money tells you where you can cut costs and increase income.';
			case 'onboarding_module.onboarding_screen.pages.3.title': return 'Know Your Networth';
			case 'onboarding_module.onboarding_screen.pages.3.subtitle': return 'View and manage your assets and liabilities - stocks, bonds, saving, loans, real estate, crypto, gold, anything. Seriously, anything!';
			case 'onboarding_module.onboarding_screen.currency_picker_title': return 'Select Default Currency';
			case 'onboarding_module.mobile_app_shell.nav_bar_home': return 'Home';
			case 'onboarding_module.mobile_app_shell.nav_bar_records': return 'Records';
			case 'onboarding_module.mobile_app_shell.nav_bar_more': return 'More';
			case 'onboarding_module.home_screen.title': return 'Home';
			case 'onboarding_module.home_screen.purse': return 'Purse';
			case 'onboarding_module.home_screen.portfoilo': return 'Portfolio';
			case 'onboarding_module.home_screen.balance': return 'BALANCE';
			case 'onboarding_module.home_screen.net_worth': return 'NET WORTH';
			case 'onboarding_module.home_screen.new_record': return 'New Record';
			case 'other.more_screen.title': return 'More';
			case 'shared.widgets.custom_text_fields.description': return 'Description';
			case 'shared.widgets.custom_text_fields.amount': return 'Amount';
			case 'shared.widgets.custom_text_fields.cannot_be_empty': return 'Cannot Be Empty';
			case 'shared.widgets.custom_text_fields.too_short': return 'Too Short';
			case 'shared.widgets.custom_text_fields.search': return 'Search';
			case 'shared.widgets.save_or_cancel_button_bar.cancel': return 'Cancel';
			case 'shared.widgets.save_or_cancel_button_bar.save': return 'Save';
			case 'records.title': return 'Records';
			case 'settings': return 'Settings';
			case 'purse': return 'Purse';
			case 'portfoilo': return 'Portfolio';
			case 'account_name': return 'Account Name';
			case 'add_new_account': return 'Add New Account';
			case 'add_account': return 'Add Account';
			case 'edit_account': return 'Edit Account';
			case 'new_record': return 'New Record';
			default: return null;
		}
	}
}
