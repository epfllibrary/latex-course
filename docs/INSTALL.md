# Windows

In Windows Powershell, as an admin, [install WSL](https://docs.microsoft.com/en-us/windows/wsl/install) and then install Debian with command:

wsl --install -d Debian

Restart your computer.

Launch Debian. 

Install packages in Debian: 

sudo apt-get update

sudo apt-get install git-all

sudo apt install ruby-full

sudo apt-get install texlive-full

Clone the content of the repository into the Debian environment:

git clone https://github.com/epfllibrary/latex-course.git

In the folder latex-course, run the following commands:

sudo apt-get ruby-full build-essential imagemagick git texlive-full

sudo gem install jekyll bundler

# Linux (debian)

sudo apt-get ruby-full build-essential imagemagick git texlive-full

sudo gem install jekyll bundler

# MacOS

TODO
