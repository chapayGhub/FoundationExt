Pod::Spec.new do |s|
  s.name             = 'FoundationExt'
  s.version          = '1.0.1'
  s.summary          = 'swift extensions for Foundation.framework'
  s.description      = <<-DESC
  swift helpers + extenshions for Foundation.framework classes
                       DESC

  s.homepage              = 'https://github.com/chapayGhub/FoundationExt'
  s.license               = { :type => 'MIT', :file => 'LICENSE' }
  s.author                = 'chapayGhub'
  s.source                = { :git => 'https://github.com/chapayGhub/FoundationExt.git', :tag => s.version.to_s }  
  s.ios.deployment_target = '8.0'
  s.source_files          = 'FoundationExt/Classes/**/*'  
  s.frameworks            = 'Foundation'
end
