# coding: utf-8

m_names = ["カット","パーマ","シャンプー","カット+パーマ","カット+シャンプー"]
m_time = [30, 60, 30, 90, 60]
m_price = [4500, 5000, 1000, 9000, 5000]
c_id = [1, 2, 3, 2, 1]
1.upto(5) do |idx|
  menu = Menu.create(
    menu_name: m_names[idx-1],
    menu_time: m_time[idx-1],
    price: m_price[idx-1],
    category_id: c_id[idx-1]
   )
end

