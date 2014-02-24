require 'bundler'
Bundler.require

class App
  def get_unix_time
    Time.new.to_i.to_s
  end

  def call(env)
    [ 200, { "Content-Type" => "text/plain" }, [ get_unix_time ] ]
  end
end

run App.new
