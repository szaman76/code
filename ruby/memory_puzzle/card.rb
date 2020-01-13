class Card

    attr_reader :value

    def initialize(value, face_up = false)
        @value = value
        @face_up = face_up
    end


    def show_card
        if @face_up
            return @value
        else
            return ""
        end
    end

    def hide
        @face_up = false 
    end

    def reveal
        @face_up = true
    end

    def revealed?
        @face_up
    end

    def to_s
        if revealed?
            value.to_s
        else
            " "
        end
    end

    def ==(other_card)
        @other_card.is_a?(self.class) && other_card.value == value
    end

end