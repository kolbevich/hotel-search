# invoke from project root using absolute path
# dont forget to make this file an executable (chomd +x for mac)

# download and build allure-xcresult
git clone https://$GH_USERNAME:$GH_TOKEN@github.com/kvld/allure-xcresult.git
cd allure-xcresult 
swift package init --type executable
swift build
swift run AllureXCResult --version

#Install Allure
brew install allure
allure --version

#activate patrol
dart pub global activate patrol_cli 3.5.1

#run tests
patrol test --target integration_test/tests --verbose -d "iPhone SE (3rd generation)"

# generate report
cd allure-xcresult 
swift run AllureXCResult --input `cd $HOME/VisualStudioProjects/hotel-search/build/*.xcresult && pwd` --output  $HOME/VisualStudioProjects/hotel-search/integration_test/report 
cd ../
allure generate --single-file $HOME/VisualStudioProjects/hotel-search/integration_test/report --report-dir $HOME/VisualStudioProjects/hotel-search/integration_test/httml_allure_report --clean