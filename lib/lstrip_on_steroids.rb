module LStripOnSteroids
  class JuicedStripper
    def initialize(lines)
      @lines = lines
      strip_bare_top_and_bottom
    end
    
    def strip
      @lines.map { |line|
        line.sub(/^ {#{whitespace_trim_length}}/, "")
      }
    end
    
    private
    
    def whitespace_trim_length
      @whitespace_trim_length ||= @lines.map { |line| indent_size(line) }.min
    end
    
    def strip_bare_top_and_bottom
      [0, -1].each { |i| @lines.delete_at(i) if bare?(@lines[i]) }
    end
    
    def indent_size(line)
      line.match(/^ */)[0].length
    end
    
    def bare?(line)
      line =~ /^ *$/
    end
  end
  
  def -@
    JuicedStripper.new(split("\n")).strip.join("\n")
  end
end

String.__send__(:include, LStripOnSteroids)
