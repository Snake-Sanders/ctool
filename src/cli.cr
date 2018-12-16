require "option_parser"
require "../ctool"

project_name = ""
document_name = ""
start_server = false

# how to run:
# crystal run src/ctool.cr -- -h

OptionParser.parse! do |parser|
  parser.banner = "Usage: ctool [arguments]"

  parser.on("-v", "--version", "Show version") do
    puts "cli version #{Ctool::VERSION}"
    exit 0
  end

  parser.on("-h", "--help", "Show this help") do
    puts parser
    exit 0
  end

  parser.on("-s", "--server", "Start web server") do
    start_server = true
  end

  parser.on("-p PROJECT", "--project=PROJECT", "indicate project to querry") do |project|
    project_name = project
  end

  parser.on("-d DOC", "--document=DOC", "Specifies the document name") do |doc|
    document_name = doc
  end

end

if project_name != ""
  puts "Project #{project_name}"
  puts "Document #{document_name}"
end

if start_server
    Ctool::Web.new.start
end