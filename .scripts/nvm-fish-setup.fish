#!/usr/bin/fish

if type -q nvm
    nvm install lts
    echo lts >~/.nvmrc
    npm i -g commitizen cz-git yarn bun
end
