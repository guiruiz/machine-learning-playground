load 'ruiz_classifier.rb'
require 'csv'

# SEPAL_LENGTH, SEPAL_WIDTH, PETAL_LENGTH, PETAL_WIDTH, SPECIE
# 0 - Setosa, 1 - versicolor and 3 - virginica
csv_text = File.read('iris_data.csv')
csv = CSV.parse(csv_text, :headers => false)
dataset = csv.to_a

#setup labels, test and train datasets
test_dataset = []
3.times { |i| test_dataset += dataset.slice(i * 50, 10)}
train_dataset = dataset - test_dataset

#classifier
classifier = RuizClassifier.new
# train classifier
classifier.fit(train_dataset)
#predict
predictions = classifier.predicts(test_dataset)


#check classifier accuracy
rights = 0
predictions.each_with_index do |pred, index|
  data = test_dataset[index]
  if(pred == data[4])
    rights += 1
  end
end

print "#{test_dataset.size} predictions - #{rights} right(s) and #{test_dataset.size - rights} wrong(s)  \n"
