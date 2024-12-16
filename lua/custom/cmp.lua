local cmp = require 'cmp'
local luasnip = require 'luasnip'
luasnip.config.setup {}
local options = {

  -- See `:help cmp`

  cmp.setup {
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    completion = { completeopt = 'menu,menuone,noinsert' },

    -- For an understanding of why these mappings were
    -- chosen, you will need to read `:help ins-completion`
    -- No, but seriously. Please read `:help ins-completion`, it is really good!
    --
    mapping = {
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-Down>'] = cmp.mapping.scroll_docs(-4),
      ['<C-Up>'] = cmp.mapping.scroll_docs(4),
      ['<C-e>'] = cmp.mapping.close(),
      ['<C-y>'] = cmp.mapping.confirm { select = true },
      ['<Up>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
      ['<Down>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
      ['<C-k>'] = cmp.mapping {
        i = function()
          if cmp.visible() then
            cmp.abort()
          else
            cmp.complete()
          end
        end,
        c = function()
          if cmp.visible() then
            cmp.close()
          else
            cmp.complete()
          end
        end,
      },
      ['<CR>'] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = false,
      },
    },
    sources = {
      {
        name = 'lazydev',
        -- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
        group_index = 0,
      },
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'path' },
    },
  },
}
return options
