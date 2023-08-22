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

local optset = require 'visnet.optset'


local _M = {}
local mt = { __index = { } }
    
    function _M.new(from, to)
        local object = setmetatable({ edge_t = { from = from, to = to } },  mt)
    return object
    end

    function mt.__index:setArrows(arrow)
        self.edge_t["arrows"] = arrow;
    end

    function mt.__index:setOption(key, value)
          self.edge_t = optset.updateOptions(self.edge_t, key, value)
    end

    function mt.__index:get()
        return self.edge_t
    end

return _M
