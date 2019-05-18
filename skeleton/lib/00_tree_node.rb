require 'byebug'

class PolyTreeNode
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent
    @parent
  end

  def children
    @children  
  end

  def value
    @value
  end

  def parent=(node)
    if @parent.nil?
      node.children << self
      @parent = node
    elsif node.nil?
      @parent = nil
    elsif node.children.none?(self)
      @parent.children.reject! { |ele| ele == self }
      @parent = node
      @parent.children << self
    end
  end

  def add_child(child_node)
    #debugger
    if @children.none?(child_node)
      child_node.parent = self
      # @children << child_node 
    else
      
    end
  end

  def remove_child(child_node)
    if @children.include?(child_node)
      child_node.parent = nil
      @children.reject! {|ele| ele == child_node}
    else
      raise "Node is not a Child" 
    end

  end

  def dfs(target_value)
    depth_stack = []
    if @value == target_value
      return self
    else
      to_stack = 
      @children.each {|child| dfs(target_value) }
    end

  end

  def bfs(target_value)

  end

  



  # def inspect
  #   p "value: #{@value}"
  #   p "parent: #{@parent}"
  #   p "children #{@children}"
  # end

end