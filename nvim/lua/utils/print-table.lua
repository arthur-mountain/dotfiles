local function printTable(tf)
  local cache = {}

  local function sub_printTable(t, indent)
    local st = tostring(t)
    if cache[st] then
      print(indent .. "*" .. st)
    else
      cache[st] = true
      if type(t) == "table" then
        for pos, val in pairs(t) do
          if type(val) == "table" then
            print(indent .. "[" .. pos .. "] => " .. st .. " {")
            sub_printTable(val, indent .. string.rep(" ", string.len(pos) + 8))
            print(indent .. string.rep(" ", string.len(pos) + 6) .. "}")
          elseif type(val) == "string" then
            print(indent .. "[" .. pos .. '] => "' .. val .. '"')
          else
            print(indent .. "[" .. pos .. "] => " .. st)
          end
        end
      else
        print(indent .. st)
      end
    end
  end

  if type(tf) == "table" then
    print(tostring(tf) .. " {")
    sub_printTable(tf, "  ")
    print("}")
  else
    sub_printTable(tf, "  ")
  end
end

return printTable
