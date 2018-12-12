require(neuralnet) #nn model
require(nnet) #class.ind
require(caret) #train(), tune parameters

data <- iris
head(class.ind(data$Species))

data <-cbind(data, class.ind(data$Species))
head(data)

formula.bpn <- setosa + versicolor + virginica ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width

bpn <- neuralnet(formula = formula.bpn, 
                 data = data,
                 hidden = c(2),       # 一個隱藏層：2個node
                 learningrate = 0.01, # learning rate
                 threshold = 0.01,    # partial derivatives of the error function, a stopping criteria
                 stepmax = 5e5        # 最大的ieration數 = 500000(5*10^5)
                 
)

plot(bpn)