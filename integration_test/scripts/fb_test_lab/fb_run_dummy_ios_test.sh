# invoke from project root using absolute path

# set up patrol cli
dart pub global activate patrol_cli   
export PATH="$PATH":"$HOME/.pub-cache/bin"

# set up gcloud cli
gcloud auth activate-service-account --key-file=<my_service_account>
gcloud --quiet config set project buenro-hotel-search


# build Runner and RunnerUITest, 
# FB test lab does not support simulators, so you would've to build on physical device in release mode 
# (you must have codesigning rights)
patrol build ios --target integration_test/dummy_test.dart --release --verbose

# archieve
# Depending on the system Release-iphoneos Runner_iphoneos target paths may differ
# may need to copy from previous command output
pushd build/ios_integ/Build/Products
zip -r ios_tests.zip Release-iphoneos Runner_iphoneos18.2-arm64.xctestrun
popd


#upload to fb test lab
gcloud firebase test ios run \
  --test build/ios_integ/Build/Products/ios_tests.zip \
  --device model=iphone15,version=18.0,locale=en_US,orientation=portrait
