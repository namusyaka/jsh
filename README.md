# JSH

[![Build Status](https://travis-ci.org/namusyaka/jsh.png)](https://travis-ci.org/namusyaka/jsh)

This is an interactive interpreter for JavaScript which is written in Ruby.

## Installation

add this line to your Gemfile.

`gem 'jsh'`

or

`$ gem install jsh`

## Usage

### Basic

```shell
$ jsh
[0] jsh) 1 + 1;
2
[1] jsh) "hello world".length;
11
[2] jsh) (function fib(n){ return (n < 2) ? 1 : fib(n - 2) + fib(n - 1); })(10);
89
```

### Customize

You can customize in these way.
Then save and execute it.

#### `hooks`

```ruby
require 'jsh'

JSH::Hooks.register(:before) do
  puts "before hook!"
end

JSH::Hooks.register(:after) do
  puts "after hook!"
end

JSH.start
```

#### `commands`

Save this file as `foo.rb`.

```ruby
require 'jsh'

JSH::Commands.register(:enable_to_say) do |jsh|
  jsh.context['say'] = lambda{|this, word, times| word * times }
end

JSH.start
```

Then execute it.

```shell
$ ruby foo.rb
[0] jsh) enable_to_say
[1] jsh) say('Hello', 3)
HelloHelloHello
```

### Options

#### `-r --readline=BOOLEAN`

readline option should be boolean.
default value is `true`.
if set `false` to this option, jsh will not use Readline to input.

#### `--noprompt`

if use `--noprompt`, jsh will not print prompt.

## License

The MIT License
