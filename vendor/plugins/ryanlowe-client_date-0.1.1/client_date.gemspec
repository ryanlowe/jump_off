Gem::Specification.new do |s|
  s.name = "client_date"
  s.version = "0.1.1"
  s.date = "2008-06-06"
  s.summary = "Uses client-side Javascript to format a datetime instead of the Ruby on Rails server"
  s.email = "rails@ryanlowe.ca"
  s.homepage = "http://github.com/ryanlowe/client_date"
  s.description = "Uses client-side Javascript to format a datetime instead of the Ruby on Rails server"
  s.has_rdoc = false
  s.authors = ["Ryan Lowe"]
  s.files = ["README", "CHANGELOG", "MIT-LICENSE","Rakefile", "client_date.gemspec", "init.rb",
    "lib/client_date.rb",
    "public/javascripts/client_date.js",
    "test/client_date_test.rb","test/test_helper.rb"]
  s.test_files = ["test/client_date_test.rb","test/test_helper.rb"]
  s.rdoc_options = ["--main", "README"]
  s.extra_rdoc_files = ["README","CHANGELOG"]
end