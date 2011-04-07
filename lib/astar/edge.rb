module Astar
  
  class Edge
    
    attr_reader :weight, :nodes

    def initialize(node1, node2, weight)
      @nodes = [node1, node2]
      @weight = weight
    end
    
  end
  
end