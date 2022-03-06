# Head in the Game: Examining the Relationship Between Gaming and Mental Health


**Authors**

|Name|Email|
|-|-|
|Simon Cao |<purunc@uw.edu>|
|Lilah Favour |<lfavour@uw.edu>|
|Elora Hoberecht |<elorahob@uw.edu>|
|Xuanyu Chen |<xuanyc2@uw.edu>|
|Han Wang|<hanw27@uw.edu>|

**Affiliation**

INFO-201: Technical Foundations of Informatics

The Information School - University of Washington

*Winter Quarter 2022*

## Abstract

Our main question is what is the relationship between gaming and mental health, specifically anxiety. This question is important because gaming has become a popular pastime among people with various backgrounds and people who play games have often been characterized as antisocial and awkward, traits also associated with anxiety. To address this question we will perform various analyses on a dataset containing survey responses from gamers about their gaming habits, mental health, and socioeconomic background to see if there really is a trend.

## Keywords
Anxiety, Mental Health, Online Gaming, Psychology, Videogames

## Introduction
Despite the rapid advancement of technology and online environments in many aspects of our daily lives, video games are continuing to develop exponentially, and gaming communities are also growing. Along with being fun and entertaining, gaming can help people connect with each other, creating a sense of community as they work together to complete common tasks. Half of all Americans, 164 million people, play video games, also called gaming. Gaming isn't just for teens, as popular belief would have you believe. According to a survey in 2019, only 21% of gamers were under 18 years old (Grinspoon, 2020). However, despite the benefits of gaming (even as it becomes a competitive sport on many college campuses), too much gaming is linked to health risks, and mental health issues arise among this growing body of diverse gamers.
In this project, we are going to perform an analysis based on results from a series of questions, and also try to ravel out the relationship between the gaming habits of gamers and the latent mental health issues.

## Design Situation

**Project Framing:**

We hope to better understand how mental health and gaming habits are connected. Some research in the past has indicated that excessive gaming can contribute to negative mood and psychological well-being, such as increased depression/anxiety or the development of gaming addictions (Bhargava, H., 2021, Kowal, M., et al., 2021), while many users and other researchers find that gaming can serve as a very helpful stress reliever and help gamers relax or socialize with friends (Granic, I, et al., 2014).

**Human Values:**

The human values most important to our group in this project include human welfare and identity. We understand that for a lot of people who play games, being a 'gamer' is an important personal identity with a valuable social community where manny people can find a sense of belonging. Additionally, we hope to better understand how gaming impacts mental health, to help future researchers, designers, and practitioners make more informed decisions when choosing what kinds of games to play or modifying their own gaming habits to improve their overall well-being.

**Stakeholders:**

Gamers and game developers would be direct stakeholders, as they could be directly impacted by our findings and may find this data very useful. Members of the gaming community can use this information when deciding which games to play and how to play them, and developers may use this information to help facilitate healthy habits or create interactive worlds that minimize any harm and maximize any benefits that gaming provides to their players. Mental healthcare providers may also benefit from the findings/conclusions of this project, as it may provide new insights into how to best treat patients with conditions like depression and anxiety, or serve as a tool to help individuals struggling with social isolation (Kowal, M., 2021).
Our indirect stakeholders include children and teens, who may not interact directly with our project, but may be impacted by our findings, as nearly 97% of children in the US play some type of video game for at least an hour a day (Granic, I., 2014).

**Harms and Benefits:**

Harms: It would not be a stretch to imagine scenarios in which the information in our project could be potentially useful to corporations seeking to find new ways of marketing their games or gaming products to consumers, and those struggling with mood disorders or feeling especially isolated may be particularly prone to manipulation in this way.

Benefits: This data may benefit people struggling with mental health disorders. We hope that our findings can benefit those struggling with mental health disorders or suffering with the effects of social isolation. Our findings may inform mental health practitioners on the ways in which gaming can be a tool to help mitigate the symptoms of these disorders, or inspire parents to enforce healthy gaming habits with children and adolescents.

## Research questions

Through exploring and analyzing data from this dataset, we hope to answer the following questions:

* How does gaming affect mental health?

* Do different age groups matter with the relationship between gaming and mental health?

* How does gender affect the relationship between gaming and mental health?

* Do different countries or environments affect the relationship between gaming and mental health?

These questions are important because first, if we want to find valid data, we have to think about different groups. For example, an answer might work for one group but not for another. After collecting datas using the survey, it is important to separate the data using different groups of people, so we can find if there is any pattern. Also, there might be different answers for different groups, too, for example, one age group might think that online gaming gives them anxiety and another might not.

