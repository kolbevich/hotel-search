# invoke from project root using absolute path
# dont forget to make this file an executable (chomd +x for mac)

# set up patrol cli
dart pub global activate patrol_cli   
export PATH="$PATH":"$HOME/.pub-cache/bin"

#boot simulator
xcrun simctl boot $( xcrun simctl list devices | grep -m 1 'iPhone 16 Pro' | grep -E -o -i '([0-9a-f]{8}-([0-9a-f]{4}-){3}[0-9a-f]{12})')
open -a /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app

#run test
patrol test --target integration_test/dummy_test.dart --verbose -d "iPhone 16 Pro"
