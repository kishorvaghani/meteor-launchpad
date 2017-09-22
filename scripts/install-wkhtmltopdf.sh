#!/bin/bash

set -e

if [ -f $APP_SOURCE_DIR/launchpad.conf ]; then
  source <(grep INSTALL_WKHTMLTOPDF $APP_SOURCE_DIR/launchpad.conf)
  source <(grep WKHTMLTOPDF_VERSION $APP_SOURCE_DIR/launchpad.conf)
fi

if [ "$INSTALL_WKHTMLTOPDF" = true ]; then
  printf "\n[-] Installing wkhtmltopdf...\n\n"

  WKHTMLTOPDF="wkhtmltox-$WKHTMLTOPDF_VERSION_linux-generic-amd64"

  apt-get update
  apt-get install -y wget chrpath libssl-dev libxft-dev

  cd /tmp
  wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/$WKHTMLTOPDF_VERSION/$WKHTMLTOPDF.tar.xz
  tar xvf $WKHTMLTOPDF.tar.xz
  mv wkhtmltox/bin/wkhtmlto* /usr/bin/

  #ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/share/phantomjs
  #ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin/phantomjs
  #ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/bin/phantomjs

  apt-get -y purge wget
fi
