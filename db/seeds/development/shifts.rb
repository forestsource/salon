#coding: utf-8

1.upto(60) do |idx|
  Shift.create(
  staff_id: idx%3+1,
  day: "2015-1-#{Random.rand(1 .. 31)}",
  going_time: 1,
  leave_time: 21
)
end
1.upto(20) do |idx|
  Shift.create(
  staff_id: idx%3+1,
  day: "2015-2-#{Random.rand(1 .. 28)}",
  going_time: 1,
  leave_time: 21
)
end
