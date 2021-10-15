namespace :missions do
  desc "Generate dummy missions"
  task :prepare => :environment do
    20.times do |i|
      mission = FactoryBot.create(:mission)
      puts "create mission: #{i + 1} - #{mission.title}"
    end
    puts "done!"
  end
end