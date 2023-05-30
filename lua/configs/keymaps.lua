local wk = require("which-key")
-- As an example, we will create the following mappings:
--  * <leader>ff find files
--  * <leader>fr show recent files
--  * <leader>fb Foobar
-- we'll document:
--  * <leader>fn new file
--  * <leader>fe edit file
-- and hide <leader>1

wk.register(
    {
        f = {
            name = "file", -- optional group name
            --    f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
            --    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=false, buffer = 123 }, -- additional options for creating the keymap
            --    n = { "New File" }, -- just a label. don't create any mapping
            --    e = "Edit File", -- same as above ["1"] = "which_key_ignore",  -- special label to hide it in the popup
            --    b = { function() print("bar") end, "Foobar" } -- you can also pass functions!
            f = { "<cmd>Telescope find_files<cr>", "find file" },
            g = { "<cmd>Telescope live_grep<cr>", "live grep" },
            b = { "<cmd>Telescope buffers<cr>", "find buffers" },
            h = { "<cmd>Telescope help_tags<cr>", "find tags" },
            k = { "<C-o>", "prev file" },
            j = { "<C-i>", "next file" },
        },
        g = {
            name = "debug ",
            x = {"<cmd>TroubleToggle<cr>", "TroubleToggle"},
            w = {"<cmd>TroubleToggle workspace_diagnostics<cr>", "TroubleToggle workspace_diagnostics"},
            d = {"<cmd>TroubleToggle document_diagnostics<cr>", "TroubleToggle document_diagnostics"},
            l = {"<cmd>TroubleToggle loclist<cr>", "TroubleToggle loclist"},
            q = {"<cmd>TroubleToggle quickfix<cr>", "TroubleToggle quickfix"},
            R = {"<cmd>TroubleToggle lsp_references<cr>", "TroubleToggle lsp_references"},
        },
        w = {
            a = "add_workspace_folder",
            r = "remove_workspace_folder",
            l = "list_workspace_folders",
        },
        D = {"type_definition"},
        r = {
            name = "refactor",
            n = "rename",
        },
        F = {"lsp async"},
        e = {"vim.diagnostic.open_float"},
        q = {"vim.diagnostic.setloclist"},
        o = {"<cmd>only<cr>", "only window"},
        j = {"<C-w>j", "bottom window"},
        k = {"<C-w>k", "up window"},
        h = {"<C-w>h", "right window"},
        l = {"<C-w>l", "left window"},
    },
    {
        prefix = "<leader>",
        -- mode = "n", -- NORMAL mode
        -- prefix = "",
        -- buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        -- nowait = false, -- use `nowait` when creating keymaps
        -- expr = false, -- use `expr` when creating keymaps
    }
)

wk.register(
    {
        D = {"goto declaration"},
        d = {"goto definition"},
        i = {"goto implementation"},
        r = {"goto references"},
    },
    {
        prefix = "g",
        -- mode = "n", -- NORMAL mode
        -- prefix = "",
        -- buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        -- nowait = false, -- use `nowait` when creating keymaps
        -- expr = false, -- use `expr` when creating keymaps
    }
)

wk.register(
    {
        d = {"goto prev"},
    },
    {
        prefix = "[",
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
    }
)

wk.register(
    {
        d = {"goto next"},
    },
    {
        prefix = "]",
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
    }
)


local opt = { noremap = true, silent = true }
vim.keymap.set("i", "jj", "<esc>", opt)

--            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
--            vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
