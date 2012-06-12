require 'rubygems'
require 'erb'

require './reek_parser'

@input_file_path = ARGV.first
reeks = ReeksList.new(@input_file_path)
#@reeks_list = reeks.divide_reeks
@raw_reeks = reeks.raw_reeks
#@keys = reeks.context_class_list
#@sum_of_waning_num = reeks.total_warning_num

erb_str = open(Dir::pwd + "/table_template.erb").read
html = ERB.new(erb_str).result(binding)

open("./" + @input_file_path + ".html", "w"){|f| f.write html }
