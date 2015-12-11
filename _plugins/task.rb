=begin
  Jekyll tag to include Markdown text from _tasks directory preprocessing with Liquid.
  Usage:
    {% task <filename> %}
  Dependency:
    - kramdown
=end
module Jekyll
  class MarkdownTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @text = text.strip
    end
    require "kramdown"
    def render(context)
      tmpl = File.read File.join Dir.pwd, "_tasks", @text + ".md"
      site = context.registers[:site]
      tmpl = (Liquid::Template.parse tmpl).render site.site_payload
      html = Kramdown::Document.new(tmpl).to_html
    end
  end
end
Liquid::Template.register_tag('task', Jekyll::MarkdownTag)
