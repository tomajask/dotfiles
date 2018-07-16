#!/usr/bin/env ruby

puts "Installing VSCode extensions"
puts "____________________________"

puts ">>> Do you want to install extensions? [Y/N]"

if gets.chomp.upcase == 'Y'
  EXTENSIONS = %w(
    castwide.solargraph
    donjayamanne.githistory
    eamodio.gitlens
    formulahendry.auto-rename-tag
    mkaufman.HTMLHint
    ms-vscode.Go
    ms-vsliveshare.vsliveshare
    octref.vetur
    PeterJausovec.vscode-docker
    rebornix.Ruby
    ritwickdey.LiveServer
    techer.open-in-browser
  )

  EXTENSIONS.each do |extension|
    system("code --install-extension #{extension}")
  end

  puts
  puts ">>> Following extensions are installed:"
  system("code --list-extensions --show-versions")
end

puts
puts "Configuring VSCode"
puts "_________________________"

puts ">>> Do you want to symlink VSCode config files? [Y/N]"

if gets.chomp.upcase == 'Y'
  VSCODE_DOTFILES_DIR = File.expand_path("..", Dir.pwd)
  VSCODE_CONFIG_DIR = "#{ENV['HOME']}/Library/Application\\ Support/Code/User"

  def create_symlink(source, target = VSCODE_CONFIG_DIR)
    command = "ln -svf #{source} #{target}"
    puts "> #{command}"
    system command
    puts
  end

  create_symlink("#{VSCODE_DOTFILES_DIR}/shared/vscode/settings.json")
  create_symlink("#{VSCODE_DOTFILES_DIR}/shared/vscode/keybindings.json")
  create_symlink("#{VSCODE_DOTFILES_DIR}/shared/vscode/snippets")
end
