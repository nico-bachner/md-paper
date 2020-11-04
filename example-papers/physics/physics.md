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

list-of-figures: true

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

# Introduction
As a hobby musician, I find the physics behind music and sound in general to be extremely fascinating. Upon discovering the Doppler Effect, I was intrigued by its possible effect on music, hence this report. \
While analysyng the effect of the Doppler Effect on actual music would be difficult, seen as each note has a different frequency, I decided to limit the experiment to only one frequency (300Hz). \
Another limitation I face is a lack of resources to reach high speeds travelling linearly. Thus, I have decided to analyse the effect of the Doppler Effect on a sound source undergoing circular motion.

# Experiment Setup
Figure \ref{fig:setup} shows a rough diagram of the experiment setup:
A speaker is attached to the end of a rope of variable length. The rope is held by a person standing exactly 5 metres away from a microphone. \
As mentioned in the introduction, this setup is easy to set up and control due to its small scale and that not much special equipment is needed.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.5\textwidth]{images/setup.jpg}
  \label{fig:setup}
  \caption{The setup of the experiment}
\end{figure}

# Initial Calculations
This is the equation of the effect of the doppler effect on a sound emitted from a source traveling towards the observation point (I took it straight from the textbook, since it is a known formula):
\begin{equation}
  f' = \frac{ v }{ v - v' } f
\end{equation}
$v$ here is the speed of sound in air. \
Since the air temperature at the time of the experiment was 14.7 degrees celsius, the speed of sound in air is approximately $340ms^{-1}$. This gives the following:
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

# Data Processing
## 2 metre rope
### Period of oscillation
For the string at distance 2 metres, we can take the data from graphs \ref{fig:2m-1} and \ref{fig:2m-2} to determine an average period of revolution for the experiment.

1. Graph \ref{fig:2m-1} has 12 full periods, starting at $t=1.15s$ and ending at $t=15.55s$, illustrated in graph \ref{fig:2m-1-pr}.
\begin{figure}[H]
  \centering
  \tikz{
    \begin{axis}[x=.6cm,xmin=-.5,xmax=16.5,ymajorgrids=true,xmajorgrids=true]
      \addplot table [x index=0,y index=1,col sep=comma] {graphs/2m-1.csv};
      \draw [red, very thick] (1.15,290) -- (1.15,310);
      \draw [red, very thick] (15.55,290) -- (15.55,310);
    \end{axis}
  }
  \caption{The variation of a 300Hz sound at radius 2m - 1st try - Annotated}
  \label{fig:2m-1-pr}
\end{figure}

2. Graphs \ref{fig:2m-2} has 18 full periods, starting at $t=1.35s$ and ending at $t=19.85s$, shown in graph \ref{fig:2m-2-pr}.
\begin{figure}[H]
  \centering
  \tikz{
    \begin{axis}[x=.6cm,xmin=-.5,xmax=20.5,ymajorgrids=true,xmajorgrids=true]
      \addplot table [x index=0,y index=1,col sep=comma] {graphs/2m-2.csv};
      \draw [red, very thick] (1.35,290) -- (1.35,310);
      \draw [red, very thick] (19.85,290) -- (19.85,310);
    \end{axis}
  }
  \caption{The variation of a 300Hz sound at radius 2m - 2nd try - Annotated}
  \label{fig:2m-2-pr}
\end{figure}

Thus we get the following time for the average oscillation:

\begin{equation}
  \begin{split}
    t_{average} &= \frac{ t_{total} }{ n_{oscillations} } \\
    \vspace{15pt}
    &= \frac{ (15.55s - 1.15s) + (19.85s - 1.35s) }{ 12 + 18 } \\
    &= 1.097
  \end{split}
\end{equation}

where $t$ is time and $n$ is the count.

### Predictions based on oscillation period

The following predictions can be made for the maximum value:

\begin{equation}
  \begin{split}
    f'_{max} &= \frac{ 340ms^{-1} }{ 340ms^{-1} - l * \omega } * 300Hz \\
    &= \frac{ 340ms^{-1} }{ 340ms^{-1} - 2.00m * 1.097 * 2\pi s^{-1} } * 300Hz \\
    &= \frac{ 340ms^{-1} }{ 326.21ms^{-1} } * 300Hz \\
    &= 312.68Hz
  \end{split}
\end{equation}

And for the minimum value:

\begin{equation}
  \begin{split}
    f'_{min} &= \frac{ 340ms^{-1} }{ 353.79ms^{-1} } * 300Hz \\
    &= 288.31Hz
  \end{split}
\end{equation}

If we plot this, we get the following graph:

\begin{figure}[H]
  \centering
  \tikz{
    \begin{axis}[ x=.6cm,ymajorgrids=true,xmajorgrids=true ]
      \addplot [domain=0:20,red,samples=300,thick] plot {13.79 * cos( 300 * x ) + 300};
    \end{axis}
  }
  \caption{Prediction of frequency variance with 2m rope}
  \label{fig:2m-prediction}
\end{figure}

## 3 metre rope
### Period of oscillation
For the string at distance 3 metres, we can take the data from graphs \ref{fig:3m-1}, \ref{fig:3m-2} and \ref{fig:3m-3} to determine an average period of revolution for the experiment.

