CS524: Introduction to Optimization, Fall 2023 
Author: Andrew Shih 
Minimum-Cost Network Flow for EV Charging Stations on a Transcontinental Road Trip – 
Project Spec 
(A) Issue Addressed: 
The term “range anxiety” describes the vast tendency many new car buyers have when becoming 
prospective electric vehicle (EV) owners. This stems from the fear that drivers will run out of 
electricity before they can find a charging station. This project targets "range anxiety" among 
potential EV owners by optimizing the availability of charge stations and minimizing the 
distance between New York to Los Angeles, ensuring accessible charging stations. 
(B) Data Sources and Acquisition: 
Data is aggregated from: 
• US Department of Transportation: Geographical data for 78,000+ charging stations. 
• Kaggle: Performance metrics for 102 EV models across 33 manufacturers. 
Essential model parameters are the distances between stations, vehicle range, charge times, and 
vehicle efficiency, and station accessibility (public vs private stations). Initially, the model will 
include a subset of stations and use Euclidean distances for simplicity. I will scale complexity by 
incorporating more EV data and expanding geographic coverage. 
(C) Optimization Problem: 
The project focuses on a minimum-cost flow network problem with a potential extension to a set 
coverage model, contingent on additional geographic user data availability. The minimum-cost 
flow problem would have the goal of have finding the shortest path between destinations while 
requiring there to be enough charge stations between destinations. 
(D) Deliverables: 
1. A small-scale model for optimal routing between Los Angeles and a designated point. 
2. An expanded model to include more nodes, showcasing scalability. 
3. A comprehensive model for routing between Los Angeles and New York. 
4. An adaptable model for varying vehicle specifications and performance data. 
(E) Evaluation Considerations: 
Immediate concerns include efficient data integration and calculations of Euclidean distances. 
Future concerns pertain to the complexities added by new parameters or expanded scope and 
their impact on model feasibility. 
Data Sources: 
Charging Stations:  
• https://data-usdot.opendata.arcgis.com/datasets/usdot::alternative-fueling-stations/about 
EV Performance Metrics:  
• https://www.kaggle.com/datasets/geoffnel/evs-one-electric-vehicle-dataset 
