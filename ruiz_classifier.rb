class RuizClassifier

  def fit(dataset)
    @train_dataset = dataset
  end

  def predicts(dataset)
    predictions = []
    dataset.each do |data|
      closest = closest(data)
      predictions.push(closest[4])
    end
    predictions
  end

  def closest(data)
      best_dist = euc_distance(data, @train_dataset[0])
      best_index =  0
      @train_dataset.each_with_index do |train_data, index|
        dist = euc_distance(data, train_data)
        if dist < best_dist
          best_index = index
          best_dist = dist
        end
      end
      @train_dataset[best_index]
  end

  private
  def euc_distance(a, b)
    Math.sqrt((a[0].to_f - b[0].to_f)**2 +
              (a[1].to_f - b[1].to_f)**2 +
              (a[2].to_f - b[2].to_f)**2 +
              (a[3].to_f - b[3].to_f)**2)
  end

end
