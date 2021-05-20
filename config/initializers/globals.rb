constants = YAML.load_file("#{Rails.root}/config/globals.yml")[Rails.env]

constants.each do |key, value|
  ENV[key] = value
end