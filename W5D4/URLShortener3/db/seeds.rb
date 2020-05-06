# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do

    User.destroy_all
    user1 = User.create!(email: "jerry_mander@yahoo.com")
    user2 = User.create!(email: "plonka@gmail.com")
    user3 = User.create!(email: "curry_lover@gmail.com")
    user4 = User.create!(email: "wide_eyer@gmail.com")
    user5 = User.create!(email: "jim@hotmail.com")
    user6 = User.create!(email: "selena@hotmail.com")

   ShortenedUrl.destroy_all
    url1 = ShortenedUrl.create!(short_url: "sAx465ZQJ1djpIHn-UI74A", long_url: "www.kodak.com", submitter_id: 1)
    url2 = ShortenedUrl.create!(short_url: "Irp1mi_anwmy5kAac5c1dA", long_url: "www.debka.com", submitter_id: 2)
    url3 = ShortenedUrl.create!(short_url: "i3nL54C2tUJaGoxs4DSa0Q", long_url: "www.google.com", submitter_id: 3)
    url4 = ShortenedUrl.create!(short_url: "vQ32IzshwFCbCCsxEtsjbw", long_url: "www.yahoo.com", submitter_id: 4)
    url5 = ShortenedUrl.create!(short_url: "AKd_YGSEq5IBhYE-sVDoTQ", long_url: "www.ambit.com", submitter_id: 5)
    url6 = ShortenedUrl.create!(short_url: "nzHZbtXzwcIrAC4EULLGbA", long_url: "www.garmin.com", submitter_id: 6)
    url7 = ShortenedUrl.create!(short_url: "IJTk-lDF6zlrfTwLaGKZ3w", long_url: "www.apple.com", submitter_id: 1)
    url8 = ShortenedUrl.create!(short_url: "9666LE9ZuUeloNCjN_fwMw", long_url: "www.facebook.com", submitter_id: 2)
    url9 = ShortenedUrl.create!(short_url: "ZDk9McG8rECDW8aFWALj3w", long_url: "www.amazon.com", submitter_id: 2)
    url10 = ShortenedUrl.create!(short_url: "7cht72_bwjPgs7jHLIpuqA", long_url: "www.kahoot.com", submitter_id: 2)
    url11 = ShortenedUrl.create!(short_url: "YP56xZMpl8nTK0fFJOkoPA", long_url: "www.appacademy.com", submitter_id: 3)
    url12 = ShortenedUrl.create!(short_url: "9JPJhuDguaNWybzZWCeKbQ", long_url: "www.khanacademy.com", submitter_id: 4)
    url13 = ShortenedUrl.create!(short_url: "32ePPKBPx-9J6co-WajPqg", long_url: "www.docker.com", submitter_id: 4)

    Visit.destroy_all
    Visit.create!(visiting_user_id: 1, visited_short_url: 6)
    Visit.create!(visiting_user_id: 1, visited_short_url: 6)
    Visit.create!(visiting_user_id: 1, visited_short_url: 5)
    Visit.create!(visiting_user_id: 1, visited_short_url: 4)
    Visit.create!(visiting_user_id: 1, visited_short_url: 5)
    Visit.create!(visiting_user_id: 1, visited_short_url: 5)
    Visit.create!(visiting_user_id: 1, visited_short_url: 2)
    Visit.create!(visiting_user_id: 1, visited_short_url: 2)
    Visit.create!(visiting_user_id: 2, visited_short_url: 3)
    Visit.create!(visiting_user_id: 2, visited_short_url: 4)
    Visit.create!(visiting_user_id: 2, visited_short_url: 4)
    Visit.create!(visiting_user_id: 2, visited_short_url: 13)
    Visit.create!(visiting_user_id: 2, visited_short_url: 12)
    Visit.create!(visiting_user_id: 3, visited_short_url: 10)
    Visit.create!(visiting_user_id: 3, visited_short_url: 10)
    Visit.create!(visiting_user_id: 3, visited_short_url: 5)
    Visit.create!(visiting_user_id: 3, visited_short_url: 6)
    Visit.create!(visiting_user_id: 4, visited_short_url: 7)
    Visit.create!(visiting_user_id: 4, visited_short_url: 7)
    Visit.create!(visiting_user_id: 4, visited_short_url: 7)
    Visit.create!(visiting_user_id: 4, visited_short_url: 8)
    Visit.create!(visiting_user_id: 4, visited_short_url: 8)
    Visit.create!(visiting_user_id: 4, visited_short_url: 9)
    Visit.create!(visiting_user_id: 4, visited_short_url: 9)
    Visit.create!(visiting_user_id: 4, visited_short_url: 9)
    Visit.create!(visiting_user_id: 4, visited_short_url: 5)
    Visit.create!(visiting_user_id: 5, visited_short_url: 5)
    Visit.create!(visiting_user_id: 5, visited_short_url: 5)
    Visit.create!(visiting_user_id: 5, visited_short_url: 3)
    Visit.create!(visiting_user_id: 6, visited_short_url: 3)
    Visit.create!(visiting_user_id: 6, visited_short_url: 3)
    Visit.create!(visiting_user_id: 6, visited_short_url: 2)
    Visit.create!(visiting_user_id: 6, visited_short_url: 2)
    
end