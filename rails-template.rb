# Install Ginsu.
plugin('ginsu', :git => 'git://github.com/endymion/ginsu.git')

# Create config/initializers/ginsu.rb (not with the generator provide by Ginsu)
initializer 'ginsu.rb', <<-CODE
require 'ginsu'
Ginsu::Knife.configure do |ginsu|

    ginsu.slices << { :search => '#header', :static => 'index.html', :partial => 'header' }
    ginsu.slices << { :search => '#footer', :static => 'index.html', :partial => 'footer' }

    ginsu.links << { :static => 'images' }
    ginsu.links << { :static => 'stylesheets' }

end
CODE

# Create graphic design and static web site directories.
run('mkdir static')
run('mkdir static/images')
run('mkdir static/stylesheets')
run('mkdir design')

# Add Blueprint to the static web site directory, which gets linked into the Rails site.
if yes?("Include the Blueprint CSS framework?")
  git :clone => 'git://github.com/joshuaclayton/blueprint-css.git'
  run('mv blueprint-css static/stylesheets')
end