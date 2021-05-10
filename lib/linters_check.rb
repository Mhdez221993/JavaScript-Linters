class Linter_check
    attr_reader :file, :buffer, :lines, :errors
    def initialize(path)
        @path = path
        @lines = IO.readlines(@path)
        @errors = []
        run_check     
    end

    def run_check 
        
    end

    def check_indentation
        @ind = 0
        @lines.each_with_index do |line, i|
            @line_ind= 0
            line_arr = line.split("")
            line_arr.each do |x|
                break if x!= " "
                @line_ind += 1
            end   
            if line[i-1] && line[i-1].match("{\n")
                @ind +=2
            elsif line[i-1] && line[i-1].match("}")
                @ind -=2
            end
            if @ind != @line_ind
            @errors << "Indentation error on line #{i+1}"
            end
        end
    end

        # check if there is a space before new line
    def check_space_trailing 
        @lines.each_with_index do |line, i|
            line_arr = line.split("")
            @errors << "You have white space at the end of the line #{i}" if line_arr[-2] == " "
        end
    end

    def check_new_lines

    end

    def check_tags

    end

end   


varbla = Linter_check.new("js_test.js")
# buffer = StringScanner.new(varbla.lines[0])
# p buffer
varbla.check_space_trailing 
p varbla.errors