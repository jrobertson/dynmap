#!/usr/bin/env ruby

# file: dynmap.rb
# requirements: nmap must be installed first

require 'dynarex'

class DyNmap

  def initialize(subnet='192.168.4')

    r = `nmap -sP #{subnet}.0/24; arp -n  | grep "#{subnet}.[0-9]* *ether"`
    s = r[/Nmap scan report for .*Host is up[^\)]+\)/m]
    a = s.scan(/Nmap scan report for (?:([^\s]+)\s\((\d+\.\d+\.\d+\.\d+)\)|(\d+\.\d+\.\d+\.\d+))\nHost is up \((\d+\.\d+)/m)
    a.map! {|x| ([''] + x.compact)[-3..-1] }

    @dynarex = Dynarex.new('items/item(ip,domain, latency)')
    a.each do |domain, ip, latency|
      @dynarex.create ip: ip, domain: domain, latency: latency
    end

  end

  def to_dynarex
    @dynarex
  end

  def save(filename='dynarex.xml')
    @dynarex.save filename
  end

end
