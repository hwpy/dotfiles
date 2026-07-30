function Linemode:size_and_mtime()
  local time = math.floor(self._file.cha.mtime or 0)
  if time == 0 then
    time = ""
  elseif os.date("%Y", time) == os.date("%Y") then
    time = os.date("%b %d %H:%M", time)
  else
    time = os.date("%b %d  %Y", time)
  end

  local size = self._file:size()
  return string.format("%s %s", size and ya.readable_size(size) or "-", time)
end

require("bunny"):setup({
  hops = {
    { key = "/",          path = "/",                                                  },
    { key = "t",          path = "/tmp",                                               },
    { key = "~",          path = "~",                        desc = "Home"             },
    { key = "m",          path = "~/Music",                  desc = "Music"            },
    { key = "p",          path = "~/Pictures",               desc = "Pictures"         },
    { key = "d",          path = "~/dotfiles",               desc = "dotfiles"         },
    { key = "c",          path = "~/.config",                desc = "Config files"     },
    { key = { "D", "c" }, path = "~/Documents",              desc = "Documents"        },
    { key = { "D", "w" }, path = "~/Downloads",              desc = "Downloads"        },
    { key = { "l", "s" }, path = "~/.local/share",           desc = "Local share"      },
    { key = { "l", "b" }, path = "~/.local/bin",             desc = "Local bin"        },
    { key = { "l", "t" }, path = "~/.local/state",           desc = "Local state"      },
    { key = { "g", "l" }, path = "~/Documents/repos/GitLab", desc = "GitLab projects"  },
    { key = { "g", "h" }, path = "~/Documents/repos/GitHub", desc = "GitHub projects"  },
    -- key and path attributes are required, desc is optional
  },
  desc_strategy = "path", -- If desc isn't present, use "path" or "filename", default is "path"
  ephemeral = true, -- Enable ephemeral hops, default is true
  tabs = true, -- Enable tab hops, default is true
  notify = false, -- Notify after hopping, default is false
  fuzzy_cmd = "fzf", -- Fuzzy searching command, default is "fzf"
})
