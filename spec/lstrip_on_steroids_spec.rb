require File.join(File.dirname(__FILE__), "..", "lib", "lstrip_on_steroids")

describe String do
  describe "#-@" do
    it "doesn't alter an empty string" do
      (-"").should eq ""
    end

    it "removes whitespace from a single line" do
      (-" foo").should eq "foo"
    end

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

    it "handles empty lines in the middle" do
      string = -%{
        foo

        baz
      }

      string.should == "foo\n\nbaz"
    end

    it "handles whitespace-only lines in the middle" do
      original_string = %{
        foo

        baz
      }.sub("\n\n", "\n \n")

      (-original_string).should == "foo\n\nbaz"
    end

    it "removes blank lines from the end" do
      original_string =
        "    foo\n" +
        "       \n" +
        "       \n"

      (-original_string).should == "foo"
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
