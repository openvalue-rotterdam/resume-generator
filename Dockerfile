FROM debian:9.5-slim

# |--------------------------------------------------------------------------
# | Common libraries
# |--------------------------------------------------------------------------
# |
# | Libraries used in the build process of this image.
# |

RUN echo "deb http://httpredir.debian.org/debian/ stretch main contrib non-free" > /etc/apt/sources.list &&\
    apt-get update &&\
    apt-get install -y curl wget python3-pip ttf-mscorefonts-installer

# |--------------------------------------------------------------------------
# | PM2
# |--------------------------------------------------------------------------
# |
# | Installs PM2 for launching programs in background and with failure 
# | recovering. In our case: Chrome (headless) and Office (headless). 
# |

RUN curl -sL https://deb.nodesource.com/setup_9.x | bash - &&\
    apt-get install -y nodejs &&\
    npm install -g pm2

# |--------------------------------------------------------------------------
# | Chrome
# |--------------------------------------------------------------------------
# |
# | Installs Chrome.
# |

RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - &&\
    echo "deb http://dl.google.com/linux/chrome/deb/ stable main" | tee /etc/apt/sources.list.d/google-chrome.list &&\
    apt-get update &&\
    apt-get -y --allow-unauthenticated install google-chrome-stable

# |--------------------------------------------------------------------------
# | Unoconv
# |--------------------------------------------------------------------------
# |
# | Installs unoconv and LibreOffice.
# |

RUN pip3 install unoconv &&\
    # https://github.com/nextcloud/docker/issues/380
    mkdir -p /usr/share/man/man1mkdir -p /usr/share/man/man1 &&\
    apt-get -y install libreoffice


