#2. Дана строка s и словарь d, содержащий некие слова. Определите,можно ли
#строку s представить в последовательность разделенных пробелом слов,
#содержащихся в словаре d.
#Пример: дано, s =«двесотни», d = [«две», «сотни», «тысячи»]. Программа должна
#вернуть true, потому что «двесотни» могут быть представлены как «две сотни».
#



d = ['две', 'сотни', 'тысячи', 'сто', 'двести', 'пятьсот']
s = 'двесотнипятьсот'

result = []
current_cursor_position = 0
d.each do |word|
  if s[current_cursor_position...current_cursor_position + word.size] == word
    result.append word
    current_cursor_position += word.size
  end
end

#check the result
#
if result.reduce(0) {|sum, word|
    sum += word.size
  } == s.size
  puts true
else
  puts false
end
