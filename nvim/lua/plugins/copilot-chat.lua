return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = function(_, opts)
      local prompts_path = vim.fn.stdpath("config") .. "/lua/prompts"
      local custom_prompts = {}

      for name in vim.fs.dir(prompts_path) do
        if name:match("%.lua$") then
          local ok, prompt = pcall(require, "prompts." .. name:sub(1, -5))
          if ok and type(prompt) == "table" then
            custom_prompts = vim.tbl_extend("force", custom_prompts, prompt)
          end
        end
      end

      opts.prompts = vim.tbl_extend("force", opts.prompts or {}, custom_prompts)
    end,
  },
}
