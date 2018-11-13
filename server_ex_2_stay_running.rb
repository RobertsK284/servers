require 'socket'

server = TCPServer.new(2345)
loop do
  Thread.start(socket = server.accept) do |socket|

    socket.puts "What do you say?"

    they_said = socket.gets.chomp

    socket.puts "You said: #{they_said}. Goodbye!"

    socket.close
  end
end
