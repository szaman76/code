require_relative "item"
class List

    attr_accessor :label
    # def label=(new_label)
    #     @label = new_label
    # end
    
    def initialize(label)
        @label = label
        @items = []
    end


    def add_item(title, deadline, description = "")
        return false if !Item.valid_date?(deadline)
        @items << Item.new(title,deadline,description)
        true
    end

    def size
        @items.length
    end

    def valid_index?(index)
        return false if index < 0
        return false if index > self.size - 1
        true
    end

    def swap(index_1, index_2)
        return false if !valid_index?(index_1) || !valid_index?(index_2)
        @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
        true
    end

    def [](index)
       return nil if !valid_index?(index)
       @items[index]
    end

    def priority
        @items.first
    end

    def print
        puts "------------------------------------------"
        puts "                #{self.label.upcase}                 "
        puts "------------------------------------------"
        puts "Index | Item       | Deadline       | Done"
        puts "------------------------------------------"
        @items.each_with_index do |el,idx|
            puts "#{idx}     | #{el.title} |#{el.deadline}        |#{el.done}"
        end
        puts "------------------------------------------"
    end

    def print_full_item(index)
        return if !valid_index?(index)
        puts "------------------------------------------"
        puts "#{@items[index].title}       #{@items[index].deadline}      |#{@items[index].done}"
        puts @items[index].description
        puts "------------------------------------------"
    end

    def print_priority
        print_full_item(0)
    end

    def up(index,amount = 1)
        return false if !valid_index?(index)
        while amount > 0 && index != 0
            swap(index,index - 1)
            index -= 1
            amount -= 1
        end
        true
    end

    def down(index,amount = 1)
        return false if !valid_index?(index)
        while amount > 0 && index != size - 1
            swap(index,index + 1)
            index += 1
            amount -= 1
        end
        true
    end

    def sort_by_date!
        @items.sort_by! {|item| item.deadline}
    end

    def toggle_item(index)
        item = self[index]
        #do it when item is not nill
        item.toggle if !item.nil?
    end

    def remove_item(index)
        return false if !valid_index?(index)
        @items.delete_at(index)
        true
    end

    def purge
        @items.delete_if(&:done)
    end

end


