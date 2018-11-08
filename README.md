# Inspiration

## Inspiration for the Solution

The Hawaiian islands are home to a wide variety of endemic Hawaiian plant species that are not found anywhere else in the world. Kumu was inspired by the limited public awareness of these rare native Hawaiian plants, their importance, their endangerment, and the need to protect and preserve them. Specifically, the issue of "plant blindness" is in correlation with the inefficiency of collecting and displaying data on these rare plants; because, without streamlined data reporting and accessible data visualization, it is difficult for botanists and members of the community to get the information they need to help to preserve these rare plants. Kumu is a system we built for efficient, real-time data collection and access, user-friendly data visualization to help preserve the native plants of Hawaii.

##Inspiration for the Logo

The motivation for our Naupaka flower logo goes hand in hand with the inspiration for our app. A solution to our community’s plant blindness comes in two parts; equal attention must be given to both data collection and data visualization. Streamlined data collection is of little use if it cannot be visualized and used to make insights and decisions. User-friendly data visualization is not meaningful if there is no efficient way to collect the data to be visualized. Therefore, the two parts of our system must work together to achieve the overall goal - increasing public awareness of the need to protect and preserve the native plants of Hawaii. In correlation, the logos for Kumu App data collection and Kumu Web data visualization are the beach Naupaka and mountain Naupaka plants’ lower and upper half-flowers, creating a full flower when joined together.

# What it does
The Kumu system incorporates a pair of two components: Kumu App for data collection, and Kumu Web for data visualization.

## Kumu App

Kumu App is a mobile Android app that allows users such as botanists to collect rare plant data on site from anywhere at any time. It streamlines the plant data collection process, incorporating expandable and collapsible fields, auto-completion, draft saving, and automatic data uploading functionality into the app’s data forms. Data collection with Kumu App is done in an effective step-by-step process that also allows users to take up to ten geotagged photos of the plant to attach to the form. Forms are stored locally and automatically synced once an internet connection is detected to allow users to collect plant data regardless of whether there is an internet connection. We kept this in mind for botanists who often travel to remote sites to collect data on plants. Finally, users can also view a map on their app that displays all locations of previously collected data, so that they can easily return to these sites if needed.

## Kumu Web

Kumu Web is a public website that displays real-time plant data collected throughout the state to show plant revitalization progress. For effective and measurable data visualization, Kumu Web displays a map that pinpoints the locations of all forms collected by Kumu App users. Each plant location point on the map displays the plant's name, data, and a gallery of images taken on site. For added insight, the site displays measurable metrics by including filters that allow users to view specific subsets of plants based on endangerment status, plant maturity, and other identifiers. Designed with the public in mind, Kumu Web clearly displays measurable insights on the state's progress towards native plant revitalization.

# How we built it

## Kumu Web

We used a combination of frameworks and libraries: Laravel for the Apache web server, SQL Server for our relational database, and Android SDK for our app.
The Laravel web server is a way for the public to view all reported species of plants. We use libraries called LeafletJS and Mapbox to create a map view that marks individual form submissions on plants. To ensure a better user experience, when a user clicks on a marker we extract the individual data from the form itself for viewing: Taxaname of the plant, common name for the plant (if data exists), whether or not the species is endangered, whether the reported plant is wild, outplanted, etc., notes on the location, and any attributed story or notes for the plant itself such as what it can be used for. To make searching up names easier, we utilized easy-autocomplete as a library to make AJAX requests to the database, and come up with the most closely matched results for the current input. For performance optimization, this only happens every 400ms. Filtering is made easy by simply using an AJAX request made to the web server any time the filter rules are changed. Extending and adding filters is easy, as the only requirements are building the filter type, adding it to the Json POST request, and applying the filter logic in the web server and database. Very little front-end work is required.

## Kumu Web DB

Our database uses SQL Server, and we implemented stored procedures to make any interaction with the database rather than perform database interactions within Laravel. The reason this is done is all for security, and lessens the RTT (round-trip time, or how much time it takes for the client to retrieve the response), as Eloquent ORM (object-relational mapper, a way for the web server to directly interact with the database using objects) in Laravel is not efficient when working with thousands of rows in a relational database, and we would not need to completely sanitize inputted data to prevent SQL Injections.

