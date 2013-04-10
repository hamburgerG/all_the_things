module EngineHelper
  def get_hn
    hn = []
    sketchy_rank_counter = 1

    page = Nokogiri::HTML(open("https://news.ycombinator.com/news"))

    page.css("td.title a").each do |a| 
      hn << {
              :url => a['href'], 
              :title => a.text, 
              :rank => sketchy_rank_counter
            }
      sketchy_rank_counter += 1
      break if sketchy_rank_counter == 31
    end

    snap = HNSnap.new
    snap.time_snapped = Time.now
    snap.items = hn
    snap.save

    return hn
  end
end