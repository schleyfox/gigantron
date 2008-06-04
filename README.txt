= Gigantron: Processor of Data

http://gigantron.rubyforge.org
http://github.com/schleyfox/gigantron

== DESCRIPTION:

Gigantron is a simple framework for the creation and organization of
data processing projects. Data-processing transforms are created as Rake tasks
and data is handled through DataMapper models.

== FEATURES/PROBLEMS:

Features:
* Generates folder/file structure for new DP projects
* Contains generators for both models and tasks

== SYNOPSIS:

Use:

shell> $ gigantron projectname

to generate the project folder and then

shell> $ script/generate model modelname

OR 

shell> $ script/generate task taskname

to add code.

== REQUIREMENTS:

* RubyGems
* RubiGen
* Rake
* DataMapper
* ActiveSupport
* Shoulda

== INSTALL:

sudo gem install gigantron

== HACKING:

Check out the website for a quick overview of how to fiddle with the generators
behind Gigantron. http://gigantron.rubyforge.org.

== LICENSE:

(The MIT License)

Copyright (c) 2008 FIX

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
