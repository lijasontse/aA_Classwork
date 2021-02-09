class PolyTreeNode

    attr_reader :value, :parent, :children

    def initialize(value = nil)
        @value = value        
        @children = []        
        @parent = nil 
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
        child.parent = self 
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
        self.children.each do |child|
            # if !child.children.empty? 
            # won't run code in the block when array is empty 
                memo = child.dfs(target)                     
                return memo if !memo.nil?
            # end        
        end
        nil       
    end


    
    def bfs(target)
        queue = [self]
        until queue.empty?
            node = queue.shift 
            return node if node.value == target 
            queue += node.children
        end
    end
#     should take correct path to descendant (FAILED - 19)
#     behaves like search method
#       should return itself if it contains the value (FAILED - 20)
#       should find descendant (FAILED - 21)
#       should return nil when value is not found (FAILED - 22)

end