1. Graph \ref{fig:3m-1} has 4 full periods, starting at $t=0.2s$ and ending at $t=9.2s$, illustrated in graph \ref{fig:3m-1-pr}.
\begin{figure}[H]
  \centering
  \tikz{
    \begin{axis}[x=.6cm,xmin=-.5,xmax=10.5,ymajorgrids=true,xmajorgrids=true]
      \addplot table [x index=0,y index=1,col sep=comma] {graphs/3m-1.csv};
      \draw [red, very thick] (0.2,280) -- (0.2,320);
      \draw [red, very thick] (9.2,280) -- (9.2,320);
    \end{axis}
  }
  \caption{The variation of a 300Hz sound at radius 3m - 1st try - Annotated}
  \label{fig:3m-1-pr}
\end{figure}

2. Graphs \ref{fig:3m-2} has 10 full periods, starting at $t=0.2s$ and ending at $t=13.8s$, shown in graph \ref{fig:3m-2-pr}.
\begin{figure}[H]
  \centering
  \tikz{
    \begin{axis}[x=.6cm,xmin=-.5,xmax=14.5,ymajorgrids=true,xmajorgrids=true]
      \addplot table [x index=0,y index=1,col sep=comma] {graphs/3m-2.csv};
      \draw [red, very thick] (0.2,280) -- (0.2,320);
      \draw [red, very thick] (13.8,280) -- (13.8,320);
    \end{axis}
  }
  \caption{The variation of a 300Hz sound at radius 3m - 2nd try - Annotated}
  \label{fig:3m-2-pr}
\end{figure}

3. Graphs \ref{fig:3m-2} has 10 full periods, starting at $t=0.3s$ and ending at $t=13.7s$, shown in graph \ref{fig:3m-3-pr}.
\begin{figure}[H]
  \centering
  \tikz{
    \begin{axis}[x=.6cm,xmin=-.5,xmax=14.5,ymajorgrids=true,xmajorgrids=true]
      \addplot table [x index=0,y index=1,col sep=comma] {graphs/3m-3.csv};
      \draw [red, very thick] (0.3,280) -- (0.3,320);
      \draw [red, very thick] (13.7,280) -- (13.7,320);
    \end{axis}
  }
  \caption{The variation of a 300Hz sound at radius 3m - 3rd try - Annotated}
  \label{fig:3m-3-pr}
\end{figure}

Thus we get the following time for the average oscillation:

\begin{equation}
  \begin{split}
    t_{average} &= \frac{ t_{total} }{ n_{oscillations} } \\
    \vspace{15pt}
    &= \frac{ (9.2s - 0.2s) + (13.8s - 0.2s) + (13.7s - 0.3s) }{ 4 + 10 + 10 } \\
    &= 1.5
  \end{split}
\end{equation}

where $t$ is time and $n$ is the count.

### Predictions based on oscillation period
The following predictions can be made for the maximum value:

\begin{equation}
  \begin{split}
    f'_{max} &= \frac{ 340ms^{-1} }{ 340ms^{-1} - l * \omega } * 300Hz \\
    &= \frac{ 340ms^{-1} }{ 340ms^{-1} - 2.00m * 1.5 * 2\pi s^{-1} } * 300Hz \\
    &= 317.61Hz
  \end{split}
\end{equation}

If we plot this, we get the following graph:

\begin{figure}[H]
  \centering
  \tikz{
    \begin{axis}[ x=.6cm,ymajorgrids=true,xmajorgrids=true ]
      \addplot [domain=0:20,red,samples=300,thick] plot {18.85 * cos( 250 * x ) + 300};
    \end{axis}
  }
  \caption{Prediction of frequency variance with 3m rope}
  \label{fig:3m-prediction}
\end{figure}

# Results
## 2m rope
If we look at both figures \ref{fig:2m-1} and \ref{fig:2m-2}, we can see that the maximum frequency varies between 307Hz and 310 Hz, whereas the prediction made was for an average of 312.68Hz.

## 3m rope
If we analyse graphs \ref{fig:3m-1}, \ref{fig:3m-2} and \ref{fig:3m-3}, we can see that the maximum frequency is in fact between 310Hz and 313.5Hz, as opposed to the prediction of 317.61Hz.

# Error Discussion
## Error sources
Both predicted results predicted a larger variance in the frequency than the results showed. \ 
There may have been some errors during the experiment to which the inaccurate predictions could be attributed to. Here I'll list a few potential sources of error:

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
Here are also some realistically possible changes to improve on the experiment:

- Instead of a human swinging the rope, use a spinning device (would be difficult to start the swinging motion though)
- Hold the experiment further away from any noise pollution (such as an open field outside of the city)
- Take measurements more frequently (for example 100/s instead of 50/s)

# Conclusion
While the results were not completely satisfying, the effect of the Doppler Effect on a sound was still well observable.

In addition to the simple frequency I recorded, I also tried out how an actual piece of music would be affected by the Doppler effect, and the results were impressive: the sound was so distorted, that the melody was almost irrecognisable.

# References
The physics textbook \
Online calculator for speed of sound in air: https://keisan.casio.com/exec/system/1258121716