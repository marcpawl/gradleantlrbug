#!/bin/bash 

function gradlePass {
  # Run Gradle and expect it to pass
  gradle build
  rc1=$?
  echo gradle return code $rc1
  if [ $rc1 != 0 ]
  then
    echo gradle test build failed when it should have passed
    exit 1
  fi
}

function gradleFail {
  # Run Gradle and expect it to fail
  gradle build
  rc1=$?
  echo gradle return code $rc1
  if [ $rc1 == 0 ]
  then
    echo gradle test build passed when it should have failed
    exit 1
  fi
}

export PATH=/gradle-2.10/bin:$PATH
cd code
echo Demonstation that -lib causes failing build to succeed
rm -rf build
gradlePass
find build
rm -rf build
echo "Remvoing -lib from build.gradle"
sed -i.bak '/-lib/d' build.gradle
cat build.gradle
gradleFail
find build

echo bug has been replicated
exit 0

