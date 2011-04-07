module Astar
  
  class Node
    attr_accessor :g_score, :h_score, :edges, :predecessor, :name

    def initialize(name = "node")
      @name = name
      @edges = []
      @predecessor = nil
      @g_score = 0
    end

    def <<(edge)
      @edges << edge
    end

    # create an edge to connect two nodes
    def connectWith(node, weight = 0)
      edge = Edge.new(self, node, weight)
      @edges << edge

      edge
    end

    # return node on the other side of the edge
    def follow(edge)
      if edge.nodes.first == self
        edge.nodes.last
      else
        edge.nodes.first
      end
    end

    def path
      path = [self]

      while predecessor = path.last.predecessor
        path << predecessor
      end

      path
    end  
  end
  
end