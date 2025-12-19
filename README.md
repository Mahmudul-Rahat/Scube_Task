📊 Data Visualization Module (Flutter)

📌 Project Overview

This project is a Flutter-based data visualization module designed to display energy-related information in different modes:
Users can seamlessly switch between these views using a segmented button. In the Custom Date Data view, users can select a date range to filter and view data accordingly.

🛠️ Technologies Used

Flutter – UI development framework
Riverpod – State management for handling selected dates
Material Components – For consistent and responsive UI design

Project Structure

DataViewTab

Acts as the main container
Displays total power information
Holds the segmented button and dynamic content based on selection

CustomSegmentedButton

Allows switching between Today Data and Custom Date Data
TodayDataTab
Displays energy statistics in a structured card layout

CustomDataTab

Provides date selection (From Date & To Date)
Displays data based on the selected date range
