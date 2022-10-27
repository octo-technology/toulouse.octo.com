<p align="center">
  <img src="/brand.png" alt="OCTO Toulouse">
</p>


## Setup Jekyll server using Ruby Quickstart
```
sudo yum group install 'Development Tools'
sudo yum install ruby ruby-devel rubygem-bundler
git clone git@github.com:octo-technology/toulouse.octo.com.git
cd toulouse.octo.com.git
bundle update --bundler
bundle config set path 'vendor/bundle'
bundle install
bundle exec jekyll serve --port 12000 --livereload
```

## Setup Jekyll Server inside a container
```
sudo make build-container
sudo make run-container
```
