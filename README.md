
<img src="img/city_emblem.png" alt="City Logo"/>

# City of Cape Town - Data Science Unit Code Challenge

## Purpose

The purpose of this challenge is to evaluate the skills of prospective Data Scientists, Engineers and Analysts for positions in the City of Cape Town's Data Science unit. 

## Intended audience

We will only evaluate responses to this challenge from people who we have requested to complete it. Of course, you are welcome to attempt it for your own enjoyment.

## Way of working and expected structure of submission
Principles of reproducible analysis and code versioning are very important to our workflow. Structuring your work to aid in reproducibility and readability is important. 

So, follow common conventions with respect to directory structure and names to make your work as easy to follow as possible.

## What we're looking for
### Expectation of Effort
We expect you to spend up to 48 calendar hours working on this assessment per position. If you are finding that you spending significantly more time than this, then please contact whomever sent you the link to this assessment to let them know.

You should have received over 7 days warning that you would be undertaking this assesment. Please notify [Delyno du Toit](delyno.dutoit@capetown.gov.za) if this was not the case.

### Things to focus on
Over and and above the tasks specified below, there are particular aspects of each position that we would like you to pay attention to:

* Data Scientist candidates - we're looking for both good, statistical insight into problems, as well as the ability to communicate complex topics. Please make special effort to highlight what you believe to be the crux of a particular problem, as well as how your work addresses it.
* Data Engineer candidates - as the key enablers of our unit's work, we really want to see work done in a sustainable manner: writing for easy comprehension, testing, clean code, modularity all bring us joy.
* Data Analyst candidates - we consider success for our analysts when they provide the insights that inform actual decisions. Hence, we want evidence of both the ability to surface these insights from data, as well as the rhetorical skill in conveying the implications thereof. Your audience is intelligent, but non-specialist.

### Candidates where programming is required (Data Scientist and Engineers)
Requirements and notes:
* Our primary programming languages are `python` and `R`. We will accept code that is packaged in `.py`, `.ipynb`, `.R` and `.Rmd` files. 
* Bash or similar scripting language files are fine for glue. You may develop in any development environment you choose. 
* We expect to be able to clone your repo, immediately identify what script to execute from your README file, and execute it to completion with no human interaction. 
  In order to ensure that our environment has the right libraries or packages, please follow standard python (PEP8) or R guidelines for structure in your code, i.e place `import` and `library()` commands at the top of your scripts.
* If your repo does not clone and run, we will not attempt to fix it.
* If your analysis makes use of any external data, the data must either be included in the repo, or be downloaded automatically during script execution.

### Candidates where programming is not required (Data Analysts)
*Note* If you prefer, you may submit using the requirements described above.

You can use any tool to produce the output, e.g. Python, R, Excel, Power BI, Tableau, etc. The final deliverable needs to be a pdf report with your analysis.

## How to submit
### Candidates where programming is required (Data Scientist;  Engineers and Visualization Engineers)
1. Clone this repository and load it into your development environment. 
2. Work the challenge, committing regularly to document your progress. Try have structured, meaningful commits, where each one adds significant functionality in a coherent manner.
3. Host your repository somewhere that is publicly accessible. If you're using GitHub, please use a fork of our original repository.
4. Inform us via email that your challenge is complete, including a link to your repo. Be sure to make sure it is set to public.

**Be sure to 'watch' this repo for changes - we may push bugfixes**

NOTE: If you would like to _improve_ the content of this repository, by fixing typos or perhaps enhancing the challenge, please do so by submitting a pull request.

### Candidates where programming is not required (Data Analysts)
*NB* If you prefer, you may submit using the workflow described above.

1. Download this repository using the Code -> `Download ZIP` option in the top right-hand corner.
2. Add your work into this folder.
3. Create a compressed archive file with all of your work in it.
4. Send us an email, with your archived project attached. If it is larger than 10 MB, then share it via a cloud storage service such as DropBox, and include the link in your email. 

## Challenge
Follow the below steps, completing those indicated as relevant to the positions for which you are interviewing. If there are any steps that you can not complete after a reasonable amount of effort, rather move on to later steps, attempting everything relevant at least once.

For all roles, we expect the challenge response to include what you consider to be role-appropriate testing and validation. For example, a Data Scientist might want to include MAPE scores or confusion matrices. A Data Engineer may want to include logging and data quality validation tests, as well as unit and even integration tests. A Data Analyst might want to plot histograms of the data in question to ensure that outliers aren't overwhelming your analysis.

