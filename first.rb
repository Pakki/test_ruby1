#
#1. Напишите программу, которая принимает ровно два целочисленных входных
#значения. Первое из этих значений должно указывать количество случайных
#элементов, которые вы хотите включить в выборку. Второе значение является
#верхней границей (исключительно) диапазона целых чисел, из которого могут быть
#выбраны элементы. Нижняя граница равна нулю (включительно).
#Ваша программа должна выводить ровно запрошенное количество элементов из
#определенного диапазона в стандартный вывод, по одному числу на строку. Каждый
#элемент должен быть уникальным и они должны появляться в отсортированном
#порядке.



def create_range quantity, range_end
  arr = []
  (1..quantity).each do |index|
    while true do
      rand_num = rand(0..range_end)
      if arr.include? rand_num
        rand_num = rand(0..range_end)
      else
        arr.append rand_num
        break
      end
    end
  end
  return arr.sort
end


print 'Введите количество элементов: '
quantity = gets.chomp().to_i
print 'Введите верхнюю границу: '
range_end = gets.chomp().to_i

numbers = create_range quantity, range_end
if numbers.count > 0
  numbers.each do |number|
    puts number
  end
end
