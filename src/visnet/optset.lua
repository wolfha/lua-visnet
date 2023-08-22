--[[
Copyright (c) 2023 Wolfgang Hauptfleisch <dev@augmentedlogic.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
--]]

local _M = {}

    local function split(str, pat)
      local t = {}
      local fpat = "(.-)" .. pat
      local last_end = 1
      local s, e, cap = str:find(fpat, 1)
      while s do
        if s ~= 1 or cap ~= "" then
         table.insert(t,cap)
        end
      last_end = e+1
      s, e, cap = str:find(fpat, last_end)
      end
      if last_end <= #str then
        cap = str:sub(last_end)
        table.insert(t, cap)
      end
      return t
    end

    function _M.updateOptions(t, key, v)
        local p = split(key, "%.")

       if not t[p[1]] then
          if #p == 1 then
             t[p[1]] = v
          else
             t[p[1]] = {}
          end
      end

   if #p >= 2 and not t[p[1]][p[2]] then
      if #p == 2 then
          t[p[1]][p[2]] = v
      else
          t[p[1]][p[2]] = {}
      end
   end

   if #p >= 3 and not t[p[1]][p[2]][p[3]] then
      if #p == 3 then
         t[p[1]][p[2]][p[3]] = v
      else
         t[p[1]][p[2]][p[3]] = {}
      end
   end

   if #p >= 4 and not t[p[1]][p[2]][p[3]][p[4]] then
      if #p == 4 then
         t[p[1]][p[2]][p[3]][p[4]] = v
      else
         t[p[1]][p[2]][p[3]][p[4]] = {}
      end
   end
   return t
end


return _M
