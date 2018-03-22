# гласные с номером

arr = {}
i = 1

for letter in :a..:z
  if [:a, :e, :i, :o, :u, :y].include? letter then  arr[letter] = i end
  i +=1
end

puts arr.inspect
