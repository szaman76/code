require_relative "list"
class TodoBoard

    def initialize
        #@list = List.new(label)
        @list = {}
        #Hash.new {|h,k| h[label] = List.new(label)}
    end

    def get_command
        print "\nEnter a command: "
        cmd, targeted_list, *args = gets.chomp.split(' ')

        case cmd
        when 'mklist'
            @list[targeted_list] = List.new(targeted_list)
        when 'ls'
            @list.keys.each {|label| puts "" + label}
        when 'showall'
            @list.each_value(&:print)
        when 'mktodo'
            @list[targeted_list].add_item(*args)
        when 'up'
            @list[targeted_list].up(*args.map(&:to_i))
        when 'down'
            @list[targeted_list].down(*args.map(&:to_i))
        when 'swap'
            @list[targeted_list].swap(*args.map(&:to_i))
        when 'toggle'
            @list[targeted_list].toggle_item(args[0].to_i)
        when 'rm'
            @list[targeted_list].remove_item(args[0].to_i)
        when 'purge'
            @list[targeted_list].purge
        when 'sort'
            @list[targeted_list].sort_by_date!
        when 'priority'
            @list[targeted_list].print_priority
        when 'print'
            if args.empty?
                @list[targeted_list].print
            else
                @list[targeted_list].print_full_item(args[0].to_i) 
            end
        when 'quit'
            return false
        else
            print "Sorry, that command is not recognized."
        end

        true
    end

    def run
        while true
            return if !get_command
        end
    end



end

TodoBoard.new.run
