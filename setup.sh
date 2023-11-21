#!/bin/bash

# Setup script

echo ""
echo "~~ Are you ready? ~~"
echo ""

APP="z.sh"
if [ ! -e /opt/z.sh ]
then
    echo "$APP - Downloading..."
    curl -LJO https://raw.githubusercontent.com/rupa/z/master/z.sh
    sudo mv z.sh /opt/
else
    echo "$APP - Skipping"
fi

APP="tmux"
if ! command -v $APP &> /dev/null
then
    echo "$APP - Downloading..."
    sudo apt install $APP
    exit 1
else
    echo "$APP - Skipping"
fi

APP="gnome-tweaks"
if ! command -v $APP &> /dev/null
then
    echo "$APP - Downloading..."
    sudo apt install $APP
    exit 1
else
    echo "$APP - Skipping"
fi

APP="tig"
if ! command -v $APP &> /dev/null
then
    echo "$APP - Downloading..."
    sudo apt install $APP
    exit 1
else
    echo "$APP - Skipping"
fi
