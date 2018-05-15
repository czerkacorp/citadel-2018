module ApplicationHelper
    def themesList
        initialList = Dir.entries(Rails.root.join("app/assets/stylesheets/themes")).reject! { |x| ( x === ".") || ( x === "..") }.sort
        themesList = []
        
        #The puts statements are for debugging the inner workings of the themes list search.
        #puts "== Initial List Array ---> " + initialList.inspect
        #puts "============================================================="
        #puts "== Searching for themes in app/assets/stylesheets/themes ===="
        #puts "============================================================="
            initialList.each do |t|
                t = t.sub(".scss", "")
                puts "== Theme " + t + " detected!"
                themesList.push(t)
            end
        #puts "============================================================="
        #puts "== Finished searching themes ================================"
        #puts "============================================================="
        themesList.sort!
        #puts "== Themes List Array ---> " + themesList.inspect
        return themesList
    end
end
