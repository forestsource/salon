#coding: utf-8

def relation ()
  menus = Menu.find(@reserve.menu_id)
  menus.reserves << @reserve
   
  members = Member.find(@reserve.member_id)
  members.reserves << @reserve
    
  staffs = Staff.find(@reserve.staff_id)
  staffs.reserves << @reserve
end

#coding: utf-8

Reserve.create(
  menu_id: 3,
  staff_id: 2,
  day: "2015-1-10",
  open_id: 9,
  member_id: 5
)
Reserve.create(
  menu_id: 2,
  staff_id: 1,
  day: "2015-1-12",
  open_id: 7,
  member_id: 4
)
Reserve.create(
  menu_id: 3,
  staff_id: 1,
  day: "2015-1-12",
  open_id: 1,
  member_id: 6
)




