Jekyll::Hooks.register :site, :post_write do |site|
  require 'mini_magick'
  
  image_dir = File.join(site.dest, 'images')
  next unless Dir.exist?(image_dir)
  
  Dir.glob(File.join(image_dir, '**', '*.{jpg,jpeg,png}')).each do |img_path|
    image = MiniMagick::Image.open(img_path)
    image.strip
    image.quality "85"
    image.resize "1200>" # only resize if larger than 1200px
    image.write img_path
  end
end