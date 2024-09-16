deep-clean-ios:
	@echo "Cleaning ios"
	fvm flutter clean
	cd ios && rm -rf Podfile.lock
	cd ios && rm -rf Pods
	fvm flutter pub get
	cd ios && pod install --repo-update

clean-ios:
	@echo "Cleaning ios"
	fvm flutter clean
	cd ios && rm -rf Podfile.lock
	cd ios && rm -rf Pods
	fvm flutter pub get
	cd ios && pod install

clean-android:
	@echo "Cleaning android"
	rm -rf build
	cd android && ./gradlew clean
	fvm flutter pub get

clean:
	@echo "Cleaning the repo"
	rm -rf build
	fvm flutter clean

build-adb:
	@echo "Building App bundle"
	fvm flutter pub get
	fvm flutter build appbundle

build-apk:
	@echo "Building APK"
	fvm flutter pub get
	fvm flutter build apk

build-runner:
	@echo "Executing build runner"
	dart run build_runner build --delete-conflicting-outputs
	fvm flutter pub get

watch-runner:
	@echo "Executing watch runner"
	dart run build_runner watch --delete-conflicting-outputs

unit-test:
	@echo "Testing app"
	fvm flutter test

ios-integration-test:
	@echo "Starting integration test"
	fvm flutter test integration_test/auth_tests/login_test.dart --flavor=development --dart-define=FLUTTER_TEST=true --dart-define-from-file=env/.env.development -d 5F47CC73-9301-46BC-9EAA-F400DFDEA2DC

fix:
	@echo "Fixing syntax"
	fvm dart fix --apply



