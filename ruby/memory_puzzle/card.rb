class Card

    attr_reader :card_value

    def initialize(card_value)
        @card_value = card_value
        @face_up = true
    end


    def show_card
        if @face_up
            return @card_value
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

    def to_s(ele)

    end

    def ==()

    end

end