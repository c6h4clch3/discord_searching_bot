#! ruby -Ku
$KCODE = "u"

require 'rubygems'
require 'discordrb'
require 'nokogiri'
require 'mechanize'
require 'cgi'

class GoogleSearch
  def initialize()
    @token_list = {
      'GameWith' => 'site:https://xn--bck3aza1a2if6kra4ee0hf.gamewith.jp/ '
    }
  end

  def snipet_scraping(keyword, token)
    escapedKeyword = keyword
    submit_keyword(escapedKeyword, token)
    @agent.page.search('div.g').map do |node|
      title = node.search('a')
      next if title.empty?
      query = URI.decode_www_form(URI(title.attr("href")).query)
      url = query[0][1]
      {
        title: except_tag(title.children.to_html).encode('UTF-8'),
        url: url
      }
    end.reject do |list|
      list.nil?
    end.take(5)
  end

  private

  def submit_keyword(keyword, token)
    @agent = Mechanize.new
    @agent.get('https://www.google.co.jp/')
    prefix = @token_list.include?(token) ? @token_list[token] : ''
    @agent.page.form_with(name: 'f') do |form|
      form.q = prefix + keyword
    end.submit
  end

  def except_tag(str)
    str.gsub(/(<b>|<\/b>|<br>|<\/br>|\R)/, '').gsub(/\s\.\.\..*/, '')
  end
end

result = GoogleSearch.new.snipet_scraping('マグナ', 'GameWith')
result.each do |value|
  p "----------------"
  p "url: #{value[:url]}"
  p "title: #{value[:title]}"
end
