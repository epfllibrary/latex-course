# Commands with make

run ```source /etc/profile.d/rvm.sh``` and ```rvm use 2.6 --default``` first


```make site```: compile the Jekyll

```make serve```: compile the Jekyll and create a temporary webserver (http://localhost:4000), it also auto update the compilation when files change

```make latex-push```: compile jekyll, make the commit and then push  everything into the github and the github pages
