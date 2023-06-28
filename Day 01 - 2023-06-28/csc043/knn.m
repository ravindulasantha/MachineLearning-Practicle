function rate = knn(traindata, testdata)

m = size(traindata, 1);
n = size(testdata, 1);
predict = [];
k = 3;

for test = 1:n
    for train = 1:m
        Euclidist(train) = norm(testdata(test,1:end-1) - traindata(train, 1:end-1));
    end
    
    [~, sortedIndices] = sort(Euclidist);
    
    nearestIndices = sortedIndices(1:k);
    
    modeClass = mode(traindata(nearestIndices, end));
    
    predict(test) = modeClass;
    
    
    
end

actual = testdata(:,end);
rate = 100*sum(actual==predict')/n;