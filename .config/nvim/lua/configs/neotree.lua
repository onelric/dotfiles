local git_icons = {
    --unstaged  = "",
    --unstaged  = "󰧟",
    unstaged  = "󰰐",
    staged    = "",
    unmerged  = "",
    renamed   = "",
    untracked = "★",
    deleted   = "",
    ignored   = "◌",
}

local folder_icons = {
    default      = "",
    open         = "",
    empty        = "",
    empty_open   = "",
    symlink      = "",
    arrow_open   = "",
    arrow_closed = "",
}

require('neo-tree').setup {
    window = {
        position = "left",
        width = "45",
        mappings = {
            ["a"] = { "add", config = { show_path = "relative" } },
            ["o"] = { "open", nowait = true }
        },
    },
    open_files_do_not_replace_types = { "terminal", "trouble", "qf" }, -- when opening files, do not use windows containing these filetypes or buftypes
    close_if_last_window = true,
    default_component_configs = {
        indent = {
            with_markers = false,
            with_expanders = true,
            expander_collapsed = "",
            expander_expanded = "",
            expander_highlight = "NeoTreeExpander",
        },
        icon = {
            folder_closed = folder_icons.default,
            folder_open = folder_icons.open,
            folder_empty = folder_icons.empty,
            highlight = "NeotreeFileIcon"
        },
        modified = {
            symbol = '*',
            highlight = "NeoTreeModified"
        },
        diagnostics = {
            symbols = {
                --hint = "󰌵",
                hint = "",
                --warn = "",
                warn = "",
                error = "",
                --info = "",
                info = "",
            }
        },
        git_status = {
            symbols = {
                added = "",
                modified = "",
                deleted = git_icons.deleted,
                renamed = git_icons.renamed,
                untracked = git_icons.untracked,
                ignored = git_icons.ignored,
                unstaged = git_icons.unstaged,
                staged = git_icons.staged,
                conflict = git_icons.unmerged
            }
        }
    },
    filesystem = {
        hijack_netrw_behaviour = "open_default",
        filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignore = false,
            hide_hidden = false,
        }
    },

}
