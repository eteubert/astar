require "algorithms"

module Astar
  
  def self.run(start, goal)
    closed = []
    open = Containers::PriorityQueue.new
    openSet = []
    open.push(start, 0)
    openSet << start

    begin
      currentNode = open.pop
      return if currentNode == goal

      currentNode.edges.each do |edge|
        successor = currentNode.follow(edge)
        next if closed.include? successor

        g_score = currentNode.g_score + edge.weight
        next if openSet.include? successor && g_score >= successor.g_score
        successor.predecessor = currentNode
        successor.g_score = g_score

        f_score = g_score + self::h(successor, goal)
        unless openSet.include? successor
          open.push(successor, -f_score)
          openSet << successor
        end

      end

      closed << currentNode
    end until open.empty?
  end
  
  def self.h(node1, node2)
    0
  end
  
end

require "astar/node"
require "astar/edge"
