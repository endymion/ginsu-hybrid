# Install Ginsu.
plugin('ginsu', :git => 'git://github.com/endymion/ginsu.git')

# Create config/initializers/ginsu.rb (not with the generator provide by Ginsu)
initializer 'ginsu.rb', <<-CODE
require 'ginsu'
Ginsu::Knife.configure do |ginsu|

    ginsu.slices << { :search => '#header', :static => 'index.html', :partial => 'header' }
    ginsu.slices << { :search => '#footer', :static => 'index.html', :partial => 'footer' }

    ginsu.links << { :static => 'images' }
    
end
CODE

run('mkdir static')
run('mkdir design')