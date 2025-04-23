# invoke from project root using absolute path
# dont forget to make this file an executable (chomd +x for mac)

# Set up Patrol CLI
echo "Setting up patrol..."
dart pub global activate patrol_cli
export PATH="$PATH":"$HOME/.pub-cache/bin"

# Set up gcloud CLI
echo "Setting uo gcloud CLI..."
gcloud auth activate-service-account --key-file=<my_service_account>
gcloud --quiet config set project buenro-hotel-search

# ------------------------------------------------------------------------------
# iOS Test Setup

# Build Runner and RunnerUITest (requires codesigning rights for physical device)
# FB test lab does not support simulators, so you need to build on a physical device in release mode
echo "Building iOS test executables..."
patrol build ios --target integration_test/dummy_test.dart --release

# Archive the build and prepare the test file
echo "Adding iOS test executables to archive..."
pushd build/ios_integ/Build/Products
zip -r ios_tests.zip Release-iphoneos Runner_iphoneos18.2-arm64.xctestrun
popd

# Upload the iOS test to Firebase Test Lab
echo "Starting test run for iOS..."
gcloud firebase test ios run \
  --test build/ios_integ/Build/Products/ios_tests.zip \
  --device model=iphone15,version=18.0,locale=en_US,orientation=portrait &  # Run in background

# ------------------------------------------------------------------------------
# Android Test Setup

# Build app-debug.apk and app-debug-androidTest.apk
echo "Building Android test executables..."
patrol build android --target integration_test/dummy_test.dart

# Upload the Android test to Firebase Test Lab
echo "Starting test run for Android..."
gcloud firebase test android run \
  --type instrumentation \
  --use-orchestrator \
  --app build/app/outputs/apk/debug/app-debug.apk \
  --test build/app/outputs/apk/androidTest/debug/app-debug-androidTest.apk \
  --timeout 1m \
  --device model=MediumPhone.arm,version=34,locale=en,orientation=portrait \
  --record-video \
  --environment-variables clearPackageData=true


# Wait for both tests to finish
wait

echo "Both tests have finished."
