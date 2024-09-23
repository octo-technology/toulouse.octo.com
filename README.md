<p align="center">
  <img src="/brand.png" alt="OCTO Toulouse">
</p>


## Setup Jekyll server using Ruby Quickstart (with yum and sudo user)
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

## Setup Jekyll server (with brew, without sudo user - macos)

https://jekyllrb.com/docs/installation/macos/

```
brew install chruby ruby-install xz
ruby-install ruby 3.1.3

echo "source $(brew --prefix)/opt/chruby/share/chruby/chruby.sh" >> ~/.zshrc
echo "source $(brew --prefix)/opt/chruby/share/chruby/auto.sh" >> ~/.zshrc
echo "chruby ruby-3.1.3" >> ~/.zshrc # run 'chruby' to see actual version

gem install jekyll

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
