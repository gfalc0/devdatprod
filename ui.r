library(shiny)

shinyUI(
        navbarPage("Miles Per Gallon from MTCARS data",
                   tabPanel("Analysis",
                            fluidPage(
                                    titlePanel("The relationship between miles per gallon (MPG) and other variables"),
                                    sidebarLayout(
                                            sidebarPanel(
                                                    selectInput("variable", "Variable:",
                                                                c("Number of cylinders" = "cyl",
                                                                  "Displacement (cu.in.)" = "disp",
                                                                  "Gross horsepower" = "hp",
                                                                  "Rear axle ratio" = "drat",
                                                                  "Weight (lb/1000)" = "wt",
                                                                  "1/4 mile time" = "qsec",
                                                                  "V/S" = "vs",
                                                                  "Transmission" = "am",
                                                                  "Number of forward gears" = "gear",
                                                                  "Number of carburetors" = "carb"
                                                                )),
                                                    
                                                    checkboxInput("outliers", "Show BoxPlot's outliers", FALSE)
                                            ),
                                            
                                            mainPanel(
                                                    h3(textOutput("caption")),
                                                    
                                                    tabsetPanel(type = "tabs", 
                                                                tabPanel("BoxPlot", plotOutput("mpgBoxPlot")),
                                                                tabPanel("Regression model", 
                                                                         plotOutput("mpgPlot"),
                                                                         verbatimTextOutput("fit")
                                                                )
                                                    )
                                            )
                                    )
                            )
                   ),
                   
                   tabPanel("Getting started",
                            h2("Getting started with this application"),
                            hr(),
                            helpText("This application shows the relationship between the MPG and other",
                                     " variables."),
                            h3("Usage"),
                            p("Select the other variable with the drop down menu on the left;"),
                            p("Choose whether you want to display the boxplot or the regression model from the tab panels.")),
                            
                   tabPanel("Data in greater detail",
                            h2("Motor Trend Car Road Tests"),
                            hr(),
                            h3("Description"),
                            helpText("The data was extracted from the 1974 Motor Trend US magazine,",
                                     " and comprises fuel consumption and 10 aspects of automobile design and performance",
                                     " for 32 automobiles (1973-74 models)."),
                            h3("Format"),
                            p("A data frame with 32 observations on 11 variables."),
                            
                            p("  [, 1]   mpg         Miles/(US) gallon"),
                            p("  [, 2]	 cyl	 Number of cylinders"),
                            p("  [, 3]	 disp	 Displacement (cu.in.)"),
                            p("  [, 4]	 hp	 Gross horsepower"),
                            p("  [, 5]	 drat	 Rear axle ratio"),
                            p("  [, 6]	 wt	 Weight (lb/1000)"),
                            p("  [, 7]	 qsec	 1/4 mile time"),
                            p("  [, 8]	 vs	 V/S"),
                            p("  [, 9]	 am	 Transmission (0 = automatic, 1 = manual)"),
                            p("  [,10]	 gear	 Number of forward gears"),
                            p("  [,11]	 carb	 Number of carburetors"),
                            
                            h3("Source"),
                            
                            p("Henderson and Velleman (1981), Building multiple regression models interactively. Biometrics, 37, 391-411.")
                   )
        )
)