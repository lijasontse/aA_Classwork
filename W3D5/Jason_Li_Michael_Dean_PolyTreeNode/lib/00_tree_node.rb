class PolyTreeNode

    attr_reader :value, :parent, :children

    def initialize(value, parent=nil)
        @value = value        
        @children = []        
        @parent.nil? ? @parent = nil : @parent = Hash.new(){|h, k| h[parent] = @children}        
   # { parent => [value] } |h, k| h[k] = []

   
    end


    def parent=(node)  
        # { parent => [value] } |h, k| h[k] = [] 
        #copy the file, check to see if the new folder has an identical version of it
        #if not then move it, 
        #delete it from the parent if the parent is not nil
       
        if @parent != nil
            @parent.children.delete(self)# am i in a folder? then delete me from it
        end
        @parent = node #this @parent is modified put me in a new folder
        unless node.nil?
            if !node.children.include?(self)   #if therer is a copy of me then dont put me in and i cese to exist
                node.children << self
            end
        end
    end


    def add_child(child)
        if !self.children.include?(child)
            @children << child
            child.parent = self 
        end
        # should pass itself to the child's parent= (FAILED - 11)
        # doesn't add the child twice (FAILED - 12)
    end
    
    def remove_child(child)

        if !self.children.include?(child)
            raise "Does not include child"
        end

        child.parent = nil 
        # should pass nil to the child's parent= (FAILED - 13)
        # should raise an error if node is not a child (FAILED - 14)
    end


    def dfs(target)
        return self if self.value == target 
        return nil if self.children.empty?
        mid_idx = @children.length / 2
        left_children = @children[0...mid_idx]
        right_children = @children[mid_idx..-1]


        left_children.each do |child|
            puts value
            child.dfs(target)
        end

        right_children.each do |child|
            puts value
            child.dfs(target)
        end


        
        # return nil if @children == [] 
        # return nil if @parent.nil? 
        # self.parent.each do |parent, children|
        #     children.each do |child|
        #         return child.dfs(target)
        #     end
        # end
    end
#     should take correct path to descendant (FAILED - 15)
#     behaves like search method
#       should return itself if it contains the value (FAILED - 16)
#       should find descendant (FAILED - 17)
#       should return nil when value is not found (FAILED - 18)
    def bfs


    end
#     should take correct path to descendant (FAILED - 19)
#     behaves like search method
#       should return itself if it contains the value (FAILED - 20)
#       should find descendant (FAILED - 21)
#       should return nil when value is not found (FAILED - 22)

end
