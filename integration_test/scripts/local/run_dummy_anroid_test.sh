# invoke from project root using absolute path
# dont forget to make this file an executable (chomd +x for mac)

# set up patrol cli
dart pub global activate patrol_cli   
export PATH="$PATH":"$HOME/.pub-cache/bin"

# check for availible emulators
$ANDROID_HOME/emulator/emulator -list-avds

# Run first availible emulator in the background (make sure you have smth)
$ANDROID_HOME/emulator/emulator -avd $( $ANDROID_HOME/emulator/emulator -list-avds | head -n 1 ) & adb wait-for-device

#run test
patrol test --target integration_test/dummy_test.dart --verbose