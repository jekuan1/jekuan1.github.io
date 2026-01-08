Jekyll::Hooks.register :site, :post_write do |site|
  require 'mini_magick'
  
  puts "=" * 80
  puts "IMAGE OPTIMIZER: Starting optimization..."
  
  image_dir = File.join(site.dest, 'images')
  
  unless Dir.exist?(image_dir)
    puts "WARNING: Image directory not found at #{image_dir}"
    next
  end
  
  puts "Found image directory: #{image_dir}"
  
  image_files = Dir.glob(File.join(image_dir, '**', '*.{jpg,jpeg,png}'))
  puts "Found #{image_files.count} images to optimize"
  
  image_files.each do |img_path|
    puts "Processing: #{File.basename(img_path)}"
    
    image = MiniMagick::Image.open(img_path)
    image.strip
    image.quality "85"
    image.resize "1200>"
    image.write img_path
    
    # Also create WebP version
    webp_path = img_path.sub(/\.(jpg|jpeg|png)$/i, '.webp')
    image.format 'webp'
    image.quality "85"
    image.write webp_path
    
    puts "  Created: #{File.basename(webp_path)}"
  end
  
  puts "IMAGE OPTIMIZER: Complete!"
  puts "=" * 80
end