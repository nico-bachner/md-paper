---
draft: false
papersize: "a4"
fontsize: "12pt" # options: 10pt, 11pt, 12pt
twocolumn: false
oneside: true
titlepage: false

custom-margins: true
top: "3cm"
bottom: "3cm"
left: "2cm"
right: "2cm"

spacing: "double" # options: "onehalf", "double", false (= normal / one)

font-family: lmodern

headers-and-footers: true # toggle headers and footers
leftheader: "Session May 2021"
centerheader: "IBDP Internal Assessment"
rightheader: "Physics"
centerfooter: \thepage

toc: true # toggle table of contents
toc-depth: "4"

header-includes: | # import additional LaTeX packages and create custom commands here
  \usepackage{
    euler, siunitx
  }

#             __              ___________
#           /    \           |   ______   \
#          /  /\  \          |  |_____ \   \
#         /  /  \  \         |  |      \|   |
#        /  / /\ \  \        |  |______/   /|
#       /  /_/__\_\  \       |   _______   \/  
#      /   ________   \      |  |_______ \  \
#     /  / |______| \  \     |  |        \|  |
#    /  / /        \ \  \    |  |________/  /|
#   /__/ /          \ \__\   |_____________/ /
#   |__|/            \|__|   |_____________|/    

title: |
  **The Doppler Effect** \
  *How does the Doppler Effect affect sound emitted from a source travelling in a circular motion?*
author: | 
  Nico Bachner \
  Candidate Number: 123456 789
date: \today

abstract: false
---

# Introduction
As a musician, I find the physics behind music and sound in general to be extremely fascinating. As I discovered the doppler effect, I was immediately intrigued by its potential effect on music, hence this report. 

I will be analysing the effect of the Doppler Effect on a sound source undergoing circular motion.

# Experiment Setup
Here's a little diagram of the experiment setup:
\begin{figure}[H]
  \centering
  \includegraphics[width=0.6\textwidth]{setup.jpg}
  \label{setup}
  \caption{The setup of the experiment}
\end{figure}
A speaker is attached to the end of a rope of variable length. The rope is held by a person standing exactly 5 metres away from a microphone.

# Data
## 2 metre rope
Figures \ref{fig:2m} and \ref{fig:2m2} plot the data points I collected when the radius of the string was 2 metres long.

\begin{figure}[H]
  \centering
  \includegraphics[width=\textwidth]{2m.png}
  \label{fig:2m}
  \caption{The variation of a 300Hz sound - Radius: 2m - 1st try}
\end{figure}

\begin{figure}[H]
  \centering
  \includegraphics[width=\textwidth]{2m2.png}
  \label{fig:2m2}
  \caption{The variation of a 300Hz sound - Radius: 2m - 2nd try}
\end{figure}

## 3 metre rope
Figures \ref{fig:3m} and \ref{fig:3m2} plot the data points I collected when the radius of the string was 3 metres long.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.9\textwidth]{3m.png}
  \label{fig:3m}
  \caption{The variation of a 300Hz sound - Radius: 3m - 2nd try}
\end{figure}

\begin{figure}[H]
  \centering
  \includegraphics[width=\textwidth]{3m2.png}
  \label{fig:3m2}
  \caption{The variation of a 300Hz sound - Radius: 3m - 3rd try}
\end{figure}

# Results
This is the equation of the effect of the doppler effect on an sound emitted from a source traveling towards the observation point:
\begin{equation}
  f' = \frac{ v }{ v - v' } f
\end{equation}
$v$ here is the speed of sound in air. Since the air temperature at the time of the experiment was 14.7 degrees celsius, the speed of sound in air is approximately $340ms^{-1}$. This gives the following:
\begin{equation}
  f' = \frac{ 340ms^{-1} }{ 340ms^{-1} - v' } f
\end{equation}
We also know the frequency of the wave since it was set at the beginning of the experiment: 300Hz. Thus we get the following:
\begin{equation}
  f' = \frac{ 340ms^{-1} }{ 340ms^{-1} - v' } * 300Hz
\end{equation}
Since the motion of our object is circular, some modifications have to be made. $v'$ can be rewritten as follows:
\begin{equation}
  v' = l * 2 \pi \omega
\end{equation}

- $\omega$ being the rotational frequency of the swinging motion and 
- $l$ being the length of the rope.

This is, however, only the maximum frequency. The minimum frequency would be the negative of the value.

Consequently, we get the following equation:
\begin{equation}
  f' = \frac{ 340ms^{-1} }{ 340ms^{-1} - l * 2 \pi \omega } * 300Hz
\end{equation}

- For the string at distance 2 metres, this gives the following:
\begin{equation}
  \begin{split}
    f' &= \frac{ 340ms^{-1} }{ 340ms^{-1} - l * 2 \pi \omega } * 300Hz \\
    &= \frac{ 340ms^{-1} }{ 340ms^{-1} - 2m * 2 \pi \frac{4}{5} } * 300Hz \\
    &= \frac{ 340ms^{-1} }{ 340ms^{-1} - 2m * 5.03 } * 300Hz \\
    &= \frac{ 340ms^{-1} }{ 340ms^{-1} - 10.06ms^{-1} } * 300Hz \\
    &= \frac{ 340ms^{-1} }{ 329.94ms^{-1} } * 300Hz \\
    &= 1.03 * 300Hz \\
    &= 309Hz
  \end{split}
\end{equation}
If we look at both figures \ref{fig:2m} and \ref{fig:2m2}, we can see that the maximum frequency is in fact around 309 - 310Hz, a surprisingly accurate result

- For a string of length 3 metres, we get the following:
\begin{equation}
  \begin{split}
    f' &= \frac{ 340ms^{-1} }{ 340ms^{-1} - l * 2 \pi \omega s^{-1} } * 300Hz \\
    &= \frac{ 340ms^{-1} }{ 340ms^{-1} - 3m * 2 \pi \frac{7}{5} s^{-1} } * 300Hz \\
    &= \frac{ 340ms^{-1} }{ 340ms^{-1} - 3m * 8.80s^{-1} } * 300Hz \\
    &= \frac{ 340ms^{-1} }{ 340ms^{-1} - 26.4ms^{-1} } * 300Hz \\
    &= \frac{ 340ms^{-1} }{ 313.6ms^{-1} } * 300Hz \\
    &= 1.08 * 300Hz \\
    &= 324Hz
  \end{split}
\end{equation}
If we look at both figures \ref{fig:3m} and \ref{fig:3m2}, we can see that the maximum frequency is in fact around 314Hz, which is quite far off the prediction of 324Hz.

# Error Discussion
There were a few potential sources of error during the experiment:

- The measurement method of the air temperature (error margin of the thermometer)
- The frequency outputted by the speaker may not be 100% accurate
- The microphone error margin
- Noise pollution from surroundings (especially responsible for extreme outliers)
- Measurements were made 20 - 50 times per second; 100 times per second may be more accurate
- The person swinging the rope may not hold their arm exactly in the same place during their swing. This would lead to the results being as if length of the rope was actually longer.
- The distances measured such as: the distance between the circle origin and the microphone not being exactly 5 metres

Here are some realistically possible changes to improve on the experiment:

- Instead of a human swinging the rope, use a spinning device (would be difficult to start the swinging motion though)
- Hold the experiment further away from any noise pollution (such as an open field outside of the city)
- Take measurements more frequently (100/s instead of 50/s)

# Conclusion
tbd after feedback

# References
The physics textbook \
Online calculator for speed of sound in air: https://keisan.casio.com/exec/system/1258121716