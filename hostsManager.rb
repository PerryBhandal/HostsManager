require_relative "config.rb"

HOSTS_PATH = "/etc/hosts"

def enableBlocking 
  hostsFile = openHostsFile()

  hostFile.puts(BASE_ENTRIES)

  BLOCK_LIST.each do |blockEntry|
    hostsFile.puts("%s %s" % [REDIRECT_TO, blockEntry])
  end

  system("pkill %s" % (BROWSER_BIN))
end


def disableBlocking
  hostsFile = openHostsFile()
  hostFile.puts(BASE_ENTRIES)
end

def openHostsFile
  begin
    return File.open(HOSTS_PATH, "w+")
  rescue Errno::EACCES
    puts "ERROR: Could not open hosts file, are you running as sudo?"
    exit 1
  end
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
