# data-orig #

The `data-orig` folder contains original data files downloaded from various websites.  The contents of each file are described below, as well as the methodology used to obtain the data and mapping to the joined dataset.

## Colorado-County-Basin-Intersection.csv ##

This file is a combination of the attribute tables of a Colorado counties shapefile and an Interbasin Compact Committee (IBCC) basin shapefile, used to calculate the fraction of a county's area within each basin.  The shapefiles were opened in QGIS and a new field was added to the county shapefile and the area of the county was calculated using the Field Calculator.  The two shapefiles were then joined using the Vector/Geoprocessing Tools/Intersection tool.  The area of each new polygon was then calculated using the same method as described above.  Then the intersected polygon areas were divided by the associated county's area to calculate the fraction of the basin in that county.  The intersected polygons shapefile was exported as this CSV file.
**OWF is working on a process to automate this methodology within QGIS.  Once the process is automated, OWF will update this documentation to describe the methodology and the command files used for processing.  Because of this, OWF is electing to not further describe this CSV file knowing that the process will change.**


## Colorado-Counties-WGS84.geojson ##

This file is a map of Colorado counties downloaded from the Colorado Water Conservation Board (CWCB)'s [Data Viewer](https://www.coloradodnr.info/h5v/Index.html?viewer=cwcbviewer).  The County layer is within the Admin Boundary Category.  The shapefile was opened in QGIS and the coordinate reference system was converted to WGS 84 so that the map can be viewed on GitHub.  The shapefile was then saved in GeoJSON format. 
OWF has included the file in the `data-orig` folder rather than the `data` folder because OWF has not currently made any additions to the map that add value. 


## Colorado-DOLA-LocalGovt-IDs-Counties.csv ##

This file is a copy of the Department of Local Affairs (DOLA)'s [Local Government Information System](https://dola.colorado.gov/lgis/counties.jsf) website that contains local government IDs (DOLA_LG_ID).  Local government IDs are useful for linking DOLA and perhaps other State datasets.  These data are not available in a machine-readable, downloadable format via a direct URL.  Therefore, the data were copied directly from the website data table and pasted into Excel.  It was necessary to convert LG IDs to text to preserve leading zeroes.  IDs with leading zeroes needed to have those zeroes added back in to make sure that the LG ID is a 5-digit number. The file was then saved in CSV format.  **OWF is working on a process to automatically download DOLA_LG_IDs within TSTool.  This will allow for easier processing of data and to check if any updates have been made to the dataset.**  

The file contains the following data columns.

* **County Name:** -- name of the county; text format; manually cross-referenced to the **CountyName** column in the main dataset
* **LG ID:** -- 5-digit identifier used by DOLA; converted to text format to preserve leading zeroes; is the **DOLA_LG_ID** column in the main dataset

Once the "County Name:" column was cross-referenced to the **CountyName** column in the main dataset, then the "LG ID:" column was pasted into the main dataset and the column renamed to **DOLA_LG_ID**.


## Colorado-FIPS-Counties.csv ##

This file contains original data downloaded from the [U.S.Census Bureau](https://www.census.gov/geo/reference/codes/cou.html) containing Federal Information Processing Standard (FIPS) IDs for "Counties".  FIPS IDs are useful for linking federal datasets.  "Colorado" was selected under the "Select a File" option and the data are available as a [comma-delimited file](https://www2.census.gov/geo/docs/reference/codes/files/st08_co_cou.txt).  The comma-delimited file was opened directly in TSTool using the WebGet() command.  The data were [processed](https://github.com/OpenWaterFoundation/owf-data-co-counties/blob/master/data-orig-process/Process-original-data-to-csv.TSTool) to create column headings for the data and then saved in CSV format.

The file contains the following data columns.

* **State** -- 2-letter state postal code, "CO" for Colorado; not used in main dataset
* **StateFP** -- 2-digit state FIPS code, "08" for Colorado; not used in main dataset
* **CountyFP** -- county 5-digit FIPS code; converted to text format to preserve leading zeroes; is the **FIPS_ID** column in the main dataset
* **CountyName** -- county name and legal/statistical area description; text format; is the **CountyName** column in the main dataset with "County" removed from the name 
* **ClassFP** -- FIPS class code; see website; text format; not used in the main dataset 


## Colorado-GNIS-Civil.csv ##

This file contains original data downloaded from the [Geographic Names Information System (GNIS)](https://geonames.usgs.gov/apex/f?p=138:1:0::NO:::) containing GNIS IDs.  GNIS IDs are useful for linking federal datasets.  "Colorado" was selected for the State and "Civil" for the Feature Class.  GNIS data are available as pipe-delimited files that must be manually downloaded in CSV format.  The downloaded file was opened in Excel using the Get External Data From Text option to make sure identifiers are formatted properly.  The file was then renamed and saved again in CSV format.  **OWF is working on a process to automatically download GNIS IDs within TSTool.  This will allow for easier processing of data and to check if any updates have been made to the dataset.**

The file contains the following data columns.

* **Feature Name** -- name of either the municipality, county or division, with the words "County", "Division", "Town of" or "City of" contained in the name; text format; manually cross-referenced to the **CountyName** column in the main dataset
* **ID** -- GNIS ID; converted to text format to preserve leading zeroes; is the **GNIS_ID** column in the main dataset
* **Class** -- class of the feature; note that all are "Civil"; not used in main dataset
* **County** -- county(s) in which the county is contained; text format; already provided in the main dataset
* **State** -- state the feature is located in, "CO" for Colorado; not used in main dataset
* **Latitude** -- latitude in degrees-minutes-seconds; integer plus text format; not used in main dataset
* **Longitude** -- longitude in degrees-minutes-seconds; integer plus text format; not used in main dataset
* **Ele(ft)** -- elevation of the feature, in feet; integer format; not used in main dataset
* **Map** -- USGS topographic map name; text format; not used in main dataset
* **BGN Date** -- Board of Geographic Names date; date format; not used in main dataset
* **Entry Date** -- date entered into the system; date format; not used in main dataset

Once the "Feature Name" column was cross-referenced to the **CountyName** column in the main dataset, then the "ID" column was pasted into the main dataset and the column renamed to **GNIS_ID**.
