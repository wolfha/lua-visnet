package.path = "../src/?.lua;"..package.path


local visnet = require("visnet")

local graph = visnet.new()
      graph:setOption("layout.improvedLayout", true)
      graph:setOption("edges.smooth.enabled", false)
      graph:setOption("nodes.shape", "dot")
      graph:setOption("nodes.borderWidth", 0)
      graph:setOption("nodes.font.color", "#fff")

local n1 = visnet.node.new("n1", "testnode")
      n1:setGroup("group1")
      n1:setTitle("best node ever")
      n1:setValue(40)

local n2 = visnet.node.new("n2", "another node")
      n2:setGroup("group1")
      n2:setTitle("best node ever")
      n2:setValue(40)

local n3 = visnet.node.new("n3", "a new node")
      n3:setGroup("group2")
      n3:setTitle("From other Group")
      n3:setValue(40)

local n4 = visnet.node.new("n4", "node n4")
      n4:setGroup("group3")
      n4:setValue(40)

local n5 = visnet.node.new("n5", "node n5")
      n5:setGroup("group3")
      n5:setValue(40)

local n6 = visnet.node.new("n6", "node n6")
      n6:setGroup("group3")

local n7 = visnet.node.new("n7", "node n7")
      n7:setGroup("group3")


      graph:addNode(n1)
      graph:addNode(n2)
      graph:addNode(n3)
      graph:addNode(n4)
      graph:addNode(n5)
      graph:addNode(n6)
      graph:addNode(n7)


local e1 = visnet.edge.new(n1, n2)
      e1:setArrows("from");

local e2 = visnet.edge.new(n1, n3)
      e2:setArrows("from;to");

local e3 = visnet.edge.new(n3, n4)
local e4 = visnet.edge.new(n3, n5)
local e5 = visnet.edge.new(n3, n6)
local e6 = visnet.edge.new(n3, n7)

        graph:addEdge(e1)
        graph:addEdge(e2)
        graph:addEdge(e3)
        graph:addEdge(e4)
        graph:addEdge(e5)
        graph:addEdge(e6)


      -- you may dump the data to screen for debugging purposes
      --graph:dump()

      -- get everything as a json string
      local json_string = graph:asJson()
      print(json_string)

      -- you can also write the json to file directly
      --graph:writeJsonToFile("g.json")
