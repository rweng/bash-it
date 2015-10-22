# function for setting up and updating a machine, idea stolen from
# https://github.com/thoughtbot/laptop


function laptop(){
  #TODO: add check for when it's not OSX

  function setup_markdown_preview(){
    echo "setting up markdown preview for Finder and QuickLook"

    # install
    brew cask install --force qlmarkdown

    # enable text selection by Quicklook
    defaults write com.apple.finder QLEnableTextSelection -bool TRUE;
  }

  brew_tap 'caskroom/cask'
  brew_install_or_upgrade 'brew-cask'

  setup_markdown_preview
}
