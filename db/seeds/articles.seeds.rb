articles = [
  {
    title: "Why these immigrant mothers love Anne Frank and the Tiger Mother",
    content: <<-CONTENT.strip_heredoc
      By the time I arrived at the club de literatura to report on a book club that helps immigrant mothers find joy in reading and support their kids’ education, the meeting was well underway in the East Los Angeles high school basement.
      A group of Latina immigrant mothers, some of whom never had a chance to make it past middle school, were energetically discussing the 600-page epic novel Rain of Gold.
      They had already covered such disparate works as Steve Jobs, Don Quixote and a number of novels written by Mexican American authors.
      But out of more than a dozen books that the group read, two books stood out as their favorites: Anne Frank and Battle Hymn of the Tiger Mother.
    CONTENT
  },
  {
    title: "A Wild, Wild West Response to the Syrian Refugee Crisis",
    content: <<-CONTENT.strip_heredoc
      In Kulltorp, Sweden, some 250 miles southwest of Stockholm, there’s an American-style Wild West theme park named High Chaparral. In the summer, at the height of tourism season, it’s exactly what you would imagine — sort of a dinner theater version of Butch Cassidy and the Sundance Kid (only more Swedish).
      But today — when there’s mostly only snow on the ground and no tourists to speak of — it’s host to 500 Syrians who have travelled to Sweden in order to escape the war back home. On the surface, there could be no more bizarre refugee camp. But such is the humanitarian crisis in Syria and such is Europe’s scramble to handle so many refugees at once.
      For a while, Sweden was accepting more refugees per capita than any other country in the European Union. Yet it, too, has become overwhelmed and has begun to drastically curtail the number of asylum seekers who can enter the country as well as the number of them who can remain there.
      Which is where High Chaparral comes in. As a way to help with the flood of refugees, its owner, operator and sheriff, Emil Erlandsson, has given shelter to as many of them as his faux Wild West outpost can hold — for as long as he can hold them. (In May, tourism season will start back up, and the refugees will need to go somewhere else.) It’s part of the value system, Erlandsson says, High Chaparral was founded upon: “My grandfather built this place with the philosophy of the American settlers.”
      In January, MEL Films spent a few days at High Chaparral, chronicling the displaced Syrians who are living among Swedes who are imitating 19th century American cowboys.
      Watch our full 9-minute documentary above; also be sure to check out our slideshow of life at High Chaparral.
    CONTENT
  }
]

after(:users) do
  articles.each do |attrs|
    article = Article.find_or_initialize_by(title: attrs[:title])
    article.user = User.find_by_email("author@example.com")
    article.attributes = attrs
    article.save!
  end
end
