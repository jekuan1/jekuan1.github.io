Jekyll::Hooks.register :documents, :post_render do |doc|
  if doc.output_ext == ".html"
    doc.output = convert_images_to_picture(doc.output)
  end
end

Jekyll::Hooks.register :pages, :post_render do |page|
  if page.output_ext == ".html"
    page.output = convert_images_to_picture(page.output)
  end
end

def convert_images_to_picture(content)
  content.gsub(/<img\s+([^>]*?)src=["']([^"']*?\.(jpg|jpeg|png))["']([^>]*?)>/i) do |match|
    attributes_before = $1
    img_src = $2
    ext = $3
    attributes_after = $4
    
    webp_src = img_src.sub(/\.(jpg|jpeg|png)$/i, '.webp')
    
    <<~HTML.strip
      <picture>
        <source srcset="#{webp_src}" type="image/webp">
        <img #{attributes_before}src="#{img_src}"#{attributes_after} loading="lazy">
      </picture>
    HTML
  end
end