#!/usr/bin/env ruby

require 'webrick'

class Echo < WEBrick::HTTPServlet::AbstractServlet
  def do_GET(request, response)
    response.body = "function FindProxyForURL(url, host) { return 'PROXY #{request.host}:8888; DIRECT'; }"
    response.status = 200
  end
end

server = WEBrick::HTTPServer.new(:Port => 8000)
server.mount "/", Echo
trap "INT" do 
  server.shutdown 
  exit 0
end

Thread.new do
  loop do
    exit 0 if Process.ppid == 1
    sleep 5
  end
end

server.start