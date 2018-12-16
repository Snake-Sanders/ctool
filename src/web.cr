
module Ctool

  class Web
    def start
      puts "starting..."
      Kemal.run
    end

    get "/" do
      "Hello World!"
    end
  end
end