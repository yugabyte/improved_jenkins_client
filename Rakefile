lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'improved_jenkins_client/version'
require 'rake'
require 'yard'
require 'bundler/setup'
require 'bundler/gem_tasks'
require 'rubygems/package_task'


require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:unit_tests) do |spec|
  spec.pattern = FileList['spec/unit_tests/*_spec.rb']
  spec.rspec_opts = ['--color', '--format documentation']
end

RSpec::Core::RakeTask.new(:func_tests) do |spec|
  spec.pattern = FileList['spec/func_tests/*_spec.rb']
  spec.rspec_opts = ['--color', '--format documentation']
end

RSpec::Core::RakeTask.new(:test) do |spec|
  spec.pattern = FileList['spec/*/*.rb']
  spec.rspec_opts = ['--color', '--format documentation']
end

YARD::Config.load_plugin 'thor'
YARD::Rake::YardocTask.new do |t|
  t.files = ['lib/**/*.rb', 'lib/**/**/*.rb']
end

namespace :doc do
  # This task requires that graphviz is installed locally. For more info:
  # http://www.graphviz.org/
  desc "Generates the class diagram using the yard generated dot file"
  task :generate_class_diagram do
    puts "Generating the dot file..."
    `yard graph --file improved_jenkins_client.dot`
    puts "Generating class diagram from the dot file..."
    `dot improved_jenkins_client.dot -Tpng -o improved_jenkins_client_class_diagram.png`
  end

  desc "Applies Google Analytics tracking script to all generated html files"
  task :apply_google_analytics do
    files = Dir.glob("**/*.html")

    string_to_replace = "</body>"
    string_to_replace_with = <<-EOF
      <script type="text/javascript">
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-37519629-2']);
        _gaq.push(['_trackPageview']);

        (function() {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();
      </script>
    </body>
    EOF

    files.each do |html_file|
      puts "Processing file: #{html_file}"
      contents = ""
      # Read the file contents
      file =  File.open(html_file)
      file.each { |line| contents << line }
      file.close

      # If the file already has google analytics tracking info, skip it.
      if contents.include?(string_to_replace_with)
        puts "Skipped..."
        next
      end

      # Apply google analytics tracking info to the html file
      contents.gsub!(string_to_replace, string_to_replace_with)

      # Write the contents with the google analytics info to the file
      file =  File.open(html_file, "w")
      file.write(contents)
      file.close
    end
  end
end

task :default => [:unit_tests]
