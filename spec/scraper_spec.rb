require '../lib/scraper.rb'

blob = Scraper.new("https://gist.github.com/ashleygwilliams/7586141")

describe Scraper do
    # describe "#initialize" do
    #     it "should be able to return @html" do
    #         html = Nokogiri::HTML("https://gist.github.com/ashleygwilliams/7586141")
    #         expect(blob.html.to_s).to eq(html.to_s)
    #     end
    # end

    describe "#get_student_names" do
        it "should" do
            expect().to eq()
        end
    end

    describe "#get_student_blogs" do
        it "should" do
            expect().to eq()
        end
    end

    describe "#get_students_twitter_usernames" do
        it "should" do
            expect().to eq()
        end
    end

end