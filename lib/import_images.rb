require "rest_client"
require "rmagick"
include Magick

class ImportImages

  def initialize(path)
    @path = path
  end

  def import(file)
    if (file.downcase.include? ".jpg")
      file = File.open(File.join(@path, file))
      # img = Image.read(file).first
      # img.resize_to_fill(640)
      # new_file = File.new(File.join(@path, "resized", file_o).to_s, "w")
      # img.write(new_img)
      # Message.create(image: file)
      response = RestClient.post "http://spekapp.herokuapp.com/1/messages", {message: {image: file}}
      File.delete(file.path) if response.code == 200
    else
      return false
    end
  end

  def run(limit = nil)
    @files = Dir.entries(@path)

    @files = @files.slice(3, limit) unless (limit.nil?)

    @files.each do |file|
      import(file)
    end
  end

end
