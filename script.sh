#!/bin/bash
if [ -z "$1" ]
then
      echo "Project name is necessary"
			exit -1
fi

flutter create -i swift -a kotlin $1

cd $1

mkdir -p lib/application
mkdir -p lib/domain/core
mkdir -p lib/infrastructure/core
mkdir -p lib/presentation/core
mkdir -p lib/presentation/pages
mkdir -p lib/presentation/routes

git init .

code .