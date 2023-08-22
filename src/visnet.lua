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

local json = require('json')
local node = require('visnet.node')
local edge = require('visnet.edge')
local optset = require('visnet.optset')


    local _M = { node = node, edge = edge }
    local mt = { __index = {} }



    local function dumpdata(t, indent)
      local indent=indent or ''
         for key,value in pairs(t) do
           io.write(indent,'[',tostring(key),']')
           if type(value)=="table" then io.write(':\n') dumpdata(value,indent..'\t')
             else io.write(' = ',tostring(value),'\n') end
         end
    end 

    ---
    -- 
    function _M.new()
        local object = setmetatable({ nodes = {} , edges = {}, options = {}  },  mt)
    return object
    end


    function mt.__index:addEdge(e)
        table.insert(self.edges, e.edge_t)
    end

    function mt.__index:dump()
        dumpdata(self.options)
        dumpdata(self.nodes)
        dumpdata(self.edges)
    end

    function mt.__index:setOption(key, value)
        self.options = optset.updateOptions(self.options, key, value)
        --self.options[key] = value
    end


    function mt.__index:edgeGroupMembers(group)
        local g_tmp = {}
        for k, n in pairs(self.nodes) do
            if n.group == group then
                table.insert(g_tmp, k)
            end
            -- connect all members of a group with edges, useful to give the graph some structure
            -- create self.groups and add nodes to iterate over
        end
        for i, nid in ipairs(g_tmp) do
            for i2, nid2 in ipairs(g_tmp) do
              if nid ~= nid2 then
                local e = {
                    from = nid,
                    to = nid2 }
                table.insert(self.edges, e)
              end
            end
        end
     end


    function mt.__index:getGroup(group)
        local g = {}
        for k,v in pairs(self.nodes) do
            if(v.group == group) then
                --g[v.id] = v
                table.insert(g, v)
            end
        end
    return g
    end

    function mt.__index:addNode(n)
        table.insert(self.nodes, n.node_t)
    end

    function mt.__index:nodesAsJson()
        return json.encode(self.nodes)
    end

    function mt.__index:edgesAsJson()
        print(json.encode(self.edges))
    end

    function mt.__index:asJson()
        local t = { nodes = self.nodes, edges = self.edges, options = self.options }
        return json.encode(t) 
    end

    function mt.__index:dataAsJson()
        local t = { nodes = self.nodes, edges = self.edges }
        return json.encode(t) 
    end

    function mt.__index:writeJsonToFile(filename)
        local file = io.open(filename, "w")
        if file then
           file:write(self:asJson())
           file:close()
        else
           error("Can't write file.")
        end
    end

return _M


