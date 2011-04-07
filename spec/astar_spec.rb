require "astar"

describe Astar do
  
  describe Astar::Node do
    it "should have a name" do
      n1 = Astar::Node.new("Node 1")
      n1.name.should == "Node 1"
    end
  end
  
  describe Astar::Edge do
    it "should connect two nodes" do
      n1 = Astar::Node.new("N1")
      n2 = Astar::Node.new("N2")
      e1 = Astar::Edge.new(n1, n2, 5)
      
      e1.weight.should == 5
      e1.nodes.first.should == n1
      e1.nodes.last.should == n2
      e1.nodes.count.should == 2
    end
  end
  
  describe "Algorithm" do
    it "should run for the example" do
      #         e4
      #      n4 -- n5
      #  e3 /         \ e5
      #   n1 -- n2 -- n3
      #      e1    e2
      n1 = Astar::Node.new("N1")
      n2 = Astar::Node.new("N2")
      n3 = Astar::Node.new("N3")
      n4 = Astar::Node.new("N4")
      n5 = Astar::Node.new("N5")

      e1 = n1.connectWith(n2, 1)
      e2 = n2.connectWith(n3, 7)
      e3 = n1.connectWith(n4, 2)
      e4 = n4.connectWith(n5, 2)
      e5 = n5.connectWith(n3, 2)
      
      Astar::run(n1, n3)
      n3.path.reverse.map(&:name).join(" -> ").should == "N1 -> N4 -> N5 -> N3"
    end
    
    it "should accept an heuristic" do
      module Astar
        class Node
          # add coordinates
          attr_accessor :x, :y
          
          def connectWithAndCalcWeightFromCoordinates(node)
            weight = Math.sqrt(((node.x - self.x) ** 2).abs + ((node.y - self.y) ** 2).abs)
            connectWith(node, weight)
          end
          
        end
      end
      #         e4
      #      n4 -- n5
      #  e3 /         \ e5
      #   n1 -- n2 -- n3
      #      e1    e2
      n1 = Astar::Node.new("N1")
      n1.x = 0
      n1.y = 0
      n2 = Astar::Node.new("N2")
      n2.x = 2
      n2.y = -3
      n3 = Astar::Node.new("N3")
      n3.x = 4
      n3.y = 0
      n4 = Astar::Node.new("N4")
      n4.x = 1
      n4.y = 1
      n5 = Astar::Node.new("N5")
      n5.x = 3
      n5.y = 1

      e1 = n1.connectWithAndCalcWeightFromCoordinates(n2)
      e2 = n2.connectWithAndCalcWeightFromCoordinates(n3)
      e3 = n1.connectWithAndCalcWeightFromCoordinates(n4)
      e4 = n4.connectWithAndCalcWeightFromCoordinates(n5)
      e5 = n5.connectWithAndCalcWeightFromCoordinates(n3)
      
      heuristic = Proc.new do |node1, node2|
        # pythagoras
        Math.sqrt(((node2.x - node1.x) ** 2).abs + ((node2.y - node1.y) ** 2).abs)
      end
      
      Astar::run(n1, n3, heuristic)
      n3.path.reverse.map(&:name).join(" -> ").should == "N1 -> N4 -> N5 -> N3"
    end
  end
  
end