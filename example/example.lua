package.path = package.path .. ";../src/?.lua"


local visnet = require("visnet")

local graph = visnet.new()
      graph:setOption("layout.improvedLayout", true)
      graph:setOption("edges.smooth.enabled", false)
      graph:setOption("nodes.shape", "dot")
      graph:setOption("nodes.borderWidth", 0)
      graph:setOption("nodes.font.color", "#fff")

local n1 = visnet.node.new(1, "testnode")
      n1:setGroup("someg")
      n1:setTitle("best node ever")
      n1:setValue(40)

local n2 = visnet.node.new("mc", "another node")
      n2:setGroup("someg")
      n2:setTitle("best node ever")
      n2:setValue(40)

local n3 = visnet.node.new("n3", "a new node")
      n3:setGroup("another")
      n3:setTitle("From other Group")
      n3:setValue(40)

local n4 = visnet.node.new("n4", "node n4")
      n4:setGroup("group3")
      n4:setValue(40)

local n5 = visnet.node.new("n5", "node n5")
      n5:setGroup("group3")
      n5:setValue(40)

      graph:addNode(n1)
      graph:addNode(n2)
      graph:addNode(n3)
      graph:addNode(n4)
      graph:addNode(n5)


local e1 = visnet.edge.new(1, "mc")
      e1:setArrows("from");

local e2 = visnet.edge.new(1, "n3")
      e2:setArrows("from;to");

local e3 = visnet.edge.new("n3", "n5")

      graph:addEdge(e1)
      graph:addEdge(e2)
      graph:addEdge(e3)


      --dumpdata(graph:getGroup("someg"))
      --graph:dump()
      print(graph:asJson())
      --print(graph:dataAsJson())
      --graph:writeJsonToFile("g.json")
