return {
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", ":<C-U>TmuxNavigateLeft<CR>" },
      { "<c-j>", ":<C-U>TmuxNavigateDown<CR>" },
      { "<c-k>", ":<C-U>TmuxNavigateUp<CR>" },
      { "<c-l>", ":<C-U>TmuxNavigateRight<CR>" },
      { "<c-\\>", ":<C-U>TmuxNavigatePrevious<CR>" },
    },
  },
}
