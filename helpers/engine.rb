module EngineHelper
  def hn_items
    page = Nokogiri::HTML(open("https://news.ycombinator.com/"))

    items = []
    page.css("td[class='title'] a").each do |thing|
      item = { :title => thing.text, :url => thing["href"] }
      items << item
    end
    return items
  end
end