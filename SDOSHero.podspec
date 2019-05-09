@version = "3.0.0"
Pod::Spec.new do |spec|
  spec.platform     = :ios, '8.0'
  spec.name         = 'SDOSHero'
  spec.authors      = 'SDOS'
  spec.version      = @version
  spec.license      = { :type => 'SDOS License' }
  spec.homepage     = 'https://svrgitpub.sdos.es/iOS/SDOSHero'
  spec.summary      = 'Librería que se encarga de proporcionar una capa intermedia con Hero para poder acceder a todos los tipos de transiciones entre controladores en Objctive-C.'
  spec.source       = { :git => "https://svrgitpub.sdos.es/iOS/SDOSHero.git", :tag => "v#{spec.version}" }
  spec.framework    = ['Foundation']
  spec.requires_arc = true

  spec.subspec 'Hero' do |s1|
      s1.preserve_paths = 'src/Classes/*'
      s1.source_files = ['src/Classes/*{*.m,*.h,*.swift}', 'src/Classes/**/*{*.m,*.h,*.swift}']
  end

  spec.dependency 'Hero', '~> 1.4'

end
