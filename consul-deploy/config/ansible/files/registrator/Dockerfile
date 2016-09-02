FROM ruby
ENV PORT 8080
run curl  https://gist.githubusercontent.com/pollosp/1ebd781f01e95b33e869/raw/9c65fdc75509d4d1d54617b19cb7d15d5a8961ea/dockerfile -o /mnt/rackup.sh
run chmod +x /mnt/rackup.sh
ENTRYPOINT /mnt/rackup.sh
