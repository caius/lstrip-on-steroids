# lstrip-on-steroids

In [another][engorge] late night discussion in the [#nwrug][] IRC room, [Ashley Moran][AM] was after sane indent-aware multiline strings for his cucumber scenario's.

[engorge]: http://github.com/caius/engorge-ostruct
[#nwrug]: http://nwrug.org/
[AM]: http://www.patchspace.co.uk/

As of v0.9.5 you can use either Strings (`''`, `""`, `%{}`, etc) or HEREDOCs (`<<-EOF\nEOF`) with the leading `-` to have the shitespace stripped. *('Shitespace' was coined by Caius in [this tweet][shitespace].)*

[shitespace]: https://twitter.com/Caius/status/21600277885

## Installation

	$ sudo gem install lstrip-on-steroids

And then in your code:

	require "lstrip_on_steroids"

## Examples & Usage

For example, the following story reads ok, but you end up with extra shitespace at the start of each line:

	Scenario: Fake thing happens
	  When I do something
	  Then I should see %{
	    someone
	    did
	    something
	  }

The problem is, this gets an extra two spaces at the start of each line. You want it to be the string `"  someone\n  did\n  something"`, but you end up with `"\n    someone\n    did\n    something\n  "`.

The current solution is to delete the indent in the string:

	Scenario: Fake thing happens
	  When I do something
	  Then I should see %{
	someone
	did
	something
	}

But that just looks horrible, and you've amended your story to fit the code (kinda.)

Luckily, you can automatically work out just the right amount of whitespace you want to be removed from each line, so with a bit of jiggery pokery, you can have your cake and eat it too. (The cake is not a lie.)

Seeing as `String#-@` isn't defined already, this gem defines that for it, so you just prepend your multiline string with `-` to have it automagically strip the shitespace and leave the rest of your whitespace a-ok. So you end up with:

	Scenario: Fake thing happens
	  When I do something
	  Then I should see -%{
	    someone
	    did
	    something
	  }

which gives you back `"  someone\n  did\n  something"`, exactly what we want!

*If you're not used to see `%{}` used to create strings, check out the [Ruby Shortcuts][rs] post on [CaiusTheory][ct] for an explanation of it and more!*

[rs]: http://caiustheory.com/ruby-shortcuts
[ct]: http://caiustheory.com/

## Licence

> The MIT License
> 
> Copyright (c) 2010 Caius Durling <dev@caius.name>
> Contributions by Ashley Moran <ashley.moran@patchspace.co.uk>
> 
> Permission is hereby granted, free of charge, to any person obtaining a copy
> of this software and associated documentation files (the "Software"), to deal
> in the Software without restriction, including without limitation the rights
> to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> copies of the Software, and to permit persons to whom the Software is
> furnished to do so, subject to the following conditions:
> 
> The above copyright notice and this permission notice shall be included in
> all copies or substantial portions of the Software.
> 
> THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
> AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> THE SOFTWARE.

