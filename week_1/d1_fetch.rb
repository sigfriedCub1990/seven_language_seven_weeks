#!/usr/bin/ruby

require 'net/http'
require 'json'

uri = URI('https://api.chucknorris.io/jokes/random')
res = Net::HTTP.get_response(uri)

json_res = JSON.parse(res.body)

json_res.each { |k, v| puts "#{k}: #{v}" }
