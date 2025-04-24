# invoke from project root using absolute path
# dont forget to make this file an executable (chomd +x for mac)

#activate patrol
dart pub global activate patrol_cli 3.5.1

#run tests
patrol test --target integration_test/tests --verbose -d "iPhone SE (3rd generation)"