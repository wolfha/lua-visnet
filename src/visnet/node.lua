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
    
    function _M.new(id, label)
        local object = setmetatable({ node_t = { id = id, label = label} },  mt)
    return object
    end

    function mt.__index:setGroup(group)
        self.node_t["group"] = group
    end

    function mt.__index:setTitle(title)
          self.node_t["title"] = title
    end

    function mt.__index:setValue(value)
          self.node_t["value"] = value
    end

    function mt.__index:setOption(key, value)
          self.node_t = optset.updateOptions(self.node_t, key, value)
    end

    function mt.__index:get()
        return self.node_t
    end

return _M
