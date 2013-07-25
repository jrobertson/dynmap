Gem::Specification.new do |s|
  s.name = 'dynmap'
  s.version = '0.1.0'
  s.summary = 'dynmap'
  s.authors = ['James Robertson']
  s.files = Dir['lib/**/*.rb']
  s.signing_key = '../privatekeys/dynmap.pem'
  s.cert_chain  = ['gem-public_cert.pem']  
  s.add_dependency('dynarex')
end
