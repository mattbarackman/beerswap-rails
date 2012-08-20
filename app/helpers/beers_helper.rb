module BeersHelper

def find_on_page(start_regex, start_tag, end_tag)
  style_anchor = current.content.index(start_regex)
  style_start = current.content.index(start_tag, style_anchor)
  style_end = current.content.index(end_tag, style_start)
  style_name = current.content[style_start+(end_tag).length...style_end]
  puts style_name
end

end
