require File.join(File.dirname(__FILE__), "..", "lib", "lstrip_on_steroids")

describe String do
  describe "#-@" do
    it "removes whitespace" do
      string = -%{
        foo
          bar
        baz
      }
      
      string.should == "foo\n  bar\nbaz"
    end

    it "handles indented first lines" do
      string = -%{
          foo
        bar
          baz
      }
      
      string.should == "  foo\nbar\n  baz"
    end
    
    it "handles lines with really long indents" do
      # In case we do the space removal naively
      
      string = -%{
        foo
                  bar
        baz
      }
      
      string.should == "foo\n          bar\nbaz"  
    end
    
    it "works with heredoc strings" do
      string = -<<-end
        foo
          bar
        baz
      end
      
      string.should == "foo\n  bar\nbaz"
    end
  end
end
