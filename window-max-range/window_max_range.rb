def naive_windowed_max_range(array, window_size)
    current_max_range = 0

    (0..array.length - window_size).each do |i|
        temp_array = array[i...i + window_size]
        range = temp_array.max - temp_array.min
        current_max_range = range if range > current_max_range
    end
        
    current_max_range
end

# time complexity is quadratic, O(n^2)

# p naive_windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
# p naive_windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# p naive_windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# p naive_windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

class MyQueue
    def initialize
        @store = []
    end

    def enqueue(el)
        @store << el
    end

    def dequeue
        @store.shift
    end

    def peek
        @store.first
    end

    def size
        @store.length
    end

    def empty?
        @store.empty?
    end
end

class MyStack
    def initialize
        @store = []
    end

    def push(el)
        @store << el
    end
    
    def pop
        @store.pop
    end
    
    def peek
        @store.last
    end

    def size
        @store.length
    end

    def empty?
        @store.empty?
    end
end

class StackQueue
    def initialize
        @store = MyStack.new
    end

    def size
        @store.length
    end

    def empty?
        @store.length == 0
    end

    def enqueue
        
    end

    def dequeue

    end



end