## Kumu App

Kumu App is developed using the Android SDK with Gradle being our dependency manager. The general user-flow is fairly simple: the user opens the app, logs in, fills in the form, submits. The user only needs to perform the login action one time; after that, they are considered verified users and we save this information in the application preferences. All form data is saved as a Json object, also within the application preferences so that when a user exits the app it can be reloaded. With this, we implemented views for the history of their completed forms, incomplete forms, and personal user map of locations where they have collected plant data previously via Google Maps. Form data is submitted/synced to the web server through a web POST request, submitting the form’s images as well. Since in reality, a Kumu App user will not likely have a connection to the internet while they are reporting plant data from remote areas, form submissions to the web server are achieved in two areas. The app checks for internet connection when they hit “submit form” at the end of the form, and again when they boot the application in the splash screen. If a connection exists, it begins to attempt to sync the form and add all the data to the database and web server.

# Challenges we ran into
The biggest challenges we faced during the development process were learning how to implement specific features by taking advantage of technologies that we were unfamiliar to us at first. As goes with any technical stack, dealing bugs and learning how to use specific libraries within the frameworks are difficult. The Google Maps API has specific requirements with API keys and footprints, making things initially difficult to work within a team-based environment, and generating a multi-part POST request from scratch was difficult as well now that Http Apache is a deprecated library in Android. Understanding and improving the general flow of the existing form fields used by the DLNR in KoboToolbox, their current data reporting method, was also slightly complicated as we needed to re-implement it in Android. In general, learning how to use new platforms and technologies in a very limited amount of time was very challenging, but allowed us to broaden and expand our repertoires and development skill sets, equipping us with valuable skills that are important in industry.

# Accomplishments that we're proud of
We see the completion of not only one but both parts of the Kumu system as a major accomplishment in itself, especially given our limited amount of time. Completing an Android app, a website, a relational database, and linking controllers between the app and the website was not something that our team of four thought we could accomplish in three weeks, so we are especially proud of our the look, feel, and functionality of our finished product. We are very happy with the branding of our system - our very own Kumu logo, which incorporates the two parts of the native Naupaka flower; the beach Naupaka (lower half) for the app, and the mountain naupaka (upper half) for the website. Our team’s unique combination of skill sets and specialties helped us to develop a well-rounded solution that excels in both its visual and functional aspects. 

 # What we learned
Development-wise, we learned about the intricacies of development of a multi-part system, and how to effectively use the existing development tools available to us and the required permissions and libraries to take advantage of them. Using Git, we learned how to effectively collaborate in the development process, working together to create a composition of varying features within the same project. Our biggest takeaway from developing Kumu was that the diversity in strengths and weaknesses of our team members was actually our team’s biggest asset. Learning how to tap into each others’ strengths and specialties and dividing work among us accordingly enabled us to create the complete, well-rounded, functional and visually appealing solution that we are glad to present to you as our finished product. We also learned that factors such as communication, compromising between varying ideas and visions for our product, and strengthening the bonds and friendships in our team are key in developing a high-quality product in a very short amount of time. Making sure all four of us were working towards a common goal, each with something different and valuable to offer, was our key to completing a solution that we take pride in.  


# What's next for Kumu
We envision the Kumu system being implemented by the Department of Land and Natural Resources (DLNR)’s Rare Plant program, as an improvement to the data collection and visualization methods currently in use. Provided more time and resources, we would be able to implement even more features and functionality to our app, database, and website. We would like to expand our datasets to incorporate auto-filling and auto-completion for even more plant species, based on already existing data which would let us implement an even smarter and more streamlined data collection process. We also envision the incorporation of our system into the DLNR’s current plant permit application system. Given access to this system, users who hold rare plant permits could collect data specialized to those specific plant species. Given more information about other factors that indicate the health and vitality of plant species populations, we would implement even more data filters into Kumu Web’s map, along with data analysis, insights, and even future predictions. These added insights would enhance the impact and meaningfulness of the data collected using our system, resulting in an even greater community awareness of our current native plant situation and our progress towards the revitalization of Hawaii’s unique natural beauty and resources. 
