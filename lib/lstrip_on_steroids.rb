module LStripOnSteroids
  def -@
    # Split into lines so we can process them
    lines = self.split("\n")
    # Lose the first line (it's empty anyway)
    lines.delete_at(0)
    # Grab the last line, which should just contain spaces
    leading_whitespace = lines.delete_at(-1)
    # Strip leading_whitespace from each line and join into one again
    lines.map do |l|
      i = leading_whitespace.length
      l[/^ {#{i}}/] = "" if l[/^ {#{i}}/]
      l
    end.join("\n")
  end
end

String.__send__(:include, LStripOnSteroids)
