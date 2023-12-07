return {{
    "nvim-tree/nvim-web-devicons",
    lazy = true,

    config = function()

        require('nvim-web-devicons').setup {
            color_icons = true,
            -- globally enable default icons (default to false)
            -- will get overriden by `get_icons` option
            default = true,
            -- globally enable "strict" selection of icons - icon will be looked up in
            -- different tables, first by filename, and if not found by extension; this
            -- prevents cases when file doesn't have any extension but still gets some icon
            -- because its name happened to match some extension (default to false)
            strict = true,
            -- same as `override` but specifically for overrides by filename
            -- takes effect when strict` is true
            override_by_filename = {
                ["cmakelists.txt"] = {
                    icon = "",
                    color = "#ffd400",
                    name = "CMakeLists"
                }
            },
            override_by_extension = {
                ["cu"] = {
                    icon = "󰮄",
                    color = "#81e043",
                    name = "Cuda"
                },
                ["cuh"] = {
                    icon = "",
                    color = "#81e043",
                    name = "Cuda"
                }
            }
        }
    end
}}

-- close_command = function(n)