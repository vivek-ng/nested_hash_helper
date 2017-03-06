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

def find_deep_intersection(compare_hash)
	current_class = self.class
	final_hash = current_class.new
    self.each do |current_keys , current_value |
    	if compare_hash.has_key?(current_keys)
    		if current_value.is_a?(current_class) && compare_hash.fetch(current_keys).is_a?(current_class)
               final_hash[current_keys] = current_value.find_deep_intersection(compare_hash.fetch(current_keys))
    	elsif !current_value.is_a?(current_class) && !compare_hash.fetch(current_keys).is_a?(current_class) && (current_value == compare_hash.fetch(current_keys) )
              final_hash[current_keys] = current_value
    	end
    	end
    end
    final_hash
end

def find_deep_keys(value)
  current_class = self.class
  deep_keys = []
    self.each do |current_keys , current_value|
       if !current_value.is_a?(current_class) && current_value == value 
             deep_keys = deep_keys.push(current_keys)
        elsif current_value.is_a?(current_class)
          future_deep_keys = current_value.find_deep_keys(value)
          if future_deep_keys.size >= 1
             deep_keys.push(current_keys)
             deep_keys += future_deep_keys
             return deep_keys
          end
       end
    end
    deep_keys
end

end


