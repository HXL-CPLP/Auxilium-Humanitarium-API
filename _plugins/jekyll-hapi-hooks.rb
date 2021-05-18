# https://jekyllrb.com/docs/plugins/hooks/

## https://womanonrails.com/ruby-iterators

# Jekyll::Hooks.register :site, :after_init do |site|
Jekyll::Hooks.register :site, :post_read do |site|
    # code to call after Jekyll renders a page
    print "jekyll-hapi-hooks: hi!"
    # print site.data.api
    # print site.data.linguam
    # puts site.data
    # puts site.posts.docs
    # puts site.collections
    # puts site.pages
    # puts site.data['api']

    site.data['api'].map do |api|

        # Is possible to change title, description,
        # but locale may be overriden.

        # api["title"] = "teste teste " + api["title"]
        # api["description"] = "test desc"
        # api["x-default"] = api["x-default"] + "oioioioi"
        # if api["linguam"] == "eng"
        #     api["locale"] = "en"
        # end
        case api["linguam"]
        when "eng"
            api["locale"] = "en"
        when "por"
            api["locale"] = "pt"
        when "lat"
            api["locale"] = "la"
        when "mul"
            api["locale"] = "pt"
        end
    end


    puts "jekyll-hapi-hooks: bye!"
end