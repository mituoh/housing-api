Dir[File.join(File.dirname(__FILE__), 'housing/{helper,api,api/*}.rb')].each do |m|
  require m
end

module Housing
end
