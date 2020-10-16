---
document-type: article

papersize: "a4"
fontsize: "12pt" # options: 10pt, 11pt, 12pt
section-numbering: true

custom-margins: true
top: "3cm"
bottom: "3cm"
left: "2cm"
right: "2cm"

spacing: "double" # options: "onehalf", "double", false (= normal / one)

font: lmodern
math-font: euler

header-and-footer: true
left-header: "Session May 2021"
center-header: "IBDP Internal Assessment"
right-header: "Physics"
center-footer: \thepage

table-of-contents: true # toggle table of contents
toc-depth: "4"

header-includes: | # import additional LaTeX packages and create custom commands here
  \usepackage{
    siunitx,
    amssymb,
    amsmath,
    textcomp,
    float,
    hyperref,
    url,
    tikz,
    pgf,
    pgfplots
  }
  \pgfplotsset{compat=1.17}

title: |
  **The Doppler Effect** \
  *How does the Doppler Effect affect sound emitted from a source travelling in a circular motion?*
author: | 
  Nico Bachner \
  Candidate Number: jcp633
date: \today
---
\newpage

# Introduction
As a hobby musician, I find the physics behind music and sound in general to be extremely fascinating. Upon discovering the Doppler Effect, I was intrigued by its possible effect on music, hence this report. \
I will be analysing the effect of the Doppler Effect on a sound source undergoing circular motion.

# Experiment Setup
Here's a little diagram of the experiment setup:
\begin{figure}[H]
  \centering
  \includegraphics[width=0.7\textwidth]{images/setup.jpg}
  \label{setup}
  \caption{The setup of the experiment}
\end{figure}
A speaker is attached to the end of a rope of variable length. The rope is held by a person standing exactly 5 metres away from a microphone.

# Predictions
This is the equation of the effect of the doppler effect on a sound emitted from a source traveling towards the observation point:
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
  v' = l * \omega
\end{equation}

- $\omega$ being the rotational frequency of the swinging motion and 
- $l$ being the length of the rope.

Consequently, we get the following equations for the maximum and minimum values:
\begin{equation}
  f'_{max} = \frac{ 340ms^{-1} }{ 340ms^{-1} - l * \omega } * 300Hz
\end{equation}
\begin{equation}
f'_{min} = \frac{ 340ms^{-1} }{ 340ms^{-1} + l * \omega } * 300Hz
\end{equation}

## 2 metre rope
For the string at distance 2 metres, the following predictions can be made for the maximum value:
\begin{equation}
  \begin{split}
    f'_{max} &= \frac{ 340ms^{-1} }{ 340ms^{-1} - l * \omega } * 300Hz \\
    &= \frac{ 340ms^{-1} }{ 340ms^{-1} - 2.00m * 5.03s^{-1} } * 300Hz \\
    &= \frac{ 340ms^{-1} }{ 329.94ms^{-1} } * 300Hz \\
    &= 309Hz
  \end{split}
\end{equation}
And for the minimum value:
\begin{equation}
  \begin{split}
    f'_{min} &= \frac{ 340ms^{-1} }{ 340ms^{-1} + l * \omega } * 300Hz \\
    &= \frac{ 340ms^{-1} }{ 340ms^{-1} + 2.00m * 5.03s^{-1} } * 300Hz \\
    &= \frac{ 340ms^{-1} }{ 350.06ms^{-1} } * 300Hz \\
    &= 291Hz \\
  \end{split}
\end{equation}

If we plot this, we get the following graph:
\begin{figure}[H]
  \centering
  \tikz{
    \begin{axis}[ ymajorgrids=true,xmajorgrids=true ]
      \addplot [domain=0:20,color=red,samples=300,thick] plot {9 * cos( 100 * x ) + 300};
      \draw (0.7,12.5) node {$y_6$};
    \end{axis}
  }
  \caption{Prediction of frequency variance with 2m rope}
  \label{fig:2m-prediction}
\end{figure}


## 3 metre rope
For a string of length 3 metres, we get the following maximum value:
\begin{equation}
  \begin{split}
    f' &= \frac{ 340ms^{-1} }{ 340ms^{-1} - l * \omega } * 300Hz \\
    &= \frac{ 340ms^{-1} }{ 340ms^{-1} - 3.00m * 8.80s^{-1} } * 300Hz \\
    &= \frac{ 340ms^{-1} }{ 313.6ms^{-1} } * 300Hz \\
    &= 325Hz
  \end{split}
\end{equation}
The minimum value is the following:
\begin{equation}
  \begin{split}
    f' &= \frac{ 340ms^{-1} }{ 340ms^{-1} + l * \omega } * 300Hz \\
    &= \frac{ 340ms^{-1} }{ 340ms^{-1} + 3.00m * 8.80s^{-1} } * 300Hz \\
    &= \frac{ 340ms^{-1} }{ 366.4ms^{-1} } * 300Hz \\
    &= 278Hz
  \end{split}
