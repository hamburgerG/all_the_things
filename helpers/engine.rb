module EngineHelper
  def hn_items
    page = Nokogiri::HTML(open("https://news.ycombinator.com/news"))

    items = []

    list = page.xpath("/html/body/center/table/tr[3]/td/table").children

    list.each do |thing|
      a = thing.css("td[class='title']")
      b = thing.css("td[class='subtext']")
      item = { :title => a.text,
               :url => a["href"],
               :score => }


    page.css("td[class='title'] a").each do |top|
      item = { :title => top.text, :url => top["href"] }
      items << item unless item[:title] == "more"
    end

    page.css("td[class='subtext']").each do |bottom|
      item[:score] = bottom

    HNListing.new({
      :time_gotten => Time.now,
      :posts => items
    })
  end
end