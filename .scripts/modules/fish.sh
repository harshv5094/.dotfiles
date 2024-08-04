#!/usr/bin/env fish

set CONFIG_PATH ~/.config/fish
set BASE_DIR $HOME/.dotfiles/.config/fish

if test -d "$CONFIG_PATH"
  echo "Removing Existing Config Files for fish"
  rm -rf "$CONFIG_PATH"
  echo "Making Necessary Directories for fish"
  mkdir "$CONFIG_PATH/"
  mkdir "$CONFIG_PATH/conf.d/"
  mkdir "$CONFIG_PATH/functions/"
  mkdir "$CONFIG_PATH/completions/"
  mkdir "$CONFIG_PATH/themes/"
end

echo "Copying files to config path"
ln -s "$BASE_DIR/config.fish" "$CONFIG_PATH"
ln -s "$BASE_DIR/alias.fish" "$CONFIG_PATH"
ln -s "$BASE_DIR/config-osx.fish" "$CONFIG_PATH"
ln -s "$BASE_DIR/config-linux.fish" "$CONFIG_PATH"
ln -s "$BASE_DIR/conf.d/tide.fish" "$CONFIG_PATH/conf.d/"
ln -s "$BASE_DIR/completions/gh.fish" "$CONFIG_PATH/completions/"
ln -s "$BASE_DIR/functions/fzf_change_directory.fish" "$CONFIG_PATH/functions/"
ln -s "$BASE_DIR/functions/fish_prompt.fish" "$CONFIG_PATH/functions/"
ln -s "$BASE_DIR/functions/fish_user_key_bindings.fish" "$CONFIG_PATH/functions/"
ln -s "$BASE_DIR/themes/tokyonight_day.theme" "$CONFIG_PATH/themes/"
ln -s "$BASE_DIR/themes/tokyonight_moon.theme" "$CONFIG_PATH/themes/"
ln -s "$BASE_DIR/themes/tokyonight_night.theme" "$CONFIG_PATH/themes/"
ln -s "$BASE_DIR/themes/tokyonight_storm.theme" "$CONFIG_PATH/themes/"
cp -rf "$BASE_DIR/fish_variables" "$CONFIG_PATH"

echo "Installing fisher..."
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
echo "fisher installed successfully."

echo "Install fisher Plugins"
cp -rf "$BASE_DIR/fish_plugins" "$CONFIG_PATH"
fish -c "fisher update"
echo "Fisher Plugin Installed Successfully."
