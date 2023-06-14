# AIRLINE Data warehouse

## Introduction:
**--->** A major airline company hires you to assist the executive management.

**--->**	**Goal:** Analyze current business processes and discover new opportunities for expansion.

### 1) Flight Activity Analysis:
🔸**Executives** 

• Prioritize analyzing flight activity for ongoing business process improvement.

🔸**Marketing department's** interests:

▶	Flights taken by frequent flyers.                                                                 

▶	Fare basis paid by frequent flyers.

▶ Frequency of upgrades by frequent flyers.                                                         

▶	Earn and redemption of frequent flyer miles.

▶	Response to special fare promotions.

▶	Duration of overnight stays.

▶	The proportion of frequent flyers with gold, platinum, aluminum, or titanium status.

### 2) Reservation Process Analysis:

🔸**Finance team** is interested in analyzing company profit through the reservation process.

🔸**Note:** Reservations can occur through multiple channels.

### 3) Customer Care Interaction Analysis:
**-->** Customer care interactions are provided before, during, and after trips.

**-->** Purpose: Handle customer inquiries, complaints, and collect feedback for business enhancements.

🔸**Analysis includes:**

**-->**	Interaction types.

**-->**	Problem severity (if issues exist).

### The data warehouse schema we devised adopted a **galaxy schema** approach

##  Here is a breakdown of the steps we followed:

 📌 We defined business processes and their level of granularity based on airline company requirements and industry understanding.

 📌 By identifying common interactions between different business processes and their properties we established fact and dimension tables, also bus matrix that illustrates relationships between these tables.

 📌 Designed a logical model using dimensional modeling principles and a diagram tool.
 
 📌 Created a physical data model using Toad, an Oracle-based tool for the RDBMS housing the dimension and fact tables.

 📌 Inserted Dummy data to be used in our queries that answer some of the business questions.


