module EngineHelper
  def hn_items
    page = Nokogiri::HTML(open("https://news.ycombinator.com/news"))

    @hn = []

    list = page.xpath("/html/body/center/table/tr[3]/td/table").children

    for i in 0...29
      link = list[i * 3].css("td[class='title'] a")
      info = list[(i * 3) + 1].css("td[class='subtext']").children

      title = link.text
      url = link.attribute("href").to_s      
      score = info[0].text
      comments_page = "http://news.ycombinator.com/" + info[4].attribute("href").to_s
      # binding.pry
      numcomments = info.children[2].text

      item = { 
        :title => title,
        :url => url,
        :score => score,
        :comments_page => comments_page,
        :numcomments => numcomments
      }

      @hn << item
    end

    HNListing.new({
      :time_gotten => Time.now,
      :posts => @hn
    })
    return @hn
  end
end