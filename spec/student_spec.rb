require '../lib/student.rb'

sarah_r = Student.new("Sarah Ransohoff", "http://sarahunderstandsverylittle.tumblr.com/", "@sranso")

describe Student do
    describe "#initialize" do
        it "should be able to return its name" do
            expect(sarah_r.name).to eq("Sarah Ransohoff")
        end

        it "should be able to change its twitter" do
            expect(sarah_r.twitter="@osnars").to eq("@osnars")
        end
    end
end