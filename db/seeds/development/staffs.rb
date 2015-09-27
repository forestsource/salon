#coding: utf-8 
myself=["よろしく","どうも","はい","こんにちは"]
interest=["釣り","ポーカー","サーフィン","サッカー"]

0.upto(5) do |i|
@staff=Staff.create(
  member_id: i+1,
  category_id: [1,2,3,4,5].sample, 
  intro_myself: myself[i%4], 
  interest: interest[i%4],
  staff_image: "rails.png"
)

member = Member.find(@staff.member_id+1)
@staff.member = member
end
