# coding: utf-8

names = ["CUT","COLOR","PARM","TREATMENT","OTHER"]
0.upto(4) do |idx|
    Category.create(
    category_name: names[idx] 
  )
end
