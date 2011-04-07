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
  end
  
end