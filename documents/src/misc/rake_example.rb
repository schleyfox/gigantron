### @export "Simple Task"
desc "Counts from 1 to 100 into a file"
task :count_to_one_hundred do
  File.open("numbers.txt", "w") do |f|
    for i in (1..100)
      f.puts i
    end
  end
end
### @end
### @export "Dependent Task"
desc "Adds numbers to file created by count_to_one_hundred"
task :add_numbers_to_file => :count_to_one_hundred do
  File.read("numbers.txt").each_line do |n|
    puts n+10
  end
end
### @end
### @export "Default Task"
task :default => :count_to_one_hundred
### @end
