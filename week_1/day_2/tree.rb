#!/usr/bin/ruby
# frozen_string_literal: true

# A simple Tree class
# class Tree
#   attr_accessor :children, :node_name

#   def initialize(name, children = [])
#     @children = children
#     @node_name = name
#   end

#   def visit_all(&block)
#     visit(&block)
#     children.each { |c| c.visit_all(&block) }
#   end

#   def visit(&block)
#     block.call self
#   end
# end

# Tree is just a recursive data structure
class TreeNode
  attr_accessor :node_name, :children

  def initialize(name, children = [])
    @children = children
    @node_name = name
  end

  def visit_all(&block)
    visit(&block)
    children.each { |c| c.visit_all(&block) }
  end

  def visit(&block)
    block.call self
  end
end

# Enhanced Tree implementation
class Tree
  attr_accessor :root

  def initialize(tree)
    @root = TreeNode.new(tree.keys[0], [])
    tree.each do |_key, children|
      insert(@root, children)
    end
  end

  def insert(parent, children)
    return if children.empty?

    children.each do |key, value|
      tree_node = TreeNode.new(key, [])
      parent.children.push(tree_node)
      insert(tree_node, value)
    end
  end

  def visit_all(&block)
    visit(&block)
    children.each { |c| c.visit_all(&block) }
  end

  def visit(&block)
    block.call self
  end

  def node_name
    root.node_name
  end

  def children
    root.children
  end
end

tree_description = { 'grandpa' => {
  'dad' => { 'me' => { 'buzik' => {} }, 'sister' => {} },
  'uncle' => { 'cousin1' => {}, 'cousin2' => {} }
} }

tree = Tree.new(tree_description)
puts 'Visiting a node'
tree.visit { |node| puts node.node_name }
puts

puts 'Visiting entire tree'
tree.visit_all { |node| puts node.node_name }
