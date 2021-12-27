vim.g.defx_icons_root_opened_tree_icon = "├"
                vim.g.defx_icons_nested_opened_tree_icon = "├"
                vim.g.defx_icons_nested_closed_tree_icon = "│"
                vim.g.defx_icons_directory_icon = "│"
                vim.g.defx_icons_parent_icon = "├"

                vim.fn["defx#custom#column"]("mark", {
                    ["readonly_icon"] = "◆",
                    ["selected_icon"] = "■",
                })

                vim.fn["defx#custom#column"]("indent", {
                    ["indent"] = "    ",
                })

                vim.fn["defx#custom#option"]("_", {
                    ["columns"] = "indent:mark:icons:git:filename",
                })

                vim.fn["defx#custom#column"]("git", "indicators", {
                    ["Modified"] = "◉",
                    ["Staged"] = "✚",
                    ["Untracked"] = "◈",
                    ["Renamed"] = "➜",
                    ["Unmerged"] = "═",
                    ["Ignored"] = "▨",
                    ["Deleted"] = "✖",
                    ["Unknown"] = "?",
                })
