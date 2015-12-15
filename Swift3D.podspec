Pod::Spec.new do |s|
  s.name        = "Swift3D"
  s.version     = "0.2.2"
  s.summary     = "Swift3D implements handy function for 3D programming"
  s.homepage    = "https://github.com/adriankrupa/swift3D"
  s.license     = { :type => "MIT" }
  s.authors     = { "adriankrupa" => "adrian.krupa91@gmail.com", }

  s.requires_arc = true
  s.osx.deployment_target = "10.9"
  s.ios.deployment_target = "8.0"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"
  s.source   = { :git => "https://github.com/adriankrupa/swift3D.git", :tag => "0.2.2"}
  s.source_files = "Source/*.swift"
end
