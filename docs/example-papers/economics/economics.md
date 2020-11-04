---
document-type: report

papersize: "a4"
fontsize: "12pt" # options: 10pt, 11pt, 12pt

custom-margins: true
top: "3cm"
bottom: "3cm"
left: "2cm"
right: "2cm"

spacing: "double" # options: "onehalf", "double", false (=normal / one)

font: lmodern

headers-and-footers: true # toggle headers and footers
leftheader: "Session May 2021"
centerheader: "IBDP Extended Essay"
rightheader: "Economics"
centerfooter: \thepage

table-of-contents: true # toggle table of contents
toc-depth: "4"

header-includes: | # import additional LaTeX packages and create custom commands here
  \bibliographystyle{unsrt}
  \usepackage{
    textcomp,
    float,
    hyperref,
    xcolor,
    url,
  }

title: |
  **Road Pricing for Luxembourg** \
  *Should the City of Luxembourg introduce road user charges?*
author: | 
  Nico Bachner \
  Candidate Number: jcp633
date: \today
---

# Reasons for choice
Road pricing is a personal interest of mine. Since I am an avid cyclist, I dislike overly congested streets. They pollute the air and waste many people's time. Sadly, Luxembourg has a very car-focused culture. We own almost 1 vehicle per capita \cite{lux2019vehicles} \cite{lux2020vehicles} and 0.676 passenger cars per person - the highest number in Europe. \cite{lux2018vehicles}

My aim is to explore ways to reduce automobile traffic in Luxembourg, and the most reasonable option to pursue with that goal in mind is through road pricing.

# Introduction
Road pricing (especially congestion charges) is becoming ever more popular. Big cities such as Singapore, London and Stockholm already have well established road pricing systems, and smaller cities are now also falling into their footsteps. [citation needed]

Considering this, it is time to consider the viability of introducing a road usage charge in the city of Luxembourg, which is what I will be attempting to scratch the surface of in this essay.

Luxembourg has a unique situation when it comes to traffic. About 300.000 people living in Germany, France or Belgium go to work in Luxembourg, which leads to Luxembourg's population increasing by 50% by day. The vast majority of these so-called "frontaliers" work in Luxembourg City, meaning the city almost quadruples in size during the day. While this is also a phenomenon that can be observed in large cities such as London or Paris, the relative scale is vastly larger in Luxembourg.

Figure \ref{lux-sat} shows the city of Luxembourg. As you can see, there are 3 main ways of entering the city (N, ENE and S). There are of course also other side roads that can be used, especially from S to W, but these 3 main arteries are jam-packed during rush hour. Even in off-peak times, the traffic can be significant. 

\begin{figure}[H]
  \centering
  \includegraphics[width=\textwidth]{lux-sat.png}
  \label{lux-sat}
  \caption{Luxembourg}
\end{figure}

# Road Pricing - Literature Review
## A brief History of Road Pricing
The term "road pricing" was first mentioned by Prof. Arthur Pigou in 1920 \cite{pigou1920economics}. Economists such as Reuben Smeed and Clifford Sharp published papers on the subject throughout the 60's. \cite{smeed1968traffic} \cite{sharp1966congestion} The first successfull real-world implementation of road pricing was the Area Licensing Scheme in Singapore. \cite{land1996world} However, due to generally strong political opposition, schemes such as the ones in Hong Kong from 1983 to 1985 \cite{hau1990electronic} and New York in 2007 ended up failing. Others, such as the London scheme introduced in 2003, endured.

## Benefits of Road Pricing
Road Pricing has the potential to be highly beneficial if implemented correctly. It lessens traffic jams, which makes it more environmentally friandly (both because of decreased emissions and the use of less raw materials). Less traffic also improves the liveability of the city implementing road pricing [reference needed]. It may even reduce the number of traffic accidents.

The revenue generated from road pricing also contributes to government income, which enables higher amounts of investment into public transport.

## Road Pricing Globally
### Singapore 
#### Area Licensing Scheme (ALS)
The Singapore Area Licensing Scheme was introduced in 1975 \cite{singapore2016erp} and is the first successful implementation of road pricing worldwide. 

Initially, the charge was limited to the hours of 7.30 am to 9.30 am, but in 1994, this was extended to be the entire day (24h).

The number of vehicles entering the road pricing zone after its 1975 introduction was 7.700 vehicles compared to 32,500 prior to the introduction of the ALS (a 76% reduction). 9% of people switched to public transport. Public transport usage also sharply increased for work related trips to the city centre (from 33% to ±70% ).

The scheme was extended to motorways under the Road Pricing scheme. \cite{singapore1998erp}

#### Electronic Road Pricing (ERP)
In 1998, a fully automised system named ERP replaced the previous manual ALS. As with the ALS, singapore was the first city worldwide that introduced an electronic system to collect road user charges. The system works with a signalling chip installed on the car's dashboard, a system similar to the french highway toll. This means that vehicles don't have to stop or slow down to pay tolls.
An area extension was introduced in 1999. \cite{singapore1998erp}

