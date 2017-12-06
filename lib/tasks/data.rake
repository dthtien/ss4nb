namespace :data do
  desc 'Re-syncing initial data'
  task sync: :environment do
    Review.delete_all
    Camera.delete_all

    filenames = Dir[ File.expand_path('../../data/reviews/*.json', __FILE__) ]
    filenames.each do |filename|
      puts filename
      data = JSON.parse File.read(filename)
      data.each do |d|
        camera = Camera.create(name: d['name'])
        Review.create d['amazon_reviews'].map { |r| {body: r, camera: camera} }
      end
    end
  end
end
