Jekyll::Hooks.register :site, :post_write do |site|
  require 'mini_magick'
  
  image_dir = File.join(site.dest, 'images')
  next unless Dir.exist?(image_dir)
  
  Dir.glob(File.join(image_dir, '**', '*.{jpg,jpeg,png}')).each do |img_path|
    image = MiniMagick::Image.open(img_path)
    image.strip
    image.quality "95"
    image.resize "1200>"
    image.write img_path
    
    # Create WebP version
    webp_path = img_path.sub(/\.(jpg|jpeg|png)$/i, '.webp')
    image.format 'webp'
    image.quality "95"
    image.write webp_path
  end
end