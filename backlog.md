# Backlog

## nvim

| Приоритет | Суть | Где |
|---|---|---|
| HIGH | `none-ls.nvim` дублирует ruff (диагностика + форматирование) с нативным LSP | `lua/plugins/none-ls.lua` |
| HIGH | `options.lua` заменяет табы пробелами на любое сохранение — ломает Makefile/Go | `lua/configs/options.lua:8-15` |
| HIGH | `nabla.nvim` тянет neo-tree как зависимость (300KB+) для markdown-math | `lua/plugins/nabla.lua` |
| MEDIUM | `venv-selector` — `init` ломает ленивую загрузку | `lua/plugins/venv-selector.lua` |
| MEDIUM | `gitsigns.nvim` — `lazy = false`, грузится даже не в git-репо | `lua/plugins/init.lua` |
| MEDIUM | `ruff/pyproject.toml` — тильда `~` не раскрывается LSP-сервером | `lua/configs/lspconfig.lua:56` |
| LOW | Дублирующаяся загрузка сниппетов в `init.lua` + `configs/luasnip.lua` | `init.lua:46-51` + `lua/configs/luasnip.lua:6-11` |
| LOW | Мёртвые файлы: `gp.lua`, `smear_cursor.lua`, `gpagents*.lua` | `lua/plugins/`, `lua/configs/` |
| LOW | `tabstop=4` в `init.lua` вместо `options.lua` | `init.lua:14-18` |
| LOW | `conform.lua` без lazy-load trigger | `lua/plugins/conform.lua` |
| LOW | macOS-специфичные фильтры `onedrive`/`icloud` в nvim-tree | `lua/plugins/nvim-tree.lua:9` |

## zsh

| Приоритет | Суть | Где |
|---|---|---|
| HIGH | `fnm env --use-on-cd` — 200-800ms старт + лаг на `cd` | `~/.zshrc:159` |
| MEDIUM | `fastfetch` на каждую интерактивную сессию | `~/.zshrc:35` |
| MEDIUM | `/sbin/lua-language-server` — нестандартный путь, не используется | `~/.zshrc:29` |
| LOW | `alias c="exec zsh"` дропает login-shell | `~/.zshrc:19` |
| LOW | `ssh-agent` eval на каждый shell (дублирует gnome-keyring из `.xprofile`) | `~/.zshrc:13-15` |
| LOW | `bindkey` до `source oh-my-zsh.sh` — могут перезаписаться | `~/.zshrc:1-3` |

## tmux

| Приоритет | Суть | Где |
|---|---|---|
| MEDIUM | Ручной `run tmux-yank` дублирует TPM-загрузку | `~/.tmux.conf:55` |
| LOW | Нет `default-terminal "tmux-256color"` | `~/.tmux.conf` |
| LOW | `continuum-save-interval 5` — агрессивно, дефолт 15 | `~/.tmux.conf:46` |
| LOW | Тильда в `run` команде — не везде раскрывается | `~/.tmux.conf:54` |
