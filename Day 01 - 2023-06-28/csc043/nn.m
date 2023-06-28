function rate = nn(traindata, testdata)

m = size(traindata, 1);
n = size(testdata, 1);
predict = [];

for test = 1:n
    for train = 1:m
        Euclidist(train) = norm(testdata(test,1:end-1) - traindata(train, 1:end-1));
    end
    
    [va, ind] = min(Euclidist);
    predict(test) = traindata(ind, end);
end

actual = testdata(:,end);
rate = 100*sum(actual==predict')/n;