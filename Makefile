clean:
	flutter clean
	flutter pub get

run_dev:
	flutter run -d chrome --web-browser-flag "--disable-web-security"

format:
	dart fix --apply
	dart format .
	flutter analyze .

gen:
	flutter pub run build_runner build

gen_all:
	flutter pub run build_runner build -d

logo_gen:
	flutter pub run flutter_launcher_icons:main

.PHONY: clean run_dev format gen gen_all logo_gen
