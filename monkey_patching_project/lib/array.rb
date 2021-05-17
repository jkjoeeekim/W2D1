# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        self.length > 0 ? self.max - self.min : nil
    end

    def average
        self.length > 0 ? self.sum / self.length.to_f : nil
    end

    def median
        return nil if self.length < 1
        sorted = self.sort
        if self.length % 2 == 0
            [sorted[(sorted.length / 2)], sorted[((sorted.length / 2) - 1)]].average
        else
            sorted[(sorted.length / 2)]
        end
    end

    def counts
        hash = Hash.new { |hash, key| hash[key] = 0 }
        self.each { |ele| hash[ele] += 1 }
        hash
    end

    def my_count(value)
        count = 0
        self.each { |ele| count += 1 if ele == value }
        count
    end

    def my_index(value)
        self.each_with_index { |ele, idx| return idx if ele == value }
        nil
    end

    def my_uniq
        uniq_array = []
        self.each { |ele| uniq_array << ele unless uniq_array.include?(ele) }
        uniq_array
    end

    def my_transpose
        transposed_array = Array.new(self[0].length) { Array.new(self.length) }
        self.each_with_index do |arr, idx1|
            arr.each_with_index do |ele, idx2|
                transposed_array[idx2][idx1] = ele
            end
        end
        transposed_array
    end
end
