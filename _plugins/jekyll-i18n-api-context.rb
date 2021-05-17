# THIS IS AN DRAFT. Ignore it now. (Emerson Rocha, 2021-05-16)
#
# https://jekyllrb.com/docs/plugins/generators/

# module Reading
#   class Generator < Jekyll::Generator
#     def generate(site)
#       book_data = site.data['books']
#       ongoing = book_data.select { |book| book['status'] == 'ongoing' }
#       done = book_data.select { |book| book['status'] == 'finished' }

#       # get template
#       reading = site.pages.find { |page| page.name == 'reading.html'}

#       # inject data into template
#       reading.data['ongoing'] = ongoing
#       reading.data['done'] = done
#     end
#   end
# end