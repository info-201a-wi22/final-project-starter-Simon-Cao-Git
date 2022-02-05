# Head in the Game: Examining the Relationship Between Gaming and Mental Health

**Code Name**

**S.E.G.A** (**S**tudents **E**xploring **G**aming & **A**nxiety) 

**Authors**

|Name|Email|
|-|-|
|Simon Cao |<purunc@uw.edu>|
|Lilah Favour |<lfavour@uw.edu>|
|Elora Hoberecht |<elorahob@uw.edu>|
|Xuanyu Chen |<xuanyc2@uw.edu>|
|Han Wang|<hanw27@uw.edu>|

**Affiliation**

INFO-201 Winter 2022: Technical Foundations of Informatics

The Information School - University of Washington

## Abstract

Our main question is what is the relationship between gaming and mental health, specifically anxiety. This question is important because gaming has become a popular pastime among people with various backgrounds and people who play games have often been characterized as antisocial and awkward, traits also associated with anxiety. To address this question we will perform various analyses on a dataset containing survey responses from gamers about their gaming habits, mental health, and socioeconomic background to see if there really is a trend.

## Keywords
Anxiety, Mental Health, Online Gaming

## Introduction
Despite the rapid advancement of technology and online environments in many aspects of our daily lives, video games are continuing to develop exponentially, and gaming communities are also growing. Along with being fun and entertaining, gaming can help people connect with each other, creating a sense of community as they work together to complete common tasks. Half of all Americans, 164 million people, play video games, also called gaming. Gaming isn't just for teens, as popular belief would have you believe. According to a survey in 2019, only 21% of gamers were under 18 years old (Grinspoon, 2020). However, despite the benefits of gaming (even as it becomes a competitive sport on many college campuses), too much gaming is linked to health risks, and mental health issues arise among this growing body of diverse gamers.
In this project, we are going to perform an analysis based on results from a series of questions, and also try to ravel out the relationship between the gaming habits of gamers and the latent mental health issues.

## Design Situation

**Project Framing:**

We hope to better understand how mental health and gaming habits are connected. Some research in the past has indicated that excessive gaming can contribute to negative mood and psychological well-being, such as increased depression/anxiety or the development of gaming addictions (Bhargava, H., 2021, Kowal, M., et al., 2021), while many users and other researchers find that gaming can serve as a very helpful stress reliever and help gamers relax or socialize with friends (Granic, I, et al., 2014).

**Human Values:**

The human values most important to our group in this project include human welfare and identity. We understand that for a lot of people who play games, being a ‘gamer’ is an important identity and valuable social community where people find belonging. Additionally, we hope to better understand how gaming impacts mental health, to help future researchers, designers, and practitioners make more informed decisions when choosing what kinds of games to play or modifying their own gaming habits to improve their overall well-being.

**Stakeholders:**

Gamers and game developers would be direct stakeholders, as they could be directly impacted by our findings and may find this data very useful. Members of the gaming community can use this information when deciding which games to play and how to play them, and developers may use this information to help facilitate healthy habits or create interactive worlds that minimize any harm and maximize any benefits that gaming provides to their players. Mental healthcare providers may also benefit from the findings/conclusions of this project, as it may provide new insights into how to best treat patients with conditions like depression and anxiety, or serve as a tool to help individuals struggling with social isolation (Kowal, M., 2021).
Our indirect stakeholders include children and teens, who may not interact directly with our project, but may be impacted by our findings, as nearly 97% of children in the US play some type of video game for at least an hour a day (Granic, I., 2014).

**Harms and Benefits:**

Harms: It would not be a stretch to imagine scenarios in which the information in our project could be potentially useful to corporations seeking to find new ways of marketing their games or gaming products to consumers, and those struggling with mood disorders or feeling especially isolated may be particularly prone to manipulation in this way.

Benefits: This data may benefit people struggling with mental health disorders. We hope that our findings can benefit those struggling with mental health disorders or suffering with the effects of social isolation. Our findings may inform mental health practitioners on the ways in which gaming can be a tool to help mitigate the symptoms of these disorders, or inspire parents to enforce healthy gaming habits with children and adolescents.

## Research questions
How does gaming affect mental health?

Do different age groups matter with the relationship between gaming and mental health?

How does gender affect the relationship between gaming and mental health?

Do different countries or environments affect the relationship between gaming and mental health?

