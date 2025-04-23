# in root 

# build Runner and RunnerUITest, (you must have codesigning rights)
patrol build ios --target integration_test/dummy_test.dart --release

# archieve
# Depending on the system Debug-iphonesimulator Runner_iphonesimulator target paths may differ
# may need to copy from previous command output
pushd build/ios_integ/Build/Products
zip -r ios_tests.zip Release-iphoneos Runner_iphoneos18.2-arm64-x86_64.xctestrun
popd

#upload to fb test lab
gcloud firebase test ios run \
  --test build/ios_integ/Build/Products/ios_tests.zip \
  --device model=iphone8,version=18.0,locale=en_US,orientation=portrait
