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

class MinMaxStack
    def initialize
        @store = []
        @max = 0
        @min = 0
    end

    def push(ele)
        if @store.empty?
            @store << { ele: ele, max: ele, min: ele }
        else
            @store << { ele: ele, max: peek[:max] > ele ? peek[:max] : ele, max: peek[:min] < ele ? peek[:min] : ele }
        end
    end
    
    def pop
        @store.pop[:ele]
    end

    def max
        peek[:max]
    end

    def min
        peek[:min]
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

class MinMaxStackQueue
    def initialize
        @in_stack = MinMaxStack.new
        @out_stack = MinMaxStack.new
        @size = 0
    end

    attr_reader :size

    def empty?
        @size == 0
    end

    def enqueue(ele)
        @in_stack.push(ele)
        @size += 1
    end

    def dequeue
        unless @out_stack.empty? && @in_stack.empty?
            flip if @out_stack.empty? && !@in_stack.empty?
            @out_stack.pop
            @size -= 1
        end
    end
    
    def peek
        @out_stack.peek
    end
    
    def max
        peek[:max]
    end
    
    def min
        peek[:min]
    end
    
    private

    def flip
        @out_stack.push(@in_stack.pop) until @in_stack.empty?
    end
end

def windowed_max_range(array, window_size)
    current_max_range = 0
    queue = MinMaxStackQueue.new

    until array.empty?
        queue.enqueue(array.shift)
        
        if queue.size < window_size
            range = queue.max - queue.min
            current_max_range = range if range > current_max_range
            queue.dequeue
        end
    end

    current_max_range
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