Your code should be well formatted according to generally accepted style guides and include whatever is necessary for a team-mate unfamiliar with it to maintain it.

### 0. Setup
#### Data
We have made the following datasets available (each filename is a link). These are all available in an AWS bucket `cct-ds-code-challenge-input-data`, in the `af-south-1` region, with the object name being the filenames below):
* [`sr.csv.gz`](https://cct-ds-code-challenge-input-data.s3.af-south-1.amazonaws.com/sr.csv.gz) contains 12 months of service request data, where each row is a service request. A service request is a request from one of the residents of the City of Cape Town to undertake significant work. This is an important source of information on service delivery, and our performance thereof. *Note* as indicated by the extension, this file is compressed.
* [`sr_hex.csv.gz`](https://cct-ds-code-challenge-input-data.s3.af-south-1.amazonaws.com/sr_hex.csv.gz) contains the same data as `sr.csv` as well as a column `h3_level8_index`, which contains the appropriate resolution level 8 H3 index for that request. If the request doesn't have a valid geolocation, the index value will be `0`. *Note* as indicated by the extension, this file is compressed.
* [`sr_hex_truncated.csv`](https://cct-ds-code-challenge-input-data.s3.af-south-1.amazonaws.com/sr_hex_truncated.csv) is a truncated version of `sr_hex.csv`, containing only 3 months of data.
* [`city-hex-polygons-8.geojson`](https://cct-ds-code-challenge-input-data.s3.af-south-1.amazonaws.com/city-hex-polygons-8.geojson) contains the [H3 spatial indexing system](https://h3geo.org/) polygons and index values for the bounds of the City of Cape Town, at resolution level 8.
* [`city-hex-polygons-8-10.geojson`](https://cct-ds-code-challenge-input-data.s3.af-south-1.amazonaws.com/city-hex-polygons-8-10.geojson) contains the [H3 spatial indexing system](https://h3geo.org/) polygons and index values for resolution levels 8, 9 and 10, for the City of Cape Town.

In some of the tasks below you will be creating datasets that are similar to these, feel free to use the provided files to validate your work.

#### Dummy AWS Credentials
We have made AWS credentials available in the following file, with the appropriate permissions set, [here](https://cct-ds-code-challenge-input-data.s3.af-south-1.amazonaws.com/ds_code_challenge_creds.json).

*Note* These creds don't have any special access, other than what is already set on these resources for anonymous access. These are more provided to make using the various AWS client libraries easier.

### 1. Data Extraction (if applying for a Data Engineering Position)
Use the [AWS S3 SELECT](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-glacier-select-sql-reference-select.html) command to read in the H3 resolution 8 data from `city-hex-polygons-8-10.geojson`. Use the `city-hex-polygons-8.geojson` file to validate your work.

Please log the time taken to perform the operations described, and within reason, try to optimise latency and computational resources used. Please also note the comments above about the nature of the code that we expect.

### 2. Initial Data Transformation (if applying for a Data Engineering and/or Science Position)
Join the equivalent of the contents of the file `city-hex-polygons-8.geojson` to the service request dataset, such that each service request is assigned to a single H3 resolution level 8 hexagon. Use the `sr_hex.csv` file to validate your work.

For any requests where the `Latitude` and `Longitude` fields are empty, set the index value to `0`.

Include logging that lets the executor know how many of the records failed to join, and include a join error threshold above which the script will error out. Please motivate why you have selected the error threshold that you have. Please also log the time taken to perform the operations described, and within reason, try to optimise latency and computational resources used.

### 3. Descriptive Analytic Tasks (if applying for a Data Analyst Position)
Please use the `sr_hex_truncated.csv` dataset to address the following.

Please provide the following:
1. An answer to the question "In which suburbs should the Water and Sanitation directorate concentrate their infrastructure improvement efforts?". Please motivate how you related the data provided to infrastructure issues.
2. Provide a visual mock of a dashboard for the purpose of monitoring progress in applying the insights developed in (1). It should focus the user on  performance pain points. Add a note for each visual element, explaining how it helps fulfill this overall function. Please also provide a brief explanation as to how the data provided would be used to realise what is contained in your mock.
3. Identify value-adding insights for the management of Water and Sanitation, from the dataset provided, with regards to water provision within the City.
 
An Executive-level, non-specialist person should be able to read this report and follow your analysis without guidance.

### 4. Predictive Analytic Tasks (if applying for a Data Science Position)
Using the `sr_hex.csv` dataset, please chose __two__ of the following:
1. *Time series challenge*: Predict the weekly number of expected service requests per hex that will be created each week, for the next 4 weeks.
2. *Introspection challenge*: 
  1. Reshape the data into number of requests created, per type, per H3 level 8 hex in the last 12 months. 
  2. Choose a type, and then develop a model that predicts the number of requests of that type per hex.
  3. Use the model developed in (2) to predict the number in (1).
  4. Based upon the model, and any other analysis, determine the drivers of requests of that particular type(s).
3. *Classification challenge*: Classify a hex as sparsely or densely populated, solely based on the service request data. Provide an explanation as to how you're using the data to perform this classification. Using your classifier, please highlight any unexpected or unusual classifications, and comment on why that might be the case.
4. *Anomaly Detection challenge*: Reshape the data into the number of requests created per department, per day. Please identify any days in the first 6 months of 2020 where an anomalous number of requests were created for a particular department. Please describe how you would motivate to the director of that department why they should investigate that anomaly. Your argument should rely upon the contents of the dataset and/or your anomaly detection model.
2
Feel free to use any other data you can find in the public domain, except for task (3).

**The final output of the execution of your code should be a self-contained `html` file or executed `ipynb` file that is your report.** 
 
A statistically minded layperson should be able to read this report and follow your analysis without guidance.

Please log the time taken to perform the operations described, and within reason, try to optimise latency and computation resources used. Please also note the comments above with respect to the nature of work that we expect from data scientists.

### 5. Further Data Transformations (if applying for a Data Engineering Position)
1. Create a subsample of the data by selecting all of the requests in `sr_hex.csv.gz` which are within 1 minute of the centroid of the BELLVILLE SOUTH official suburb. You may determine the centroid of the suburb by the method of your choice, but if any external data is used, your code should programmatically download and perform the centroid calculation. Please clearly document your method.

2. Augment your filtered subsample of `sr_hex.csv.gz` from (1) with the appropriate [wind direction and speed data for 2020](https://www.capetown.gov.za/_layouts/OpenDataPortalHandler/DownloadHandler.ashx?DocumentName=Wind_direction_and_speed_2020.ods&DatasetDocument=https%3A%2F%2Fcityapps.capetown.gov.za%2Fsites%2Fopendatacatalog%2FDocuments%2FWind%2FWind_direction_and_speed_2020.ods) from the Bellville South Air Quality Measurement site, from when the notification was created. All of the steps for downloading and preparing the wind data, as well as the join should be performed programmatically within your script.

3. Write a script which anonymises your augmented subsample from (2), but preserves the following precisions (You may use H3 indice or lat/lon coordinates for your spatial data):
   * location accuracy to within approximately 500m
   * temporal accuracy to within 6 hours
Please also remove any columns which you believe could lead to the resident who made the request being identified. We expect in the accompanying report that you will justify as to why this data is now anonymised. Please limit this commentary to less than 500 words. If your code is written in a code notebook such as Jupyter notebook or Rmarkdown, you can include this commentary in your notebook.

### 6. Data Visualization Task (if applying for a Data Visualization Engineering Position)

Using the `sr_hex_truncated.csv` dataset and open source web development technologies, develop a data visualization / dashboard that help to answer the question:

*"In which suburbs should the Water and Sanitation directorate concentrate their infrastructure improvement efforts?".*

The data visualization / dashboard must include the following:

1.    A chart (plot) or charts (plots) that helps to answer the above question.
2.    A spatial map that helps to answer the above question.
3.    Make (1) and (2) interactive to allow users to explore the data and uncover insights
4.    Cross plot brushing: a filter on the map must update the chart(s) accordingly with the filter, and vice versa.
5.    Data Storytelling: in a separate markdown document, use the dataset and your visualisations to outline a data-driven story that answers the above question. In your document, describe how your visualisations support your narrative.
6.    Design Principles: Can you explain why you have chosen certain colors (e.g. for legends), fonts, the layout or anything else that will help us understand your thinking in designing the data visualization / dashboard.
7.    Publish your work using online service like https://pages.github.com/ or usinf any other means you are familiar with.  We want to see the end product and interact with it.

Please also note the comments above about the nature of the code that we expect.

## Contact
You can contact gordon.inggs and/or colinscott.anthony @ capetown.gov.za for any questions on the above.
