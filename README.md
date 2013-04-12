# GCJ Helper

A JRuby-powered helper for Google Code Jam

## Requirements

- JRuby (`rvm install jruby`)
- `jruby_threach` (`gem install jruby_threach`)

## Usage

Here's an example of solving a challenge to sum all numbers. The input might look like this (the first line is just the number of test cases):

```
3
346 2 52 38 9 32 59 0 32 58
23409 238924 35325261
42
```

Since we're finding the sum, the output ought to look like the following:

```
Case #1: 628
Case #2: 35587594
Case #3: 42
```

So you might write something like the following:

```ruby
# example.rb
require_relative 'gcj_helper' # or wherever you downloaded gcj_helper.rb

input  = 'A-small-practice.in' # .in file downloaded from Google
output = 'a.out' # file you will eventually upload to Google

GCJ.solve(input, output) do |line|
  nums = line.split(' ')
  nums.inject(0) do |result, num|
    result + num.to_i
  end
end
```

Now you run `ruby example.rb`, upload `a.out`, and bask in the glory of GCJ championship!

## Todo

Handle inputs where each test case is on a variable number of lines, such as [Hall of Mirrors](https://code.google.com/codejam/contest/1460488/dashboard#s=p3).
