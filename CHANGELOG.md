# Changelog

All notable changes to this project will be documented in this file.

The format is based on a modified version of [Keep a Changelog](https://keepachangelog.com/en/1.0.0/). The major difference is that links would only be provided for publicly available builds.

This project also adheres to a modified version of [Semantic Versioning](https://semver.org/spec/v2.0.0.html). In this version, major ui/ux changes and installation requirements mean a bump in the major version number. Any backward compatible feature change is indicated by a bump minor version number. Bug fixes and chores are indicated by bumps in patch version number.

Todo: Make this a private changelog

**Note: Commented code is considered deprecated**

## Unreleased

### Added

- Added all dart lints
- Added .env to store secrets
- Added .env to gitignore
- Added sentry for crash reporting
- Added new main_*,dart files with environment configs
- Added and configured talker for proper logging
- Generated asset routes

### Changed

- Customized lints to fit my personal taste.
- Improved Readme

### Deprecated
### Fixed 
### Removed

- Removed main.dart to force developer to add a build entry point

### Security

## 0.0.0 - 2023-05-10

### Added

- Added a copyright note.
- Added a changelog.
- Added sentry-flutter as a dependecy.

### Changed

- Restarted versioning from 0.0.0 because I just added a changelog and decided on a versioning style.
- Changed splashscreen, applogo and appname.
- Changed app README from the default flutter version to something more suitable for the app.

### Deprecated
- Deprecated attempted sentry implementation because it was not setup properly.