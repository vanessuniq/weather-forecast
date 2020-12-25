class String
    def to_emoji
        case self
        when 'thunderstorm'
            "\u{26A1}"
        when 'light rain'
            "\u{1F326}" 
        when 'rain'
            "\u{2614}" 
        when 'clear sky'
            "\u{1F31E}"
        when 'few clouds'
            "\u{26C5}"
        when 'scattered clouds'
            "\u{1F324}"
        when 'broken clouds'
            "\u{1F325}"
        when 'overcast clouds'
            "\u{2601}" 
        when 'tornado'
            "\u{1F32A}"
        when 'cold'
            "\u{2744}"
        when 'hot'
            "\u{1F525}"
        when 'windy'
            "\u{1F32C}"
        when 'hail'
            "\u{1F30A}"
        else
            "\u{1F30A}" # error
        end
    end
    
end