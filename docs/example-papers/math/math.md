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

font: palatino
math-font: euler

header-and-footer: true≈
leftheader: "Session May 2021"
centerheader: "IBDP Internal Assessment"
rightheader: "Mathematics AA HL"
centerfooter: \thepage \ of \pageref{pagesLTS.arabic}

header-includes: | # import additional LaTeX packages and create custom commands here
    \usepackage{
        standalone,
        pageslts,
        amssymb,
        amsmath,
        textcomp,
        float,
        hyperref,
        xcolor,
        url,
        tikz,
        pgf,
        pgfplots
    }
    \definecolor{DarkGreen}{rgb}{0,0.5,0}
    \pgfplotsset{compat=1.17}
    \setlength\tabcolsep{10pt}
title: |
    **Modelling a Solid of Revolution** \
    IB Mathematics AA HL Internal Assessment
author: | 
    Nico Bachner \
    Candidate Number: jcp633
date: \today
---

# Introduction
This small wooden stool in my living room has always baffled me by how heavy it is in proportion to its size. I'm almost sure it is not hollow, but I want to make sure. 
\begin{figure}[H]
    \centering
    \includegraphics[width=0.4\textwidth]{images/stool.jpg}
    \caption{My stool, in my living room}
    \label{fig:stool}
\end{figure}
I will use this investigation to approximate the volume of my stool, and thus also its mass, in order to make sure my suspicions are correct and it is in fact not hollow. I will achieve this using integration.
        
