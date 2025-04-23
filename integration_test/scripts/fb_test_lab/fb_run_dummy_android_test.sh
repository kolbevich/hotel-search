# build app-debug.apk and app-debug-androidTest.apk
patrol build android --target integration_test/dummy_test.dart

#upload to FB test lab
gcloud firebase test android run \     
    --type instrumentation \
    --use-orchestrator \
    --app build/app/outputs/apk/debug/app-debug.apk \
    --test build/app/outputs/apk/androidTest/debug/app-debug-androidTest.apk \
    --timeout 1m \
    --device model=MediumPhone.arm,version=34,locale=en,orientation=portrait \
    --record-video \
    --environment-variables clearPackageData=true
