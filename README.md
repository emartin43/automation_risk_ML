# automation_risk_ML

Replicates and builds on Frey and Osborne’s (2013) findings to determine what occupations are at risk of automation using recent occupational data. We run a quadratic discriminant analysis to determine the probabilities of automation as well as incorporate a probit model to find marginal effect of each automation bottleneck on computerization risk. We find that 342 of the occupations analyzed are at a high risk of automation, which is around 39.2% of the total Department of Labor occupational database. Future research would benefit from creating a framework for studying the automatability of occupations. 

### My goal for this project:
The goal of this project is to provide an statistics-based companion paper to my more theory/literature-based thesis paper on automation-induced inequality. Before writing this research project, I had never worked with machine learning before, especially independently. That is why this paper is more aiming to replicate Frey and Osborne's study with more recent data rather than writing a completely novel paper. 

### What I learned from this project:
I learned quite a bit from this project. Firstly, all of the machine learning aspects of this paper was completely new to me. I learned quite a few important terms and how different kinds of machine learning methods achieve different goals. I learned that it's okay to go into a project without knowing everything and that it's important to be patient with yourself and your data. Additionally, there was a point where I got completely stuck with the QDA code and I did not know what I was doing incorrectly. Left with few machine learning resources at my college and complicated Internet forums, I decided to email Frey and Osborne directly to see how they set up their data. Luckily enough, they emailed me back the next day with the spreadsheet of their data, I changed the layout of my data, and the rest fixed itself. Humility is something that is extremely important in academics and the data science industry, in general; it's essential for helping to foster a welcoming community for all, especially for those from underserved and underrepresented backgrounds. 

### If I had more time I would change:
Future research would benefit from creating a framework for studying the automatability of occupations. Using O*NET is a helpful, important database, but having a framework that concerns itself with metrics and indicators that exist to serve the goals that automation researchers care about is of utmost importance. Right now, there is plenty of conflicting literature on the severity of automation in the next few decades, whether tasks and occupations will be replaced or enhanced, or whether anyone should even be concerned about technological disruptions, in the first place. Before that framework is implemented, researchers will continue to struggle to estimate the effect of automation on the labor market. In other words, trying to predict what effects automation will have in the future is a question that cannot be answered conclusively in a non-deterministic framework. Furthermore, when scholars take the raw numbers that studies like this one and Frey and Osborne’s supply without reflecting carefully, they are at risk of implicitly accepting the normative orientation of these studies and thereby missing the, perhaps, central discussions that should take place.

### Available Files:
### [Data Cleaning R Script](https://github.com/emartin43/automation_risk_ML/blob/659b44e37e5a397e77af9ea702207944998a4d92/Cleaning.R)
### [ML R Script](https://github.com/emartin43/automation_risk_ML/blob/659b44e37e5a397e77af9ea702207944998a4d92/ML.R)
### [Probit R Script](https://github.com/emartin43/automation_risk_ML/blob/659b44e37e5a397e77af9ea702207944998a4d92/Probit.R)
### [Visualizations R Script](https://github.com/emartin43/automation_risk_ML/blob/cf44db431b4f75efeba685203c69938499fdd4b9/Visualizations%20.R)
### [Final Combined Data](https://github.com/emartin43/automation_risk_ML/blob/cf44db431b4f75efeba685203c69938499fdd4b9/final.csv)


![image](https://user-images.githubusercontent.com/85309853/198832654-6e461675-aea2-4e37-a79c-a4aad51895d4.png)

