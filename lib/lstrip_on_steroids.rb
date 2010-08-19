module LStripOnSteroids
  def -@
    lines = split("\n")[1...-1]
    leading_whitespace = lines.map { |line| line.match(/^ */)[0].length }.min
    lines.map { |line|
      line.sub(/^ {#{leading_whitespace}}/, "")
    }.join("\n")
  end
end

String.__send__(:include, LStripOnSteroids)
