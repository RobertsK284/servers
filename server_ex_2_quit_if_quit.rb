require 'socket'

server = TCPServer.new(2345)
loop do
  Thread.start(socket = server.accept) do |socket|
    they_said = nil
    until they_said == "quit"

      socket.puts "What do you say?"

      they_said = socket.gets.chomp

      socket.puts "You said: #{they_said}."
    end
    socket.puts "You said: #{they_said}. Goodbye!" if !they_said.empty?
    socket.close
  end
end
