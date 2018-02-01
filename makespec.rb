#! /user/bin/env ruby

require "date"
require 'yaml'

yaml = YAML.load_file("db.yml")
template = IO.readlines("resource/template.html").join("\n")
today = Date.today.strftime("%Y%m%d")
Dir.mkdir('html') unless Dir.exist? 'html'
Dir.mkdir('pdf') unless Dir.exist? 'pdf'

puts "dump schema"
`mysqldump --no-data --xml #{yaml['db']['name']} -h #{yaml['db']['host']} -P #{yaml['db']['port']} -u #{yaml['db']['user']} > html/schema.xml && xsltproc -o html/schema.html resource/style.xsl html/schema.xml && wkhtmltopdf -O landscape --disable-smart-shrinking --viewport-size 1280x1024 --zoom 5 #{Dir.pwd}/html/schema.html pdf/table_spec_#{today}.pdf`

yaml['dump_table'].each do |k, v|
  puts "dump table: #{k}"
  dumpHtml = `echo "SELECT * FROM #{k};" |  mysql  #{yaml['db']['name']} -h #{yaml['db']['host']} -P #{yaml['db']['port']} -u #{yaml['db']['user']} -H`
  dumpHtml = "<h1 class=\"page-header\">#{v}(#{k})</h1>" + dumpHtml.gsub(/<TABLE BORDER=1>/, '<table class="table table-condensed">')
  html = template % dumpHtml
  open("html/#{k}.html", "w") {|f| f.puts html}
  `wkhtmltopdf -O landscape --disable-smart-shrinking --viewport-size 1280x1024 --zoom 5 #{Dir.pwd}/html/#{k}.html pdf/#{k}_spec_#{today}.pdf`
end