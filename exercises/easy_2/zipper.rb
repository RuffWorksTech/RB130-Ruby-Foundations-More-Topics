def zip(arr1, arr2)
  arr1.each_with_index.with_object([]) do |(el, idx), new_arr|
    new_arr << [el, arr2[idx]]
  end
end

p [1, 2, 3].zip([4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]