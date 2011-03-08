# RMU SESSION 6 EXERCISE 3

If in doubt about how to submit, see SUBMISSION_GUIDELINES file.

In this exercise, we'll be exploring Ripper, an arcane and 
mostly undocumented tool in Ruby 1.9's standard library which 
could eventually be used for very interesting thing. Ripper is an
s-expression based Ruby parser that lets you parse Ruby into an
abstract syntax tree which can then be inspected and manipulated. 

    >> require "ripper"
    => true
    >> Ripper::SexpBuilder.new("1 + 1").parse
    => [:program, [:stmts_add, [:stmts_new], 
         [:binary, [:@int, "1", [1, 0]], :+, [:@int, "1", [1, 4]]]]]

Being able to reduce Ruby syntax to raw data in this manner is
powerful, because it makes it possible to analyze the structure
of Ruby programs in ways that would be cumbersome or impossible
at runtime. Combined with a good tool that converts these 
s-expressions back into Ruby code, it would be possible to 
perform AST manipulations in which Ruby syntax is parsed, 
manipulated, reassembled, and then evaluated. 

Unforunately, neither of the tools I've tried for converting 
Ripper style s-expressions back to Ruby have worked with much
success. I have been unable to successfully make use of 
Ripper2Ruby (https://github.com/svenfuchs/ripper2ruby) for all
but the most trivial cases, and Jim Weirich's Sorcerer project
( https://github.com/jimweirich/sorcerer ) seems promising but 
looks to be little more than a short term experiment and 
leaves many hooks unimplemented.

Still, I remain convinced that given enough eyes, we'll be able
to find some interesting uses for Ripper, whether or not we use
it to convert s-expression back into Ruby. There is a lot of
potential for simply building tools that analyze codebases,
and even more room for learning a thing or two about the way
Ruby's syntax operates at a low level just for the learning 
experience.

Thus, your task for this assignment is to explore Ripper, conduct
an interesting experiment, and report back on your findings. The
exact nature of your experiment is for you to decide, but please
follow the guidelines listed below.

## GUIDELINES

* Ripper is an undocumented library with very few resources
  available online describing how to make use of it. With that in
  mind, it's important that as a group you take good notes and
  share them, and also share any resources you do find as you
  explore the topic.

* Your experiment should not just be to research Ripper, but
  instead to try to come up with a small practical application
  that uses it. This application is not expected to be fully
  reliable or feature complete, but it should show potential
  for using Ripper in an area where some other solution wouldn't
  be immediately obvious.

* You should make sure to share your ideas on the mailing list
  and via university-web to avoid duplicate efforts. You are
  encouraged to help each other as much as possible and share
  bits of common code and documentation, but everyone who attempts
  this assignment needs to submit an experiment of their own
  creation.

* Make good use of irb and Ruby's reflective and introspective
  features to explore Ripper's internals.

* Review ripper_sample.rb in this repository for a trivial example 
  of using Ripper+Sorcerer.

* Read up on ParseTree, RubyParser, and Ruby2Ruby 
  (all third party Ruby 1.8 tools) for inspiration and ideas of
  what might apply to Ripper.

* Feel free to use external resources such as the ruby-talk
  and ruby-core mailing lists, but include a link back to the
  public archives of any conversations you have outside of
  RMU so that your fellow students can learn from them.

## IDEAS

* Try to patch Ripper2Ruby or Sorcerer and improve it in some way

* Try to make an analytics tool that provides certain metrics about
  your code (e.g local variables per method, number of references to
                 a given instance variable, etc)

* Try to make your own emitter that converts s-expressions to Ruby
  or some other language. Dealing with a restricted subset is fine.

* Build a nice trace output showing when variables are set, methods
  called, etc.

## QUESTIONS?

Hit up the mailing list or IRC. RMU exercises are left deliberately open ended,
and often benefit from some discussion before, during, and after you work on
them.
