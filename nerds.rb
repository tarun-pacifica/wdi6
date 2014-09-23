require 'fileutils'

hackers = "Veronique Eldridge-Smith,Angela Mikulasev,Jacqueline Mikulasev,Tanya Butenko,Daniel Handaru,James LeBoeuf,Jade Feng,Rusli,Nick Matenaar,Fabian Stein,Phil Jacob,Lawrence Ly,Benjamin Ifedigbo,Andrew Thompson,Jon Bartlett".split(',')

hackers.each do |hacker|
  folder_name = hacker.gsub(' ','_').downcase
  FileUtils.mkdir folder_name
  FileUtils.chdir folder_name do
    FileUtils.touch '.gitkeep'
  end
end