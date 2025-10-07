@version = "3.1.2"
Pod::Spec.new do |spec|
  spec.platform     = :ios, '10.0'
  spec.name         = 'SDOSHero'
  spec.authors      = 'SDOS'
  spec.version      = @version
  spec.license      = { :type => 'MIT' }
  spec.homepage     = 'https://github.com/SDOSLabs/SDOSHero'
  spec.summary      = 'Librería que se encarga de proporcionar una capa intermedia con Hero para poder acceder a todos los tipos de transiciones entre controladores en Objctive-C.'
  spec.source       = { :git => "https://github.com/SDOSLabs/SDOSHero.git", :tag => "#{spec.version}" }
  spec.framework    = ['Foundation']
  spec.requires_arc = true

  spec.subspec 'Hero' do |s1|
      s1.preserve_paths = 'src/Classes/*'
      s1.source_files = ['src/Classes/*{*.m,*.h,*.swift}', 'src/Classes/**/*{*.m,*.h,*.swift}']
  end

  spec.dependency 'Hero', '~> 1.6'

end
