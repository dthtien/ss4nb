class ClusteringController < ApplicationController
  def clustering
    class_name = request.path.include?('brand') ? 'Brand' : 'Camera'

    @records = class_name.constantize.all.map do |record|
      [record.name, record.average_score]
    end
  end
end
