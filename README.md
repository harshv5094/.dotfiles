# 🔨 My Dotfiles

⚠️ Warning: Don't blindly use my setup unless you know what it is. Use it at your own risk!

## Font Dependency

Some configuration needs nerd fonts to properly show icons. You can download the font from [here](https://www.nerdfonts.com/font-downloads). I am using `JetBrainsMono Nerd Font` in my setup.

## How to install my setup

For now I'm using Arch Linux as my current system.

### Linux

```bash
curl -fsLo /tmp/setup.sh https://raw.githubusercontent.com/harshv5094/.dotfiles/refs/heads/main/setup.sh && bash /tmp/setup.sh && rm -rf /tmp/setup.sh
```

## FAQ

### My `bat` config is not working properly?

Sometimes, `bat` forgets to cache themes. Run the command below to fix it:

```sh
bat cache --build
```
