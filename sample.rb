
$:.unshift(File.expand_path("../lib", __FILE__))
require 'jsh'

JSH::Hooks.register(:before) do
  puts "before hook!"
end

JSH::Hooks.register(:after) do
  puts "after hook!"
end

JSH::Commands.register(:enable_to_say) do |jsh|
  jsh.context['say'] = lambda{|this, word, times| word * times }
end

JSH.start
