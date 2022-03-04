# Windows / Linux (ubuntu debian)

In Windows Powershell, as an admin, [install WSL](https://docs.microsoft.com/en-us/windows/wsl/install) and then install Debian with command:

wsl --install -d Debian

Restart your computer.

Launch Debian.

Install packages in Debian:

sudo -s

apt update
apt install git texlive-full imagemagick build-essential curl
apt remove ruby

command curl -sSL https://rvm.io/mpapis.asc |  gpg --import -
command curl -sSL https://rvm.io/pkuczynski.asc |  gpg --import -

curl -sSL https://get.rvm.io |  bash -s stable

source /etc/profile.d/rvm.sh
rvm requirements
rvm install 2.6
gem install github-pages

sed -i_bak \
's/rights="none" pattern="PDF"/rights="read | write" pattern="PDF"/' \
/etc/ImageMagick-6/policy.xml

exit



# MacOS

TODO
