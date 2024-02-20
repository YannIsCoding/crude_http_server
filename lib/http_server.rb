require 'socket'

class HTTPServer

  def initialize
    @server = TCPServer.new 'localhost', 2000 # Server bound to port 2000
    @run = true
  end

  def run
    while @run == true do
      @connection = @server.accept    # Wait for a @server to connect
      @connection.puts "HTTP/1.1 200 OK
        Content-Length: 12
        Content-Type: text/plain; charset=utf-8

        Hello World!
        "
      puts "server close now"
      @connection.close
    end
  end

  def stop
    @run = false
  end

end
