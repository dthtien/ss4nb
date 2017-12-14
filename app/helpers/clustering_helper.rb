module ClusteringHelper
  def cluste_option
    [['Very positive', 'very_positive'], ['Positive', 'positive'], ['Negative', 'negative'], ['Very negative', 'very_negative']]
  end

  def set_selected(param)
    clustering_params = params[:clustering]

    unless clustering_params.blank?
      return clustering_params[param]
    end
  end
end
