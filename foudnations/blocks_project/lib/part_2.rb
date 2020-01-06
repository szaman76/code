require "byebug"

def all_words_capitalized?(array)
    array.all?{|ele| ele == ele.capitalize}
end

def no_valid_url?(array)
    array.none?{|ele| ele.end_with?(".com",".net",".io",".org")}
end

def any_passing_students?(array)
    array.any?{|ele| ele[:grades] / ele[:grades].length > 75}
end


p any_passing_students?([
    { name: "Alice", grades: [60, 68] },
    { name: "Bob", grades: [20, 100] }
  ])