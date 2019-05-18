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
    if @children.none?(child_node)
      child_node.parent = self
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
    # p "Current Node Value: #{value}"
    if value == target_value
      return self
    else
      children.each do |child| 
        res = child.dfs(target_value) 
        return res unless res.nil? 
      end
    end
    nil
  end

  def bfs(target_value)
    queue = []
    queue << self
    until queue.empty? do
      node = queue.shift
      return node if node.value == target_value
      queue += node.children
    end
    nil
  end

  



  # def inspect
  #   p "value: #{@value}"
  #   p "parent: #{@parent}"
  #   p "children #{@children}"
  # end

end