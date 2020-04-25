#!/bin/bash
if [ -z "$1" ]
then
      echo "Project name is necessary"
			exit -1
fi

flutter create -i swift -a kotlin $1

cd $1
sed -e '0,/sdk: flutter/ s/sdk: flutter/sdk: flutter\n  flutter_bloc: ^4.0.0\n  equatable: ^1.1.1\n  meta: ^1.1.8/' pubspec.yaml > test.txt
rm pubspec.yaml
mv test.txt pubspec.yaml

flutter pub get
flutter pub upgrade
flutter pub get

mkdir -p lib/application
mkdir -p lib/domain/core
mkdir -p lib/infrastructure/core
mkdir -p lib/presentation/core
mkdir -p lib/presentation/pages
mkdir -p lib/presentation/routes

git init .
git add .
git commit -m "Initialize project"

code .