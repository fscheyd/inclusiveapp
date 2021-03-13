module ReviewHelper
    def review_header(f)
        out = ''
        if @business
            out << 'Business: '
            out << @business.business_name + '<br>'
        else
            out << (f.label 'Business: ')
            out << (f.select :business_id, @businesses)  + '<br>'
        end

        out.html_safe

    
    end
end
