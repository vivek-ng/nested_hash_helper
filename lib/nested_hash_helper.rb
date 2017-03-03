require "nested_hash_helper/version"

class Hash
  # Your code goes here...
def deep_except(*excluded_keys)
  current_class = self.class
  self.each do |current_keys , current_value|
  	if excluded_keys.include?(current_keys)
  		 self.delete(current_keys)
  		 next
  		end
  		if current_value.is_a?(current_class)
  			current_value.deep_except(*excluded_keys)
  	    end
  	end
  	end

def deep_delete_empty
	current_class = self.class
	self.each do |current_keys , current_value|
       if current_value.nil? || current_value.empty?
       	  self.delete(current_keys)
       	  next
       end	
       if current_value.is_a?(current_class)
       	    current_value.deep_delete_empty
       end	
	end
end

def find_depth
	  maxx_depth = 1
	  current_depth = 1
	  self._find_depth(maxx_depth , current_depth)
end

def _find_depth(maxx_depth , current_depth)
	current_class = self.class
	self.each do |current_keys , current_value |
		if current_value.is_a?(current_class)
			maxx_depth  = current_value._find_depth(maxx_depth , current_depth + 1)
		end
	end
	maxx_depth = (maxx_depth > current_depth)? maxx_depth : current_depth
end

end


