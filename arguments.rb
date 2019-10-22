# frozen_string_literal: true

def som1(pos, *arr, xxx: 1, yyy: 2, **has)
  p pos, xxx, yyy
  p arr
  p has
end

som1(12, 13, 14, aaa: 11, zzz: 10, xxx: 30)