### London
#### Automobile Usage Changes
The planning of the London congestion charge started in 1965, one year after the publication of the Smeed report. \cite{smeed1968traffic} Additional studies were undertaken in 1973 and 1995. 

The charge was finally introduced in 2003 and was the biggest road pricing scheme in the world at the time. To make the transition to the charge run as smoothly as possible, Transport for London (TfL) increased the number of buses in circulation to cope with an increase in public transport usage. However, due to the inelastic nature of car usage, the congestion charge did not have lead to a significant increase in public transport usage.

The first day saw decrease of traffic of around 25%. However, this was in part due to it being a school holiday (traffic increased by 5% again after the holiday). The impact was most pronounced on the amount of trips outside of the rush hour, while rush hour traffic itself was not impacted much. 

All in all, around 50% of this number switched to public transport, while ±20% of these avoided the zone. ±15% switched to car sharing solutions. The final ±15% simply reduced their amount of journeys to the city centre, or travelled after the designated hours of the charge. There was also an increase in the use of motorbikes and bicycles. 

#### Congestion
On average, journey times became ±14% shorter, as well as the amount of fluctuation of travel time for a specific route. 

\begin{quote}
  "Congestion has reduced by 30 per cent in the zone"
  - Transport for London, 2004 \cite{london2004report}
\end{quote}

#### Emissions
\begin{quote}
  "Traffic emissions are down 12 per cent"
  - Transport for London, 2004 \cite{london2004report}
\end{quote}

#### Financial Aspect
Initially, the scheme was incurring losses, since building the infrastructure required for effective road pricing cost more than the revenue generated from charges.

#### Economic impact
While the charge caused fewer people to visit the zone daily, the charge was responsible for only a small drop in retail sales.

### Stockholm
The scheme started as a seven-month trial (from 3 January 2006 to 31 July 2006) and was implemented permanently in August 2007

The congestion tax was established in order to reduce traffic, especially congestion, and to improve the environment in central Stockholm. The income from the scheme was to be used to build new roads in and around the city.

The initial seven-month trial in 2006 reduced traffic by ±25% on average.

In 2016, the road usage charge was increased in the inner-city parts of Stockholm.

#### Political debate
A referendum about the permanent implementation of the road pricing scheme was held in September 2006. In the referendum the residents of Stockholm municipality voted in favour, but the other 14 municipalities in the greater area voted against it.

The permanent implementation of the congestion tax was approved in 2007 and went into effect promptly.

### Luxembourg
Luxembourg City currently has no form of road pricing. However, there is a nation-wide anual tax on owning a vehicle [reference needed]. There is also a national road toll for trucks weighing more than 12 tons. The toll amount depends on the truck's size and its vehicle emissions class. \cite{lux2020toll}

## Hypothesis
Based on the available theoretical literature and case studies of applications in other cities, I hypothesize the following: 
\begin{quote}
  Introducing a road user charge will have an overall positive outcome due to it decreasing automobile use, thus decreasing negative factors such as pollution and time waste through traffic jams. \cite{smeed1968traffic} \
  However, negative externalities may accompany an implementation of road pricing, such as an increase in social inequality due to driving a car becoming a status symbol (although it could be argued that it already is) [citation needed]
\end{quote}

I will try to find out if this hypothesis is applicable to an implementation of road pricing in Luxembourg.

# Data
In february 2019, 549379 vehicles were registered in luxembourg. \cite{lux2019vehicles}

# Implementation
- Will delivery services be exempt from the tax? 
- What methods to use to enable and enforce charges? 

\begin{figure}[H]
  \centering
  \includegraphics[width=0.9\textwidth]{lux.png}
  \label{lux}
  \caption{Luxembourg}
\end{figure}

# Predictions
## Immediate Impact
### Impact of general car usage
Luxembourg's automobile usage is highly inelastic, even when compared to other countries. But if we assume the impact of the road usage charge in Luxembourg is similar to that of London and Stockholm, perhaps a bit less due to the especially inelastic nature of car usage in Luxembourg, then we can approximate the decrease in daily automobile usage in the city by about 20%.

### Resulting Impact on public transport usage
If we take london as an example, a 20% decrease in car usage would result in a around 10% increase in public transport usage.

### Resulting Impact on Traffic Jams & Time spent travelling
...

### Resulting Impact on Accidents 
...

### Resulting Impact on the Environment
...

### Government Revenue & Impact on Public Transport
Road usage fees contribute to government budget and thus can be used to improve public transport.

## Social Consequences
- Impact on individual social classes 
  - Will a congestion charge increase social inequality?
- Impact on the “frontaliers” 

## Political Viability (Public Opinion)
...

# Discussion of Approach
...

## A fairer road pricing
- Instead of flat-fee road pricing, an idea would be to introduce road pricing based on income. This way, the social inequality of road pricing will be eliminated and public transport no longer seen as "transport for the poor".

# Conclusion
...

Question to leave with:
...


\newpage
\bibliography{bibliography}


\newpage

# RPPF
- Idea proposal meeting: ...

- Research meeting: ...

- Final draft meeting: [yet to be had]