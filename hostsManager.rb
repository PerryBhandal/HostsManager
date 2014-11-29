require_relative "config.rb"

def enableBlocking 

end

def disableBlocking

end

if ARGV.length != 1
  puts "Error: No enable/disable parameter provided."
else
  stateParam = ARGV[0].downcase
  if stateParam == "enable"
    enableBlocking()
  elsif stateParam == "disable"
    disableBlocking()
  else
    puts "Error: %s is not a valid enable/disable parameter." % (stateParam)
  end
end
