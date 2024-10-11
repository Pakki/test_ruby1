# 3. Напишите программу которая отображает числа в стиле жидкокристаллического
# дисплея с регулируемым размером.
# Цифры, которые нужно отобразить, будут переданы в качестве аргумента
# программе. Размер должен контролироваться с помощью опции командной строки
# -v, за которой следует положительное целое число. Значение по умолчанию для -v
# равно 2.
# Например, если ваша программа вызывается с:
# test3.rb 2345
# результат будет
#  --  --         --
#    |   |  |  | |
#    |   |  |  | |
#  --  --    --   --
# |      |     |    |
# |      |     |    |
#  --  --         --

size = 2


one = [
  [' ',' ',' '],
  [' ',' ','|'],
  [' ',' ',' '],
  [' ',' ','|'],
  [' ',' ',' ']
]

two = [
  [' ','-',' '],
  [' ',' ','|'],
  [' ','-',' '],
  ['|',' ',' '],
  [' ','-',' ']
]

three = [
  [' ','-',' '],
  [' ',' ','|'],
  [' ','-',' '],
  [' ',' ','|'],
  [' ','-',' ']
]

four = [
  [' ',' ',' '],
  ['|',' ','|'],
  [' ','-',' '],
  [' ',' ','|'],
  [' ',' ',' ']
]

five = [
  [' ','-',' '],
  ['|',' ',' '],
  [' ','-',' '],
  [' ',' ','|'],
  [' ','-',' ']
]

six = [
  [' ','-',' '],
  ['|',' ',' '],
  [' ','-',' '],
  ['|',' ','|'],
  [' ','-',' ']
]

seven = [
  [' ','-',' '],
  [' ',' ','|'],
  [' ',' ',' '],
  [' ',' ','|'],
  [' ',' ',' ']
]

eight = [
  [' ','-',' '],
  ['|',' ','|'],
  [' ','-',' '],
  ['|',' ','|'],
  [' ','-',' ']
]

nine = [
  [' ','-',' '],
  ['|',' ','|'],
  [' ','-',' '],
  [' ',' ','|'],
  [' ','-',' ']
]

zero = [
  [' ','-',' '],
  ['|',' ','|'],
  [' ',' ',' '],
  ['|',' ','|'],
  [' ','-',' ']
]

def print_numbers numbers_arr, size, numbers
  make_rows numbers_arr, size, numbers
  enlarge_cols numbers_arr, size
  numbers_arr.each do |row|
    puts row
  end
end

def enlarge_cols numbers_arr, size
  4.downto(0) do |index|
    if index == 1 or index == 3
      (1...size).each do
        numbers_arr.insert(index + 1, numbers_arr[index])
      end
    end
  end

end

def make_rows numbers_arr, size, numbers
  for row_index in (0..4) do
    numbers_arr.append('')
    numbers.each_with_index do |number, index|
      numbers_arr[row_index]+= prepare_row size, number[row_index]

      # the delimiter between numbers
      if index < numbers.size - 1
        numbers_arr[row_index]+= ' '
      end
    end

  end
end

def prepare_row size, row
  mid = ''
  (0...size).each do
    mid += row[1]
  end
  return "#{row[0]}#{mid}#{row[2]}"
end


numbers_arr = []

digits_hash = {
  '0' => zero,
  '1' => one,
  '2' => two,
  '3' => three,
  '4' => four,
  '5' => five,
  '6' => six,
  '7' => seven,
  '8' => eight,
  '9' => nine
}


pattern = /^-v\d$/
numbers_str = ''
if ARGV.size == 2
  if pattern.match(ARGV[0])
    size = ARGV[0][2].to_i
    numbers_str = ARGV[1]
  end
else
  numbers_str = ARGV[0]
end

params_arr = []
numbers_str.each_char do |current_char|
  params_arr.append(digits_hash[current_char])
end


print_numbers numbers_arr, size, params_arr