\end{equation}

Plotting this gives us:
\begin{figure}[H]
  \centering
  \tikz{
    \begin{axis}[ ymajorgrids=true,xmajorgrids=true ]
      \addplot [domain=0:30,color=red,samples=300,thick] plot { 23 * cos( 50 * x ) + 301 };
      \draw (0.7,12.5) node {$y_6$};
    \end{axis}
  }
  \caption{Prediction of frequency variance with 2m rope}
  \label{fig:2m-prediction}
\end{figure}

# Data
## 2 metre rope
Figures \ref{fig:2m-1} and \ref{fig:2m-2} plot the data points I collected when the radius of the string was 2 metres long.

\begin{figure}[H]
  \centering
  \tikz{
    \begin{axis}[x=.7cm,xmin=-.5,xmax=16.5,ymajorgrids=true,xmajorgrids=true]
      \addplot table [x index=0,y index=1,col sep=comma] {graphs/2m-1.csv};
    \end{axis}
  }
  \caption{The variation of a 300Hz sound at radius 2m - 1st try}
  \label{fig:2m-1}
\end{figure}

\begin{figure}[H]
  \centering
  \tikz{
    \begin{axis}[x=.7cm,xmin=-.5,xmax=20.5,ymajorgrids=true,xmajorgrids=true]
      \addplot table [x index=0,y index=1,col sep=comma] {graphs/2m-2.csv};
    \end{axis}
  }
  \caption{The variation of a 300Hz sound at radius 2m - 2nd try}
  \label{fig:2m-2}
\end{figure}

## 3 metre rope
Figures \ref{fig:3m-1}, \ref{fig:3m-2} and \ref{fig:3m-3} plot the data points I collected when the radius of the string was 3 metres long.

\begin{figure}[H]
  \centering
  \tikz{
    \begin{axis}[x=1cm,xmin=-.5,xmax=10.5,ymajorgrids=true,xmajorgrids=true]
      \addplot table [x index=0,y index=1,col sep=comma] {graphs/3m-1.csv};
    \end{axis}
  }
  \caption{The variation of a 300Hz sound at radius 3m - 1st try}
  \label{fig:3m-1}
\end{figure}

\begin{figure}[H]
  \centering
  \tikz{
    \begin{axis}[x=1cm,xmin=-.5,xmax=14.5,ymajorgrids=true,xmajorgrids=true]
      \addplot table [x index=0,y index=1,col sep=comma] {graphs/3m-2.csv};
    \end{axis}
  }
  \caption{The variation of a 300Hz sound at radius 3m - 2nd try}
  \label{fig:3m-2}
\end{figure}

\begin{figure}[H]
  \centering
  \tikz{
    \begin{axis}[x=1cm,xmin=-.5,xmax=14.5,ymajorgrids=true,xmajorgrids=true]
      \addplot table [x index=0,y index=1,col sep=comma] {graphs/3m-3.csv};
    \end{axis}
  }
  \caption{The variation of a 300Hz sound at radius 3m - 3rd try}
  \label{fig:3m-3}
\end{figure}

# Results
If we look at both figures \ref{fig:2m-1} and \ref{fig:2m-2}, we can see that the maximum frequency is in fact around 309 - 310Hz, a surprisingly accurate result compared to the predicted value. \
The minimum frequency ...

On the other hand, if we look at both figures \ref{fig:3m-1}, \ref{fig:3m-2} and \ref{fig:3m-3}, we can see that the maximum frequency is in fact around 314Hz, which is quite far off the prediction of 324Hz.

# Error Discussion
## Error sources
There were a few potential sources of error during the experiment:

- High impact
  - The person swinging the rope may not hold their arm exactly in the same place during their swing. This would lead to the results being as if length of the rope was actually longer.

- Medium impact
  - Since the experiment was performed outside, temperature may fluctuate after initial measurement
  - The distances measured such as: the distance between the circle origin and the microphone not being exactly 5 metres

- Low impact
  - The measurement method of the air temperature (error margin of the thermometer)
  - The frequency output of the speaker may not be 100% accurate (error is low compared to other factors)
  - Error margin of the phone used to measure the frequency (error is also low compared to other factors)
  - Measurements were made 20 - 50 times per second; 100 times per second may be more accurate

- Other
  - Noise pollution from surroundings (primarily responsible for extreme outliers)

## Improvement possibilities
Here are some realistically possible changes to improve on the experiment:
- Instead of a human swinging the rope, use a spinning device (would be difficult to start the swinging motion though)
- Hold the experiment further away from any noise pollution (such as an open field outside of the city)
- Take measurements more frequently (100/s instead of 50/s)

# Conclusion
tbd after feedback

# References
The physics textbook \
Online calculator for speed of sound in air: https://keisan.casio.com/exec/system/1258121716