## The Dataset
Our group intend to use the dataset:
[Gaming Habits and Psychological Well-being: An international dataset about the Anxiety, Life Satisfaction and Social Phobia of over 13000 gamers](https://osf.io/vyr5f/).

* Who or what is represented in the data? What is an observation? What variables are included (and excluded)?
The dataset contains about 13,000 data entries from gamers’ survey results and has 13 main variables of interest.
    
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
    
    The data is collected from 13464 gamers (12699 male, 713 female, 52 other) between 18 and 63 years. Participants resided in 109 different countries with most of the participants coming from the USA, Germany, the UK, and Canada. The participants responded to a call placed on Reddit and the survey was implemented in Google Forms.

* Who collected the data? When? For what purpose? How was the data collection effort funded? Who is likely to benefit from the data or make money?

    The data was collected in 2017 by 2 university researchers from Germany: Marian Sauter and Dejan Draschkow.

    (General and Experimental Psychology, Ludwig-Maximilians-Universität München, Munich, Germany)

    (Scene Grammar Lab, Goethe University Frankfurt, Frankfurt am Main, Germany)
    
    The dataset is gathered with a purpose of allowing more investigation of the relationship between excessive video game usage, well-being, and psychological disorders, and the authors declare that the research was conducted in the absence of any commercial or financial relationships that could be construed as a potential conflict of interest.

* How was the data validated and held secure? Is it credible and trustworthy?
    
    The dataset is validated as the full survey, dataset, preprocessing, as well as example analysis scripts are openly available online and is a product of a peer-reviewed research project.

* How did you obtain the data? Do you credit the source of the data?
    
    As the dataset is open source, our group will use the dataset freely from its publishing site and credit the source.

## Expected Implications
With more detailed relationships between gaming and mental health proved by data, technologists and designers (from game companies) could potentially provide more support in response to the mental health issue in gaming experience. For example, game developers could adopt game designs that prevent swearing and ease blaming between players; similarly, mechanisms that encourage more cooperation and provide more positive feedback to players could be built into existing frameworks.
For policymakers, on the other hand, more restrictions could be applied to game companies to ensure they prioritize mental health in the entire life-cycle of game-development and operation. For instance, policies that mandate mental health support resources could be made, and potentially, an annual report on mental health profiles of the player-base could be requested by government officials.

## Limitations
By examining the dataset, our group noticed that the data is mainly from male gamers; also, the gamers that participated in this survey are mainly younger generations and from the western countries. 
Also, as the dataset is mainly gathered from Reddit and the survey is voluntary, there might be unforeseen limitations to the survey population.
As a result, the conclusion may not apply well to all players, especially female players, older generations, and players in other regions; thus, we need to be careful when making conclusions about gamers in general.


<!-- # Title of your Project: Project Proposal

**TODO**: Edit this file. Your project proposal goes here. Save and delete the developer notes when done.

## Developer Notes

* **Where is the project brief?**  [`../instructions/project-design-brief.pdf`](../instructions/project-design-brief.pdf).
* **Making Progress**: We understand this work might be difficult. Also, we understand that your project ideas might not be completely worked out. So, we ask that you do the best you can. You will receive specific guidance from your TA and constructive feedback. We are confident that you will succeed!
* **What should be included in the proposal?** Every proposal will be different. It depends on your particular project.  That said, in the table below you will find the expected report elements.  It is important that you engage with and respond to the the Design Brief.
* **How should the proposal be formatted?** You should format your proposal using Markdown in this file. You should aim for a professional presentation - clear, concise, interesting, and free of spelling and grammatical errors.
* **What headings should we use?** As needed, the suggested headings below can be revised and new headings and sub-headings can be added. Please use headings, bullet lists, tables, figures, and other markdown code effectively - seek a professional presentation.
* **Finishing up.** When you are finished writing and formatting your proposal, save these developer notes(they might useful in the future). Then, delete them.
* **Questions?** If you have questions, please ask your TA or post on Teams. -->


<!-- |Element | Brief Description|
|---------------| --------------
|Code name | Give your project a _code name_, a short, evocative name for efficiently referring to your project. Your code name does not change! Examples: _Jazz-4_, _Rocking Fish_, etc. |
|Project title| Give your project a concise, interesting title that summarizes the entirety of your project. (Your title can change on subsequent deliverables.) |
|Authors | Names of your team members and contact information (email addresses). |
|Affiliation |  INFO-201: Technical Foundations of Informatics - The Information School - University of Washington |
|Date | Winter 2022|
|Abstract | No more than three sentences that summarize your project. Focus on the very most important aspects. For example: **(1)** "Our main question is .... This question is important because .... To address the question, we will ...." **(2)** "We are concerned with ..., becuase .... To address this concern, we plan to ...." **(3)** "Consider that ....  This is important because .... Accordingly, we plan to ...."   |
|Keywords | 3-5 keywords that summarize your project.  (e.g., "Keywords: human physiology; bicycle exercise; elderly; power and heart rate times-series data") |
|1.0 Introduction | Briefly introduce your project. (about 150 words) |
|2.0 Design Situation | Use short sub-sections to describe your topic and the setting (that is, the sociotechnical situation), including project framing, human values, direct and indirect stakeholders, possible harms and benefits. See the Design Brief, section B.3. **Note**: You *must* include three citations to related work (URLs to similar work, high quality articles from the popular press, reseach papers, etc. ). You may find it helpful to include a figure.  (about 400 words) |
|3.0 Research questions | 3-5 research questions. What motivates the questions? Why are they important? See the Deign Brief, section B.4. (about 150 words) |
|4.0 The Dataset | See Design Brief, setions B.5 (_Size and complexity_) and B.6 (_Data provenance_). Use short sub-sections for describing the size and complexity of the dataset and for describing the origins fo the data. (about 400 words) |
|5.0 Expected Implications | Assuming you answer your research questions, briefly describe the expected or possible implications for technologists, designers, and policymakers. (about 150 words) |
|6.0 Limitations | What limitations might you need to address? Briefly discuss. (about 150 words) |
|Acknowledgements | Is there anyone you would like to thank? A librarian who helped you with your research? A Teaching Assistant? A friend who helped you find your data? Say thank you in this section.|
|References | Include citations to your three references. See 2.0 Introduction. If you like, you can cite more than three references.  Please use a standard citation style of your choice.  See [Citing Sources](https://guides.lib.uw.edu/research/citations) at the UW Library. |
|Appendix A: Questions| Do you have questions for your TA or instructor?  Include them here.| -->
