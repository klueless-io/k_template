# frozen_string_literal: true

require 'k_template/version'

module KTemplate
  # raise KTemplate::Error, 'Sample message'
  Error = Class.new(StandardError)

  # Your code goes here...
end

if ENV.fetch('KLUE_DEBUG', 'false').downcase == 'true'
  namespace = 'KTemplate::Version'
  file_path = $LOADED_FEATURES.find { |f| f.include?('k_template/version') }
  version   = KTemplate::VERSION.ljust(9)
  puts "#{namespace.ljust(35)} : #{version.ljust(9)} : #{file_path}"
end
