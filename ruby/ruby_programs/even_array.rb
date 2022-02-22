# Write a function which takes an array of integers, return how many of them contain an even number of
# digits.

class Test
  def even(arr)
    digits = []
    for i in 0..arr.length - 1
      digit = 0
      while arr[i] > 0
        digit += 1
        arr[i] /= 10
      end
      digits.push(digit)
    end
    count = 0
    for i in 0...digits.length
      if digits[i] % 2 == 0
        count += 1
      end
    end
    return count
  end
end

t1 = Test.new
puts t1.even([2, 1, 3, 4, 5, 6, 7, 8, 9, 24, 67, 88, 97, 1002, 1004])

#Output = 6
