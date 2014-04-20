# Introducing the Dynmap gem

I wrote the Dynmap gem to make it more convenient to scan the hosts on my LAN and to store them in a Dynarex format. Note: You need to install the nmap package to use this gem.

## Example

    require 'dynmap'
    require 'table-formatter'

    labels = %w(IP domain latency)

    dnm = DyNmap.new('192.168.4')
    a = dnm.to_dynarex.to_h.map(&:values)

    tfo = TableFormatter.new
    tfo.source = a
    tfo.labels = labels
    puts tfo.display  

    dnm.save

## Output

    ---------------------------------------------------------------------------------------------
    | IP             | domain                     | latency                                     |
    ---------------------------------------------------------------------------------------------
    | 192.168.4.1    |                            | 0.011                                       |
    | 192.168.4.2    |                            | 0.0038                                      |
    | 192.168.4.16   |                            | 0.0049                                      |
    | 192.168.4.104  | mail.qbitx.com             | 0.0068                                      |
    | 192.168.4.106  |                            | 0.0063                                      |
    | 192.168.4.159  |                            | 0.0026                                      |
    | 192.168.4.165  |                            | 0.0098                                      |
    | 192.168.4.170  | jamesrobertson.eu          | 0.0079                                      |
    | 192.168.4.174  |                            | 0.0081                                      |
    | 192.168.4.175  |                            | 0.0063                                      |
    | 192.168.4.176  | SEP000C85D5A6DE.qbitx.com  | 0.0074                                      |
    | 192.168.4.177  |                            | 0.0057                                      |
    | 192.168.4.181  |                            | 0.0035                                      |
    | 192.168.4.184  |                            | 0.0024                                      |
    | 192.168.4.188  |                            | 0.0028                                      |
    | 192.168.4.189  | jamesrobertson.eu          | 0.0014                                      |
    | 192.168.4.192  | hfg0011prn.qbitx.com       | 0.016                                       |
    | 192.168.4.193  |                            | 0.015                                       |
    ---------------------------------------------------------------------------------------------

dynmap gem nmap