The use of integration to approximate surface areas under curves is fascinating, especially because by spinning a surface around its own axis, it is possible to create solids such as my stool. These solids of revolution have an fairly easily estimable volume. Since I am very enthusiastic about 3D modelling and have recently discovered the wonders of photogrammetry, I wanted to use these tools to determine the mass of an object solely by looking at it (and taking pictures, of course). However, due to technological limitations (The main one being that I don't own a Windows computer nor a Nvidia GPU), I was not able to use photogrammetry. I have therefore resigned myself to using a 3D model of the stool that I found on the Internet \cite{ItemSource}. 
    
# Aim
I will estimate the mass of my stool by treating it as a solid of revolution, thus estimating the area of the radius, giving me the volume of the stool. I will then multiply the volume by the density of the wood, which is $0.57$ $g/cm^3$ \cite{DataSource} (the manufacturer labelled it as European Walnut). \
(Note: All measurements will be in centimeter (cm), square centimeter (cm$^2$) and cube centimeter (cm$^3$) units unless stated otherwise.)
        
# The Procedure
## Graphing the relief
In order to accurately graph the relief of the stool, I need as many measurement points as possible. To do this, I chose to use photogrammetry to create a 3D model of the stool. Since that didn't work, I am going to be using a 3D model from the web. For those who are unfamiliar with 3D objects in software, the surface of the stool will be represented by very small polygons, whose vertices I can plot on a Cartesian plane using 2 of their 3-dimensional coordinates: $y$ and $z$. Figure \ref{fig:stool3d} shows a screenshot of the 3D model of the stool in Blender's edit mode.\footnote{I chose Blender because I have worked with Blender before (creating 3D objects for video games) and therefore feel more comfortable using it.} The $x$-axis is red and the $y$-axis is green.
\begin{figure}[H]
    \centering
    \includegraphics[width=0.4\textwidth]{images/stool3d.png}
    \caption{3D model of the stool in Blender}
    \label{fig:stool3d}
\end{figure}
Using this model, I am now able to delete all vertices except those in one vertical slice. Figure \ref{fig:vertices} shows an already horizontally turned photo of only the vertices in blender.
\begin{figure}[H]
    \centering
    \includegraphics[width=0.6\textwidth]{images/vertices.png}
    \caption{Vertices constituting the relief}
    \label{fig:vertices}
\end{figure}
By taking the z-coordinates and y-coordinates (the z-axis is blue and the y-axis is green in figure \ref{fig:vertices}) of each vertice constituting the relief, I can graph the z-coordinates on the x-axis against the y-coordinates on the y-axis of the Cartesian plane. The result is shown in figure \ref{fig:GraphSections}.
            
## Dividing the relief graph into sections
Since no function can approximate the entire relief accurately enough, I will divide the stool into several sections. I have chosen to divide it sideways into 11 different sections (of which there will be 3 identical pairs). I have numbered these from 1 to 8. Thus, I will need to estimate individual functions of best fit for 8 sections. Figure \ref{fig:GraphSections} shows where I have chosen to separate the graph into sections.
\begin{figure}[H]
    \centering
    \input{graphs/relief.tex}
    \caption{Graph of the relief, divided into 11 sections}
    \label{fig:GraphSections}
\end{figure}
Additionally, Figure \ref{fig:SectionFormsAndMethods} shows a table of the forms of the sections and the methods I will use to approximate them.

+---------+-------------+------------------------------------------------+
| Section | Form        | Methods to try                                 |
+:========+:============+:===============================================+
| 1       | unknown     | polynomial regression                          |
+---------+-------------+------------------------------------------------+
| 2       | exponential | exponential regression                         |
+---------+-------------+------------------------------------------------+
| 3 & 3'  | linear      | linear regression & slope intercept form       |
+---------+-------------+------------------------------------------------+
| 4 & 4'  | linear      | linear regression & slope intercept form       |
+---------+-------------+------------------------------------------------+
| 5 & 5'  | linear      | linear regression & slope intercept form       |
+---------+-------------+------------------------------------------------+
| 6       | exponential | exponential regression                         |
+---------+-------------+------------------------------------------------+
| 7       | unknown     | polynomial regression                          |
+---------+-------------+------------------------------------------------+
| 8       | logarithmic | logarithmic regression & polynomial regression |
+---------+-------------+------------------------------------------------+
        
## Approximations of the sections
In order to avoid repetitive calculations I have put the in detail calculations in the appendix for further reference, but here I'll mostly only show the results.
            
### Linear sections
Sections 3,4 and 5 (and of course their mirror images) are straight lines and are therefore easier to estimate a surface area for. However, despite most of the points measured lying on a straight line, the rounded corners of the stool pose a slight problem in terms of accuracy. One method to deal with this would be to create additional sections in form of parabolas or circles, but there are not enough data points available for a precise estimate. Therefore, I have chosen to still attempt to approximate the following sections using straight lines.
                
#### Section 3
In order to find a function that models the data points best, I have chosen to use linear regression. With Microsoft Excel's inbuilt regression tool, I got $y = 1.02x - 1.45$, the $R^2$ being 0.9995. This is, a next to perfect approximation of the data points, but since the data points available to me do not perfectly describe the surface of the stool (they themselves are not 100\% accurate) as well as because the data points are limited, I will never be able to accurately approximate the volume of the stool using just the data points. Therefore, I decided to try a less sophisticated method to see what happens: the slope intercept form. I will take two points that look the most representative of the line and draw a straight line through them. This will then give a line in form
\begin{equation}
    y = a + bx
\end{equation}
Taking points $(7.95, 6.67)$ and $(9.88, 8.68)$, I get the following value for the slope:
\begin{equation}
    \begin{split}
        b &= \frac{y_2-y_1}{x_2-x_1} \\
        &= \frac{8.68-6.67}{9.88-7.95} \\
        &= \frac{2.01}{1.93} \\
        &= 1.04
    \end{split}
\end{equation}
And for the $y$-intercept:
\begin{equation}
    \begin{split}
        a &= y_1-bx_1 \\
        &= 6.67-1.04*7.95 \\
        &= -1.60
    \end{split}
\end{equation}
When substituting (2) and (3) into (1), we get:
\begin{equation}
    y = -1.60 + 1.04x
\end{equation}
Unsurprisingly, when calculating the error of $1.04x-1.60$, the $R^2$ value, 9.97, is not as great than when using linear regression, making this model less accurate. However, since the difference in quality is not very large, I will base my choice on which function seems to represent the stool best. This is visualised in figure \ref{fig:GraphSection3}, where I have graphed both functions against the data set (blue = linear regression, red = slope intercept).
\begin{figure}[H]
    \centering
    \input{graphs/section-3.tex}
    \caption{Graph of Section 3}
    \label{fig:GraphSection3}
\end{figure}
I have chosen to go with $1.04x-1.60$ despite it seeming to be less accurate, since visually it seems to fit the data set better.
                    
In order to find the volume, we can pretend the slice is the radius of a circle and use the formula $A = \pi r^2$. This way, instead of inputting a length and getting an area, we input an area and get a volume. We just add a dimension. This gives:
\begin{equation}
    \begin{split}
        V &= \pi \int_{a}^{b} (f(x))^2 dx
    \end{split} 
\end{equation}
                    
I now only need to calculate the integral of the section. Here are the step-by-step calculations:
\begin{equation}
    \begin{split}
        V_{3/3'}
        &= \pi * \int_{ 7.63 } ^ { 10.18 } ( 1.04x - 1.60 ) ^ 2 dx \\[10pt]
        &= \pi * \int_{ 7.63 } ^ { 10.18 } ( 1.0816 x ^ 2 - 3.328 x + 2.56) dx \\[10pt]
        &= \pi * \left ( 1.0816 * \int_{ 7.63 } ^ { 10.18 } x ^ 2 dx - 3.328 * \int_{ 7.63 } ^ { 10.18 } x dx + 2.56 * \int_{ 7.63 } ^ { 10.18 } 1 dx \right ) \\[10pt]
        &= 1.0816 \pi * \left. \frac{ x^3 } { 3 } \right| ^ { 10.18 } _ { 7.63 } - 3.328 \pi * \left. \frac{ x^2 } { 2 } \right| ^ { 10.18 } _ { 7.63 } + 2.56 \pi * x | ^ { 10.18 } _ { 7.63 } \\[10pt]
        &= 1.0816 \pi * \left ( \frac { (10.18)^3 } { 3 } - \frac { (7.63)^3 } { 3 } \right ) - 3.328 \pi * \left ( \frac{ (10.18)^2 } { 2 } - \frac{ (7.63)^2 } { 2 } \right ) \\ & \ \ \ \  + 2.56 \pi * ( 10.18 - 7.63 ) \\[15pt]
        &= 220.21 \pi - 75.57 \pi + 6.53 \pi \\[5pt]
        &= 151.17 \pi \\[5pt]
        &= 474.91
    \end{split}
\end{equation}
For the other sections, the calculations will be similar, so I will do them in less detail.

Thus, we know that both sections 3 and 3' will have a volume of $474.91 cm^3$. This seems to be about right seen as this gives a mass of 270.70 grams, which is a likely mass for the section.
                
#### Section 4
In the case of section 4, linear regression gives an even more accurate approximation, the $R^2$ value of $-1.59x+25.21$ being 0.9996. However, using coordinates $(10.73,8.14)$ and $(12.32,5.56)$, one finds $-1.62x+25.52$ with an $R^2$ of 0.98 (Calculations in Appendix). 

\begin{figure}[H]
    \centering
    \input{graphs/section-4}
    \caption{Graph of Section 4}
    \label{fig:GraphSection4}
\end{figure}
                    
Figure \ref{fig:GraphSection4} in the Appendix shows a graph of both functions (colour coding stays the same as in Figure \ref{fig:GraphSection3}). Again, I have chosen to go with the "less accurate" function since visually it fits better.
                    
Using the same method as before, this gives us a volume of 404.34 cm$^3$ for both sections 4 and 4'.
                    
#### Section 5
For section 5, linear regression gives $y=0.48x-0.98$, whose $R^2$ value is 0.9997. Using coordinates $(16.62,7.05)$ and $(12.97,5.27)$, the resulting $y=0.49x-1.09$ with an $R^2$ value of 0.99.

\begin{figure}[H]
    \centering
    \input{graphs/section-5}
    \caption{Graph of Section 5}
    \label{fig:GraphSection5}
\end{figure}
                    
Figure \ref{fig:GraphSection5} in the Appendix shows a graph of both functions (colour coding stays the same as in the other linear sections. Once again, I have chosen to go with the "less accurate" function since visually it fits better.
                    
This gives us a volume of 588.51 cm$^3$ for sections 5 and 5'.
                    
### Polynomial sections
#### Section 1
Since its shape doesn't look anything like a linear, exponential or logarithmic function, this section is probably best approximated using polynomial regression. \
Using Excel, I chose the following three polynomials for polynomial regression of $4^{th}$, $5^{th}$ and $6^{th}$ degree, respectively:
\begin{equation}
    \begin{split}
        y_4 &= -0.2212x^4 + 0.9081x^3 - 1.4991x^2 + 0.9132x + 12.483 \\
        y_5 &= 0.2662x^5 - 1.5832x^4 + 3.326x^3 - 3.2209x^2 + 1.323x + 12.47 \\
        y_6 &= -0.5672x^6 + 3.7284x^5 - 9.4557x^4 + 11.489x^3 - 6.9655x^2 + 1.9159x + 12.457
    \end{split}
\end{equation}
                    
Figure \ref{fig:GraphSection1} compares the three polynomials (drawn in red, green and blue, respectively).
\begin{figure}[H]
    \centering
    \input{graphs/section-1}
    \caption{Graph of Section 1}
    \label{fig:GraphSection1}
\end{figure}
I think a fifth-degree polynomial is the best choice in this situation, since anything less is not accurate enough, however a $6^{th}$ degree polynomial results in over-fitting. \
Using $y_5$, we get a volume of 1014.06 cm$^3$ .
                    
#### Section 7
I can approach section 7 in a similar way as section 1. Using Excel once again, I chose the following $5^{th}$ degree polynomial:
\begin{figure}[H]
    \centering
    \input{graphs/section-7}
    \caption{Graph of Section 7}
    \label{fig:GraphSection7}
\end{figure}
\begin{equation}
    y_5 = -0.4373x^5 + 1.7505x^4 - 2.0447x^3 + 0.1122x^2 + 1.0192x + 15.45
\end{equation}
This gives a volume of 1621.28 cm$^3$ .
                
### Exponential sections
#### Section 2
This looks like an exponential function, so I will start by approximating accordingly. To do this, I can use linear regression on the following transformation of an exponential function:
\begin{equation}
    \begin{split}
        y &= a * e^{bx} \\
        \therefore ln(y) &= ln(a) + bx
    \end{split}
\end{equation}
Using this linear equation, I will be able to perform linear regression on the data set using the x-values and the natural logarithm of the y-values, which is shown in figure \ref{fig:Section2Excel}.
\begin{figure}[H]
    \centering
    \includegraphics[width=\textwidth]{images/section2excel.png}
    \caption{Linear regression of the linear transformation of section 2 in Excel}
    \label{fig:Section2Excel}
\end{figure}
This gives us the function $15.06e^{-0.112x}$, which I will graph in figure \ref{fig:GraphSection2}
\begin{figure}[H]
    \centering
    \input{graphs/section-1}
    \caption{Graph of Section 2}
    \label{fig:GraphSection2}
\end{figure}
Given the decent $R^2$ value, as well as the fact that the curve visually fits the data well, I choose this function.
                    
Creating a solid of revolution out of this gives a volume of 1417.45 cm$^3$
                    
#### Section 6
Through exponential regression like section 2, I get the following function:
\begin{equation}
    y = 0,2906e^{0,1139x}
\end{equation}
                    
This gives a volume of 2740.39 cm$^3$.
                
### Other sections
#### Section 8
This seems to have the form of a logarithmic function, so I could go ahead and perform logarithmic regression on the data points. however, since ln(x) is not easily integrated, I have chosen to treat this as a polynomial. I chose the following 6$^th$ degree polynomial as an approximation:
\begin{equation}
    y = -8150.8x^6 + 19697x^5 - 18433x^4 + 8425x^3 - 1953.5x^2 + 222.65x + 1.0185
\end{equation}
This gives a volume of 324.93 cm$^3$.
            
# Final results
When we add the volumes of all the sections, we finally get an estimation of the volume of the stool:
\begin{equation}
    \begin{split}
        V &= V_1 + V_2 + 2 * V_3 + 2 * V_4 + 2 * V_5 + V_6 + V_7 - V_8 \\
            &= 1014.06 + 1417.45 + 2 * 474.91 + 2 * 404.34 + 2 * 588.51 + 2740.39 + 1621.28 - 324.93 \\
            &= 9403.77 cm^3
    \end{split} 
\end{equation}
        
Now I will multiply the final volume by the density of the wood, which gives me the final mass.
\begin{equation}
    \begin{split}
        M_{estimated_1} & = 0.57 g/cm^3 * V \\
            & = 0.57 g/cm^3 * 9403.77 cm^3 \\
            & = 5360.15 g \\
            & \simeq 5.4 kg
    \end{split} 
\end{equation}
            
For our comparison, we also need a manually measured mass of the stool: 
\begin{equation}
    M_{measured} = 6.2 kg
\end{equation}
        
If we use the first result ($M_{estimated_1}$), this gives us an estimated value that is a lot less than the measured mass. This can mean one of 2 things:
\begin{enumerate}
    \item The stool has a core that is made of a material denser than the walnut wood on the outside
    \item My calculations are very inaccurate
\end{enumerate}
I personally think it is unlikely that the manufacturers built in a core that is denser, which leads me to conclude that it is a reasonable possibility that my calculations are quite off.
            
This leads us to reflect on the possibilities for error during the investigation. \
here is a short list of some of the most significant opportunities for potential errors to affect the results:

- Inaccurate modelling
- Improper use of numbers (e.g. rounding)
- Error of textbook value of wood density
- Error of household scales for the "real" mass
- Production errors (e.g. not perfectly round)
- Damaged stool (affecting the reference mass, but not the volume, since the data points are taken from the web)
- Production method (use of glue, etc.)
            
One way they could have been so far off is the choice of reference (textbook) value for the mass of the wood. I have used another source \cite{DataSource2} to compare, which gives me a density of 
\begin{equation}
    \begin{split}
        & \rho = 0.675 g/cm^3 \pm 25 mg/cm^3 \\
        \therefore \ & M_{estimated_2} = 6347.54 g \pm 235.09 g \\
        \therefore \ & M_{estimated_2} \simeq 6.3 kg \pm 200 g
    \end{split}
\end{equation}
This gives us an estimated mass that is the same as the measured one.

Hence:
\begin{center}
    If we use ($M_{estimated_2}$), we can answer the initial \\
    question in concluding that \textbf{the stool is not hollow}.
\end{center}

\begin{thebibliography}{}
    \bibitem{ItemSource}
        \url{https://www.designconnected.com/Seating/Stools/Eames-Walnut-Stool-1_p964}
    \bibitem{DataSource}
        \url{https://www.engineeringtoolbox.com/wood-density-d_40.html}
    \bibitem{DataSource2}
        \url{https://cedarstripkayak.wordpress.com/lumber-selection/162-2/}
\end{thebibliography}