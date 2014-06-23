library(shiny)
library(stats)

tTrainOrig <- read.csv("titanic-train.csv", header=TRUE)

## Pre-processing of data to get get only the required subset of data.
tTrainOrig = na.omit(tTrainOrig)
tTrain = tTrainOrig[,2:6]
tTrain$Name = NULL
tTrain$Pclass = factor(tTrain$Pclass)

## Use a binary logistic regresion model for prediction. 
fit1 <- glm(Survived ~ Pclass + Sex + Age, data = tTrain, family = "binomial")

pClass = c(1:3) ## represents three classes Upper, middle and lower
age = c(1:100) ## reprsents age in years
sex = c("male", "female")

tFacts = c("On April 15, 1912, Titanic sank during her maiden voyage.",
"Sinking of Titanic killed 1502 out of 2224 passengers and crew.",
"Titanic had 1324 passengers on board.",
"Titanic had 13 honeymooning couples on board.",
"492 - the number of Titanic passengers who survived.",
"37 - the percentage of passengers who survived.",
"61 - the percentage of First Class passengers who survived.",
"42 - the percentage of Standard Class passengers who survived.",
"24 - the percentage of Third Class passengers who survived.",
"2 - dogs who survived (both were lapdogs taken onto lifeboats by their owners).",
"20 - the percentage of male passengers who survived.",
"75 - the percentage of female passengers who survived.",
"832 - the number of passengers who perished.",
"63 - the percentage of passengers who perished.",
"39 - the percentage of First Class passengers who perished.",
"58 - the percentage of Standard Class passengers who perished.",
"76 - the percentage of Third Class passengers who perished.",
"19 - the age of the youngest known victim, Sidney Leslie Goodwin, in months.",
"1 - the number of children from First Class who perished.",
"49 - the number of children from steerage who perished."
)
#crGs = 0
shinyServer(
        function(input, output)
        {              
                predPercent = 0
                ipClass = sample(pClass)[1]
                iAge = sample(age)[1]
                iSex = sample(sex)[1]
                output$pclass <- renderText(ipClass)
                output$sex <- renderText(iSex)
                output$age <- renderText(iAge)               
                inpVal = data.frame(Pclass = factor(ipClass), Sex = factor(iSex), Age = iAge)
                while (predPercent == 0) 
                { 
                        prediction = predict(fit1, newdata = inpVal, type = "response")    
                        predPercent = round(prediction, 1) * 100
                        output$fact = renderText({sample(tFacts)[1]})
                }
                result <- reactive({
                        if (as.numeric(input$yourGuess) == predPercent) 
                        {
                                #print(predPercent)
                                output$fact = renderText({sample(tFacts)[1]})
                                #crGs = crGs + 1
                                #output$numCorr = renderText({crGs})                               
                                "Correct: Good job. To play again: Use browser refresh"
                        }
                        else 
                        {
                                #print(predPercent)
                                output$fact = renderText({sample(tFacts)[1]})
                                #crGs = 0
                                #output$numCorr = renderText({crGs})
                                "Incorrect: Try again"  
                        }
                        
                })
                output$rtOrWrong = renderText({result()})
         }
 )