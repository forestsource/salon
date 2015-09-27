# coding: utf-8

fnames = ["佐藤", "鈴木", "高橋", "田中"]
gnames = ["太郎", "次郎", "花子"]
names = %w(Taro Jiro Hana John Mike Sophy Bill Alex Mary Tom)
0.upto(9) do |idx|
  Member.create(name: "#{fnames[idx % 4]} #{gnames[idx % 3]}",
    birthday: "1981-12-01",
    sex: [0, 0, 1][idx % 3],
    tel: "0801234567#{idx}",
    adress: "東京都",
    mail: "#{names[idx]}@example.com",
    magazine: false,
    user_name: names[idx],
    password: "password",
    administrator: (idx == 0),
    clerk: (idx == 0 || idx == 1 || idx == 2 )
  )
end