## The Dataset
Our group intends to use the following dataset:
[Gaming Habits and Psychological Well-being: An international dataset about the Anxiety, Life Satisfaction and Social Phobia of over 13000 gamers](https://osf.io/vyr5f/).

* The dataset contains about 13,000 data entries from gamers' survey results. We have identified 13 main variables of interest for our project:

    **Variables of Interest**

    |Variable[s]|   Type|     Explanation|
    |---|---|---|
    |Hours|         num|       Hours played|
    |streams|       num|       Additional hours dealing with games except playing|
    |Game|          char|      Game played the most|
    |SPIN_T and SPIN_T[1-17]|        num|       Social Phobia Inventory (SPIN) scores related data|
    |GAD_T and GAD[1-7]|       num|       Generalized Anxiety Disorder Screener (GAD-7) scores related data|
    |SWL_T and SWL[1-5]|         num|       Satisfaction with Life Scale (SWL) scores related data|
    |Narcissism|    num|       Score of the Single Item Narcissism Scale (SINS)|
    |Birthplace|    char|      Country of Birth|
    |Residence|     char|      Country of Residence|
    |Age|           num|       Age|
    |Work|          char|      Occupation status|
    |Degree|        char|      Highest degree|
    |Gender|        char|      Gender|

    The data is collected from 13464 gamers (12699 male, 713 female, 52 other) between 18 and 63 years. Participants resided in 109 different countries with most of the participants coming from the USA, Germany, the UK, and Canada. The participants responded to a call placed on Reddit and the survey was implemented in Google Forms. The surveys use industry-standard, scientifically validated assessments to gather mental health data, including:

     * **Social Phobia Inventory (SPIN)** is an effective tool screening for social anxiety disorder, developed by the Psychiatry department at Duke University.

     * **Generalized Anxiety Disorder Screener (GAD-7)** is an assessment used to screen for general anxiety disorder. This assessment was developed by Dr. Spitzer and his research team (who are affiliated with Pfizer) in 2006. Their work has been peer-reviewed and published, and the GAD-7 is widely-used in clinical settings today.

     * **Satisfaction with Life Scale (SWL)** This scale was developed to assess general life satisfaction.  first created in 1985 by a team of researchers, published in an article of the Journal of Personality Assessment. The scale is not capable of assessing satisfaction in specific life domains, such as family or health, but captures a snapshot of overall satisfaction.

     * **Single Item Narcissism Scale (SINS)** This screening assessment is very brief, with only a single question. This tool is controversial in the field as it is imprecise compared to other, lengthier Narcissism assessment tools that are used in the field. This assessment was developed by Sara Konrath and her research team in 2014, published in an article by the National Institute of Health (NIH).




#### *Who collected the data?*

  The data was collected in 2017 by 2 university researchers from Germany: Marian Sauter and Dejan Draschkow as part of a peer-reviewed research project.

(General and Experimental Psychology, Ludwig-Maximilians-Universität München, Munich, Germany)

(Scene Grammar Lab, Goethe University Frankfurt, Frankfurt am Main, Germany)


#### *For what purpose was this dataset created?*

  The dataset is gathered with a purpose of allowing more investigation into the relationship between excessive video game usage, well-being, and psychological disorders.
  

#### *How was the data collection effort funded? Who is likely to benefit from the data or make money?*

The authors declare that the research was conducted in the absence of any commercial or financial relationships that could be construed as a potential conflict of interest.



## 5.0 Findings  (about 400 words or less)

After analyzing the data, we have made several observations related to our research questions:

#### How does gaming affect mental health?

Words go here.

#### Does age affect the relationship between gaming and mental health?

Words go here.

#### How does gender affect the relationship between gaming and mental health?

Words go here.

#### Do different countries or environments affect the relationship between gaming and mental health?

Words go here.

## 6.0 Discussion  (about 400 words)

Our findings suggest that there may be a neutral relationship between gaming and mental health, which is important because this challenges the belief that gaming is psychologically harmful. Unfortunately, our dataset was limited in that the majority of respondents played multiplayer titles, specifically *League of Legends*, which is notorious for its toxic fanbase.  It is possible that our findings are not really related to gaming directly, but highlight the benefits of socialization and the sense of community that is available through this medium. Individuals who are socially isolated in the real-world may benefit from using online gaming as a way to establish relationships and build friendship with other people they wouldn't otherwise interact with. 

The fact that respondents had a 'below average' life satisfaction score overall could indicate several possibilities; it may be that playing League of Legends has a poor effect on life satisfaction. It could also suggest that gaming negatively impacts life satisfaction, or perhaps those feeling unsatisfied with life are more likely to use gaming as a form of escapism. It is most probable, however, that there are other factors that influence both gaming habits and life satisfaction that were not measured in this dataset or revealed by our analysis.  This means our findings may not be applicable to the broader gaming community, but show an important area on which future research can focus. Additionally, we found it interesting that users were generally in the 'low-risk' category for social anxiety and general anxiety disorders-- it is possible that gaming can help relieve anxiety. Unfortunately, due to the limited sample population, we do not have enough information to establish a causal relationship, nor can we apply these findings to any real-world population beyond male League of Legend players in the United States. More research is needed to better understand the relationships between gaming and mental health. 

### TODO: Analyze the visuals


## 7.0 Conclusion.  (about 100 words or less)

### TODO: Give the reader a summary point, the key point that you will like your audience to leave with.

## Acknowledgements

We would like to thank Marian Sauter and Dejan Draschkow for collecting the data and sharing it online for free. This project would not have been possible without their expansive data set and research efforts.

## References

Bhargava, H. (2021, October 5). Hiding in plain sight: The impact of gaming on Mental Health. Forbes. https://www.forbes.com/sites/hansabhargava/2021/10/04/hiding-in-plain-sight-the-impact-of-gaming-on-mental-health/?sh=7f9b1325278d

Kowal, M., Conroy, E., Ramsbottom, N., Smithies, T., Toth, A., & Campbell, M. (2021). Gaming Your Mental Health: A Narrative Review on Mitigating Symptoms of Depression and Anxiety Using Commercial Video Games. JMIR serious games, 9(2), e26575. https://doi.org/10.2196/26575

Granic, I., Lobel, A., & Engels, R. C. M. E. (2014). The benefits of playing video games. American Psychologist, 69(1), https://doi.apa.org/doiLanding?doi=10.1037%2Fa0034857

Draschkow, D., & Sauter, M. (2017, October 30). Gaming habits and psychological well-being: An international dataset about the anxiety, life satisfaction and social phobia of over 13000 gamers. OSF. https://osf.io/vyr5f/

Grinspoon, P., MD. (2020, December 22). The health effects of too much gaming. Harvard Health. https://www.health.harvard.edu/blog/the-health-effects-of-too-much-gaming-2020122221645

## Appendix A: Relevant Materials

 ### TODO: Include the survey questions here.
