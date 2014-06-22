library(shiny)
shinyUI(fluidPage(
        titlePanel("Titanic: Survival Probability Guessing Game"),  
      
        mainPanel(
                h4('Passenger Details'),
                h5('Class: Socio-economic Status'),
                textOutput('pclass'),
                h5('Sex'),
                textOutput('sex'),
                h5('Age'),
                textOutput('age'),
                br(),
                br()
        ),     
        
        fluidRow(
                column(2, 
                       selectInput("yourGuess", label = h4("Guess Survival Probability in Percent"), 
                                   choices = list("Retry", 0, 10, 20, 30, 40, 50, 60, 70, 80,
                                                  90, 100), selected = 1),
                       br(),
                       h4('Number of Consecutive Correct Guesses:'),
                       textOutput('numCorr'),                                        
                       h5('Instructions to play:'),
                       h5('Select Survival Probability using Passenger Details')
                       )
        ),
        
        mainPanel(
                h4("Result:"),
                textOutput('rtOrWrong'),
                br(),
                h4('Did you know that:'),
                textOutput('retry')
        )
))
