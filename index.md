---
title       : Titanic Survival Probability Guessing (TSPG) Game
subtitle    : TSPG Game App
author      : Prashant Ratnaparkhi
job         : Director, Data Discovery, Analysis & Cloud
framework   : html5slides        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## 



Titanic: Survival Probability Guessing (TSPG) Game App
======================================================
[Based on the data downloaded from www.kaggle.com]



Use the App to:
* have fun, 
* play a guessing game, 
* and learn the facts of Titanic

---
## 
TSPG Game App Highlights
=========================

* TSPG Game is based on the probability of survival of a passenger on Titanic. 

* TSPG allows you to play and learn. It is very easy to play - select & click

* Simply select a value of probability from the drop-down taking into 
consideration the Passenger Details displayed. 

* TSPG displays facts of Titanic disaster each time you play. These facts
could be used to improve your chances of getting a correct answer.

* Number of consecutive correct guesses is updated and you may get a grand 
prize after 1000 consecutive correct guesses. 

---

## 
How does TSPG game work?
========================
* TSPG game challenges the player to guess the probability of survival,
using the passenger details displayed on the screen. 

* It compares its model-based-predition to player's guess and displays 
the Result. 

* TSPG App also displays facts about Titanic disaster and surviors under the 
title - 'Did you know that:'. These facts could be used to improve your guessing. 

* TSPG App also has a running counter which displays consecutive correct 
guesses made by a player.

* TSPG uses binary logistic regression for its prediction. More information regarding TSPG prediction model is on the last slide. 

---

## 
More information regarding Titanic survivors to help you play
============================================================
Rate of survival in children when compared to adults: 

```r
data("Titanic")
apply(Titanic, c(3, 4), sum)
```

```
##        Survived
## Age       No Yes
##   Child   52  57
##   Adult 1438 654
```

Rate of survival in women when compared to men:

```r
data("Titanic")
apply(Titanic, c(2, 4), sum)
```

```
##         Survived
## Sex        No Yes
##   Male   1364 367
##   Female  126 344
```

---
## 
TSPG Prediction model
=====================

* TSPG uses the glm function to define the model

fit1 <- glm(Survived ~ Pclass + Sex + Age, data = tTrain, family = "binomial")

* This model is trained using the data downloaded from www.kaggle.com
[Note: The model needs to be tuned, cross validated, testsed and enhanced to 
improve predictions.] 

* TSPG uses the predict function to find out the survival probability.

prediction = predict(fit1, newdata = inpVal, type = "response")

